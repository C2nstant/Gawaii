<?php
declare(strict_types = 1);                                // Use strict types
include '../includes/database-connection.php';            // Database connection
include '../includes/functions.php';                      // Functions
include '../includes/validate.php';                       // Validation functions

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT); // Get and validate id

$image = [
    'file' => '',
    'alt' => '',
];                                                        // Initialize image array
$errors = [
    'alt' => '',
    'warning' => '',
];                                                        // Initialize error message

if ($id) {                                                // If valid article id
    $sql = "SELECT a.article_id, a.title, a.summary, a.content, a.created, a.category_id, a.member_id, a.published, a.image_id, c.name AS category, CONCAT(m.forename, ' ', m.surname) AS author, i.file AS image_file, i.alt AS image_alt FROM article AS a JOIN category AS c ON a.category_id = c.category_id JOIN member AS m ON a.member_id = m.member_id LEFT JOIN image AS i ON a.image_id = i.image_id WHERE a.article_id = :id;";                            // SQL to get image data
    $article = pdo($pdo, $sql, [$id])->fetch();
    if (!$article) {
        redirect('articles.php', ['failure' => 'Article not found']);
    }
}
if (!$image) {                                            // If no image
    redirect('article.php', ['id' => $id]);               // Redirect
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {               // If form was submitted
    $image['alt'] = $_POST['image_alt'];                  // Get alt text

    $errors['alt'] = (is_text($image['alt'], 1, 254))
        ? '' : 'Alt text for image should be 1 - 254 characters.'; // Validate alt text

    if ($errors['alt']) {                                   // If alt text not long enough
        $errors['warning'] = 'Please correct error below';  // Store error message
    } else {                                                // Otherwise
        unset($image['file']);                              // Remove file from $image array
        $sql = "UPDATE image 
                   SET alt = :alt 
                 WHERE image_id = :id;";                          // SQL to update image table
        pdo($pdo, $sql, $image);                            // Update alt text
        redirect('article.php', ['id' => $id]);             // Send back to article page
    }
}
?>
<?php include '../includes/admin-header.php'; ?>
  <main class="container admin" id="content">
    <form action="alt-text-edit.php?id=<?= $id ?>" method="POST" class="narrow">
      <h1>Update Alt Text</h1>
      <?php if ($errors['warning']) { ?><div class="alert alert-danger"><?= $errors['warning'] ?></div><?php } ?>

      <div class="form-group">
        <label for="image_alt">Alt text: </label>
        <input type="text" name="image_alt" id="image_alt" value="<?= html_escape($image['alt']) ?>"  class="form-control">
        <span class="errors"><?= $errors['alt'] ?></span>
      </div>

      <div class="form-group">
        <input type="submit" name="delete" value="Confirm" class="btn btn-primary btn-save">
      </div>

      <img src="../img/<?= $image['file'] ?>" alt="<?= html_escape($image['alt']) ?>">
    </form>
  </main>
<?php include '../includes/admin-footer.php'; ?>