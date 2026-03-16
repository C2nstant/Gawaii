<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Creative Folk Admin</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="preconnect" href="https://fonts.gstatic.com"> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap">
    <link rel="shortcut icon" type="image/png" href="../img/Gawaii_Logo_Favicon.png">
  </head>
  <body>
    <?php
    // Enable error logging to a file in the correct directory
    ini_set('log_errors', 1);
    ini_set('error_log', dirname(__DIR__) . '/php-error.log');
    ini_set('display_errors', 1);
    error_reporting(E_ALL);
    ?>
    <header class="header-admin">
      <div class="container">
        <a class="skip-link" href="#content">Skip to content</a>
        <div class="logo">
          <a href="index.php"><img src="../img/Gawaii_Logo.png" alt="Gawaii"></a>
        </div>
        <nav>
          <button id="toggle-navigation" aria-expanded="false">
            <span class="icon-menu"></span><span class="hidden">Menu</span>
          </button>
          <ul id="menu">
            <li><a href="articles.php">Articles</a></li>
            <li><a href="categories.php">Categories</a></li>
            <li><a href="../search.php">
              <span class="icon-search"></span><span class="search-text">Search</span>
            </a></li>
          </ul>
        </nav>
      </div><!-- .container -->
    </header>