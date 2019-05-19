<?php
if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW'])) {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    echo 'Text to send if user hits Cancel button';
    // exit;
} else if (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) {
    // TODO: GET ADMIN from DB or have a single hard codes value.
    if ((strtolower($_SERVER['PHP_AUTH_USER']) == strtolower('test')) && $_SERVER['PHP_AUTH_PW'] === 'test1234') {
        // echo "<p>Hello {$_SERVER['PHP_AUTH_USER']}.</p>";
        // echo "<p>You entered {$_SERVER['PHP_AUTH_PW']} as your password.</p>";

        // TODO: RETURN CSV ROSTER from DB

    } else {
        header('HTTP/1.0 401 Unauthorized');
    }
} else {
    header('HTTP/1.0 500 Unauthorized');
}
