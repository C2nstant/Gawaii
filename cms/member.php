<?php
declare(strict_types = 1);
require 'includes/database-connection.php';              // Create PDO object
require 'includes/functions.php';                        // Include functions

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT); // Validate id
if (!$id) {                                              // If no valid id
    include 'notfound.php';                              // Page not found
    exit;
}

$sql    = "SELECT forename, surname, joined, picture FROM member WHERE member_id = :id;"; // SQL
$member = pdo($pdo, $sql, [$id])->fetch();              // Get member data
if (!$member) {                                          // If array is empty
    include 'notfound.php';                              // Page not found
    exit;
}

$sql = "SELECT a.article_id, a.title, a.summary, a.category_id, a.member_id,
               c.name AS category,
               CONCAT(m.forename, ' ', m.surname) AS author,
               i.file AS image_file,
               i.alt  AS image_alt
        FROM article   AS a
        JOIN category  AS c ON a.category_id = c.category_id
        JOIN member    AS m ON a.member_id   = m.member_id
        LEFT JOIN image AS i ON a.image_id   = i.image_id
        WHERE a.member_id = :id AND a.published = 1
        ORDER BY a.article_id DESC;";                            // SQL
$articles = pdo($pdo, $sql, [$id])->fetchAll();         // Member's articles

$sql        = "SELECT category_id, name FROM category WHERE navigation = 1;"; // SQL to get categories
$navigation = pdo($pdo, $sql)->fetchAll();               // Get categories
$section    = '';                                        // Current category
$title      = $member['forename'] . ' ' . $member['surname']; // HTML <title> content
$description = $title . ' on Gawaii';                   // Meta description
?>
<?php include 'includes/header.php'; ?>
  <main class="container" id="content">
    <section class="header">
      <h1><?= html_escape($member['forename']) ?> . <?= html_escape($member['surname']) ?></h1>
      <p class="member"><b>Member since:</b> <?= format_date($member['joined']) ?></p>
      <img src="img/<?= html_escape($member['picture'] ?? 'member.png') ?>"
           alt="<?= html_escape($member['forename']) ?>" class="profile"><br>
    </section>
    <section class="grid">
      <?php foreach ($articles as $article) { ?>
        <article class="summary">
          <a href="article.php?id=<?= $article['article_id'] ?>">
            <img src="img/<?= html_escape($article['image_file'] ?? 'blank.png') ?>"
                 alt="<?= html_escape($article['image_alt']) ?>">
            <h2><?= html_escape($article['title']) ?></h2>
            <p><?= html_escape($article['summary']) ?></p>
          </a>
          <p class="credit">
            Posted in <a href="category.php?id=<?= $article['category_id'] ?>">
              <?= html_escape($article['category']) ?></a>
            by <a href="member.php?id=<?= $article['member_id'] ?>">
              <?= html_escape($article['author']) ?></a>
          </p>
        </article>
      <?php } ?>
    </section>
  </main>
<?php include 'includes/footer.php'; ?>