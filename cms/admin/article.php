<?php
declare(strict_types = 1);
include '../includes/database-connection.php';
include '../includes/functions.php';
include '../includes/validate.php';

$uploads = dirname(__DIR__, 1) . DIRECTORY_SEPARATOR . 'img' . DIRECTORY_SEPARATOR; // Image upload folder
$file_types      = ['image/jpeg', 'image/png', 'image/gif',];
$file_extensions = ['jpg', 'jpeg', 'png', 'gif',];
$max_size        = '5242880';   

$id          = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT); 
$temp        = $_FILES['image']['tmp_name'] ?? '';               
$destination = '';                                            

$article = [
    'id'          => $id,
    'title'       => '',
    'summary'     => '',
    'content'     => '',
    'member_id'   => 0,
    'category_id' => 0,
    'image_id'    => null,
    'published'   => false,
    'image_file'  => '',
    'image_alt'   => '',
];                           

$errors  = [
    'warning'     => '',
    'title'       => '',
    'summary'     => '',
    'content'     => '',
    'author'      => '',
    'category'    => '',
    'image_file'  => '',
    'image_alt'   => '',
];            

if ($id) {                                                         // If have id
    $sql = "SELECT a.article_id, a.title, a.summary, a.content, a.category_id, a.member_id, a.published, a.image_id, i.file AS image_file, i.alt AS image_alt FROM article AS a LEFT JOIN image AS i ON a.image_id = i.image_id WHERE a.article_id = :id;";                                  // SQL to get article
    $article = pdo($pdo, $sql, [$id])->fetch();                       // Get article data

    if (!$article) {                                                  // If article empty
        redirect('articles.php', ['failure' => 'Article not found']); // Redirect
    }
}

$saved_image = $article['image_file'] ? true : false;       // Has an image been uploaded

// Get all members and all categories
$sql     = "SELECT member_id, forename, surname FROM member;";     // SQL to get all members
$authors = pdo($pdo, $sql)->fetchAll();                     // Get all members

$sql        = "SELECT category_id, name FROM category;";             // SQL to get all categories
$categories = pdo($pdo, $sql)->fetchAll();                  // Get all categories


