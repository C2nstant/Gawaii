<?php

error_reporting(E_ALL);                    // Report all errors;
ini_set('display_errors', 1);              // Display errors on page
ini_set('log_errors', 1);                  // Log errors to a file
ini_set('error_log', dirname(__DIR__) . '/php-error.log'); // Set error log file

// DATABASE FUNCTION
function pdo(PDO $pdo, string $sql, array $arguments = null)
{
    if (!$arguments) {                   // If no arguments
        return $pdo->query($sql);        // Run SQL and return PDOStatement object
    }
    $statement = $pdo->prepare($sql);    // If arguments prepare statement
    $statement->execute($arguments);     // Execute statement
    return $statement;                   // Return PDOStatement object
}

// FORMATTING FUNCTIONS
function html_escape($text): string
{
    // Next line is an update for PHP 8.1 see https://phpandmysql.com/updates/passing-null-to-string-functions/
    $text = $text ?? ''; // If the value passed into function is null set $text to a blank string

    return htmlspecialchars($text, ENT_QUOTES, 'UTF-8', false); // Return escaped string
}

function format_date(string $string): string
{
    $date = date_create_from_format('Y-m-d H:i:s', $string);    // Convert to DateTime object
    return $date->format('F d, Y');                             // Return in format Jan 31, 2030
}

// ERROR AND EXCEPTION HANDLING FUNCTIONS
// Convert errors to exceptions
set_error_handler('handle_error');
function handle_error($error_type, $error_message, $error_file, $error_line)
{
    throw new ErrorException($error_message, 0, $error_type, $error_file, $error_line); // Turn into ErrorException
}

// Handle exceptions - log exception and show error message (if server does not send error page listed in .htaccess)
set_exception_handler('handle_exception');
function handle_exception($e)
{
    error_log($e);                        // Log the error
    http_response_code(500);              // Set the http response code
    echo "<h1>Sorry, a problem occurred</h1>   
          The site's owners have been informed. Please try again later.";
}

// Handle fatal errors
register_shutdown_function('handle_shutdown');
function handle_shutdown()
{
    $error = error_get_last();            // Check for error in script
    if ($error !== null) {                // If there was an error next line throws exception
        $e = new ErrorException($error['message'], 0, $error['type'], $error['file'], $error['line']);
        handle_exception($e);             // Call exception handler
    }
}

// REDIRECT FUNCTION
function redirect(string $url, array $params = []): void
{
    if (!empty($params)) {
        $url .= (strpos($url, '?') === false ? '?' : '&') . http_build_query($params);
    }
    header('Location: ' . $url);
    exit;
}

// CREATE FILENAME FUNCTION
function create_filename(string $filename, string $upload_path): string
{
    $basename = pathinfo($filename, PATHINFO_FILENAME);
    $extension = pathinfo($filename, PATHINFO_EXTENSION);
    $basename = preg_replace('/[^A-z0-9]/', '-', $basename);
    $basename = trim($basename, '-');
    $new_filename = $basename . '.' . $extension;
    $counter = 1;
    while (file_exists($upload_path . $new_filename)) {
        $new_filename = $basename . "-{$counter}." . $extension;
        $counter++;
    }
    return $new_filename;
}