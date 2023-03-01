<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

require_once('./db.php');

$method = $_SERVER['REQUEST_METHOD'];
$db = new Database();
$con = $db->connect();

$stmt = $con->prepare('SELECT id_proprio, COUNT(*) AS totalBiens FROM apparts GROUP BY id_proprio');
$stmt->execute();
$data = $stmt->fetchAll();
echo json_encode($data);