// Part B: Get and validate form data
if ($_SERVER['REQUEST_METHOD'] == 'POST') {                 // If form submitted
    // If file bigger than limit in php.ini or .htaccess store error message - NOTE: Line updated from book
    $errors['image_file'] = ($_FILES === '' and $_FILES['image']['error'] === 1) ? 'File too big ' : '';

    // If image was uploaded, get image data and validate
    if ($temp and $_FILES['image']['error'] === 0) {                   // If file uploaded and no error
        $article['image_alt'] = $_POST['image_alt'];                   // Get alt text

        // Validate image file
        $errors['image_file'] = in_array(mime_content_type($temp), $file_types)
            ? '' : 'Wrong file type. ';                                // Check file type
        $extension = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION)); // File extension in lowercase
        $errors['image_file'] .= in_array($extension, $file_extensions)
            ? '' : 'Wrong file extension. ';                           // Check file extension
        $errors['image_file'] .= ($_FILES['image']['size'] <= $max_size)
            ? '' : 'File too big. ';                                   // Check size
        $errors['image_alt']  = (is_text($article['image_alt'], 1, 254))
            ? '' : 'Alt text must be 1-254 characters.';               // Check alt text

        // If image file is valid, specify the location to save it
        if ($errors['image_file'] === '' and $errors['image_alt'] === '') { // If valid
            $article['image_file'] = create_filename($_FILES['image']['name'], $uploads);
            $destination = $uploads . $article['image_file'];         // Destination
        }
    }

    // Get article data
    $article['title']       = $_POST['title'];              // Title
    $article['summary']     = $_POST['summary'];            // Summary
    $article['content']     = $_POST['content'];            // Content
    $article['member_id']   = $_POST['member_id'];          // Author
    $article['category_id'] = $_POST['category_id'];        // Category
    $article['published']   = (isset($_POST['published']) and ($_POST['published'] == 1)) ? 1 : 0;   // Is it published?

    // Validate article data and create error messages if it is invalid
    $errors['title']    = is_text($article['title'], 1, 80)
        ? '' : 'Title must be 1-80 characters';
    $errors['summary']  = is_text($article['summary'], 1, 254)
        ? '' : 'Summary must be 1-254 characters';
    $errors['content']  = is_text($article['content'], 1, 100000)
        ? '' : 'Article must be 1-100,000 characters';
    $errors['member']   = is_member_id($article['member_id'], $authors)
        ? '' : 'Please select an author';
    $errors['category'] = is_category_id($article['category_id'], $categories)
        ? '' : 'Please select a category';

    $invalid = implode($errors);                                 // Join errors

    // Part C: Check if data is valid, if so update database
    if ($invalid) {                                              // If invalid
        $errors['warning'] = 'Please correct the errors below';  // Store message
    } else {                                                     // Otherwise
        $arguments = $article;                                   // Save data as $arguments
        try {                                                    // Try to insert data
            $pdo->beginTransaction();                            // Start transaction
            if ($destination) {                                  // If have valid image
                // Crop and save file using GD library instead of Imagick
                $image_info = getimagesize($temp);
                $mime = $image_info['mime'];
                switch ($mime) {
                    case 'image/jpeg':
                        $src_image = imagecreatefromjpeg($temp);
                        break;
                    case 'image/png':
                        $src_image = imagecreatefrompng($temp);
                        break;
                    case 'image/gif':
                        $src_image = imagecreatefromgif($temp);
                        break;
                    default:
                        throw new Exception('Unsupported image type');
                }
                // Crop and resize to 1200x700
                $dst_width = 1200;
                $dst_height = 700;
                $dst_image = imagecreatetruecolor($dst_width, $dst_height);
                $src_width = imagesx($src_image);
                $src_height = imagesy($src_image);
                // Calculate aspect ratio crop
                $src_aspect = $src_width / $src_height;
                $dst_aspect = $dst_width / $dst_height;
                if ($src_aspect > $dst_aspect) {
                    // Source is wider
                    $new_height = $src_height;
                    $new_width = (int)($src_height * $dst_aspect);
                    $src_x = (int)(($src_width - $new_width) / 2);
                    $src_y = 0;
                } else {
                    // Source is taller or equal
                    $new_width = $src_width;
                    $new_height = (int)($src_width / $dst_aspect);
                    $src_x = 0;
                    $src_y = (int)(($src_height - $new_height) / 2);
                }
                imagecopyresampled(
                    $dst_image, $src_image,
                    0, 0, $src_x, $src_y,
                    $dst_width, $dst_height,
                    $new_width, $new_height
                );
                switch ($mime) {
                    case 'image/jpeg':
                        imagejpeg($dst_image, $destination, 90);
                        break;
                    case 'image/png':
                        imagepng($dst_image, $destination, 6);
                        break;
                    case 'image/gif':
                        imagegif($dst_image, $destination);
                        break;
                }
                imagedestroy($src_image);
                imagedestroy($dst_image);

                $sql = "INSERT INTO image (file, alt) 
                        VALUES (:file, :alt);";                  // SQL to add image

                // Run SQL to add image to image table
                pdo($pdo, $sql, [
                    'file' => $arguments['image_file'],
                    'alt' => $arguments['image_alt'],
                ]); 
                $arguments['image_id'] = $pdo->lastInsertId();   // Get new image id
            }
            unset($arguments['image_file'], $arguments['image_alt']); // Cut image data

            if ($id) {
                $sql = "UPDATE article
                           SET title = :title, summary = :summary, content = :content,
                               category_id = :category_id, member_id = :member_id, 
                               image_id = :image_id, published = :published 
                         WHERE article_id = :id;";                       // SQL to update article
                // Only keep keys that match the named parameters
                $updateArgs = [
                    'title' => $arguments['title'],
                    'summary' => $arguments['summary'],
                    'content' => $arguments['content'],
                    'category_id' => $arguments['category_id'],
                    'member_id' => $arguments['member_id'],
                    'image_id' => $arguments['image_id'],
                    'published' => $arguments['published'],
                    'id' => $id, // Use $id directly, not $arguments['id']
                ];
                pdo($pdo, $sql, $updateArgs);                         // Run SQL to update article
            } else {
                $sql = "INSERT INTO article (title, summary, content, category_id, 
                                    member_id, image_id, published)
                             VALUES (:title, :summary, :content, :category_id, :member_id,  
                                    :image_id, :published);";    // SQL to create article
                // Only keep keys that match the named parameters
                $insertArgs = [
                    'title' => $arguments['title'],
                    'summary' => $arguments['summary'],
                    'content' => $arguments['content'],
                    'category_id' => $arguments['category_id'],
                    'member_id' => $arguments['member_id'],
                    'image_id' => $arguments['image_id'],
                    'published' => $arguments['published'],
                ];
                pdo($pdo, $sql, $insertArgs);                         // Run SQL to add article
            }
            $pdo->commit(); // Commit the transaction after successful update/insert
            redirect('articles.php', ['success' => 'Article saved']); // Redirect
        } catch (Exception $e) {                                 // If exception thrown
            $pdo->rollBack();                                    // Roll back SQL changes
            if (file_exists($destination)) {                     // If image file exists
                unlink($destination);                            // Delete image file
            }
            // If the exception was a PDOException and it was an integrity constraint
            if (($e instanceof PDOException) and ($e->errorInfo[1] === 1062)) { 
                $errors['warning'] = 'Article name already in use'; // Store warning
            } else {                                             // Otherwise
                throw $e;                                        // Rethrow exception
            }
        }
    }
    $article['image_file'] = $saved_image ? $article['image_file'] : '';
}
?>
<?php include '../includes/admin-header.php'; ?>
  <form action="article.php?id=<?= $id ?>" method="POST" enctype="multipart/form-data">
    <main class="container admin" id="content">

      <h1>Edit Article</h1>
      <?php if ($errors['warning']) { ?>
        <div class="alert alert-danger"><?= $errors['warning'] ?></div>
      <?php } ?>

      <div class="admin-article">
        <section class="image">
          <?php if (!$article['image_file']) { ?>
            <label for="image">Upload image:</label>
            <div class="form-group image-placeholder">
              <input type="file" name="image" class="form-control-file" id="image"><br>
              <span class="errors"><?= $errors['image_file'] ?></span>
            </div>
            <div class="form-group">
              <label for="image_alt">Alt text: </label>
              <input type="text" name="image_alt" id="image_alt" value="" class="form-control">
              <span class="errors"><?= $errors['image_alt'] ?></span>
            </div>
          <?php } else { ?>
            <label>Image:</label>
            <img src="../img/<?= html_escape($article['image_file']) ?>"
                 alt="<?= html_escape($article['image_alt']) ?>">
            <p class="alt"><strong>Alt text:</strong> <?= html_escape($article['image_alt']) ?></p>
            <a href="alt-text-edit.php?id=<?= $article['article_id'] ?? $id ?>" class="btn btn-secondary">Edit alt text</a>
            <a href="image-delete.php?id=<?= $id ?>" class="btn btn-secondary">Delete image</a><br><br>
          <?php } ?>
        </section>

        <section class="text">
          <div class="form-group">
            <label for="title">Title: </label>
            <input type="text" name="title" id="title" value="<?= html_escape($article['title']) ?>"
                   class="form-control">
            <span class="errors"><?= $errors['title'] ?></span>
          </div>
          <div class="form-group">
            <label for="summary">Summary: </label>
            <textarea name="summary" id="summary"
                      class="form-control"><?= html_escape($article['summary']) ?></textarea>
            <span class="errors"><?= $errors['summary'] ?></span>
          </div>
          <div class="form-group">
            <label for="content">Content: </label>
            <textarea name="content" id="content"
                      class="form-control"><?= html_escape($article['content']) ?></textarea>
            <span class="errors"><?= $errors['content'] ?></span>
          </div>
          <div class="form-group">
            <label for="member_id">Author: </label>
            <select name="member_id" id="member_id">
              <?php foreach ($authors as $author) { ?>
                <option value="<?= $author['member_id'] ?>"
                    <?= ($article['member_id'] == $author['member_id']) ? 'selected' : ''; ?>>
                    <?= html_escape($author['forename'] . ' ' . $author['surname']) ?></option>
              <?php } ?>
            </select>
            <span class="errors"><?= $errors['author'] ?></span>
          </div>
          <div class="form-group">
            <label for="category">Category: </label>
            <select name="category_id" id="category">
              <?php foreach ($categories as $category) { ?>
                <option value="<?= $category['category_id'] ?>"
                    <?= ($article['category_id'] == $category['category_id']) ? 'selected' : ''; ?>>
                    <?= html_escape($category['name']) ?></option>
              <?php } ?>
            </select>
            <span class="errors"><?= $errors['category'] ?></span>
          </div>
          <div class="form-check">
            <input type="checkbox" name="published" value="1" class="form-check-input" id="published"
                <?= ($article['published'] == 1) ? 'checked' : ''; ?>>
            <label for="published" class="form-check-label">Published</label>
          </div>
          <input type="submit" name="update" value="Save" class="btn btn-primary">
        </section><!-- /.text -->
      </div><!-- /.admin-article -->
    </main>
  </form>
<?php include '../includes/admin-footer.php'; ?>