<?php
declare(strict_types = 1);
require 'includes/database-connection.php';
require 'includes/functions.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if (!$id) {
    include 'notfound.php';
    exit;
}

$sql = "SELECT a.article_id, a.title, a.summary, a.content, a.created, a.category_id, a.member_id, c.name AS category, CONCAT(m.forename, ' ', m.surname) AS author, i.file AS image_file, i.alt AS image_alt
        FROM article AS a
        JOIN category AS c ON a.category_id = c.category_id
        JOIN member AS m ON a.member_id = m.member_id
        LEFT JOIN image AS i ON a.image_id = i.image_id
        WHERE a.article_id = :id AND a.published = 1";
$article = pdo($pdo, $sql, [$id])->fetch();
if (!$article) {
    include 'notfound.php';
    exit;
}

$sql = "SELECT category_id, name FROM category WHERE navigation = 1;";
$navigation = pdo($pdo, $sql)->fetchAll();
$section = $article['category_id'];
$title = $article['title'];
$description = $article['summary'];

?>
<?php include 'includes/header.php'; ?>
    <main class = "article container" id = "content">

        <section class = "image">
            <img src = "img/<?= html_escape($article['image_file'] ?? 'blank.png') ?>" 
            alt = "<?= html_escape($article['image_alt']) ?>">
        </section>
        <section class = "text">
            <h1><?= html_escape($article['title']) ?></h1>
            <div class = "date"><?= format_date($article['created']) ?></div>
            <div class = "content"><?= html_escape($article['content']) ?></div>
            <p class = "credit">
                Posted in <a href="category.php?id=<?= $article['category_id'] ?>"><?= html_escape($article['category']) ?></a> by <a href="author.php?id=<?= $article['member_id'] ?>"><?= html_escape($article['author']) ?></a>
            </p>
        </section>

    </main>
<?php include 'includes/footer.php'; ?>