<?php
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$player = $request->player;
session_start();
$response = new \stdClass();
$response->error = null;
$response->messages = [];
$success = false;
header('Content-Type: application/json; charset=UTF-8');
try {
    // LOOK UP BY NATIONAL ID
    require "db/connect.php";
    $query = $mysqli->prepare("SELECT n.national_id AS nid, p.player_id AS pid, p.fname AS fn FROM national AS n JOIN players AS p WHERE p.player_id = n.player_id AND n.national_id = ?");
    $query->bind_param('i', $player->id);
    $query->execute();
    $results = $query->get_result();
    $numrows = $results->num_rows;
    // No rows, new player
    if ($numrows == 0) {
        $response->data = null;
    } else if ($numrows == 1) { // Single record found, returning registrant  (expected)
        $response->data = $results->fetch_assoc();
        $_SESSION['ID'] = $player->id; // set id to session grab in latter calls (security measure)
    } else { // Multi records --> should not happen
        $array = [];
        while ($row = $results->fetch_assoc()) {
            array_push($array, $row);
        }
        $response->data = $array;
    }
    $success = true;
} catch (exception $e) {
    $response->error = $e->getMessage();
    $response->code = 500;
    header('HTTP/1.1 500 Internal Server Error');
    die(json_encode($response));
} finally {
    array_push($response->messages, ($success) ? 'success: true' : 'success: false');
    echo json_encode($response);
}
