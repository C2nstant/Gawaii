<?php
declare(strict_types = 1);
require 'includes/database-connection.php';
require 'includes/functions.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if (!$id) {
    include 'notfound.php';
    exit;
}

$sql = "SELECT category_id, name, description FROM category WHERE category_id = :id;";
$category = pdo($pdo, $sql, [$id])->fetch();
if (!$category) {
    include 'notfound.php';
    exit;
}

$sql = "SELECT a.article_id, a.title, a.summary, a.category_id, a.member_id, c.name AS category, CONCAT(m.forename, ' ', m.surname) AS author, i.file AS image_file, i.alt AS image_alt
        FROM article AS a
        JOIN category AS c ON a.category_id = c.category_id
        JOIN member AS m ON a.member_id = m.member_id
        LEFT JOIN image AS i ON a.image_id = i.image_id
        WHERE a.category_id = :id AND a.published = 1
        ORDER BY a.article_id DESC;";
$articles = pdo($pdo, $sql, [$id])->fetchAll();

$sql = "SELECT category_id, name FROM category WHERE navigation = 1;";
$navigation = pdo($pdo, $sql)->fetchAll();
$section = $category['category_id'];
$title = $category['name'];
$description = $category['description'];
?>

<?php include 'includes/header.php'; ?>
<main class = "container" id = "content">
    <section class = "header">
        <h1><?= html_escape($category['name']) ?></h1>
        <p><?= html_escape($category['description']) ?></p>
    </section>
    <section class = "grid">
        <?php foreach ($articles as $article) { ?>
            <article class = "summary">
                <a href = "article.php?id=<?= $article['article_id'] ?>">
                    <img src ="img/<?= html_escape($article['image_file'] ?? 'blank.png') ?>"
                        alt = "<?= html_escape($article['image_alt']) ?>">
                    <h2><?= html_escape($article['title']) ?></h2>
                    <p><?= html_escape($article['summary']) ?></p>
                </a>
                <p class = "credit">
                    Posted in <a href="category.php?id=<?= $article['category_id'] ?>"><?= html_escape($article['category']) ?></a> by <a href="member.php?id=<?= $article['member_id'] ?>"><?= html_escape($article['author']) ?></a>
                </p>
            </article>
        <?php } ?>
    </section>
</main>

<?php include 'includes/footer.php'; ?>