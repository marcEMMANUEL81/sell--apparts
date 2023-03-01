<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

require_once('./db.php');

$method = $_SERVER['REQUEST_METHOD'];
$db = new Database();
$con = $db->connect();

$stmt = $con->prepare('SELECT vendu AS vendu, COUNT(*) AS totalLocation FROM apparts WHERE vendu = 0');
$stmt->execute();
$data = $stmt->fetch();
echo json_encode(['nbrAppartsLibre' => $data['totalLocation']]);