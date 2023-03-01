<?php
class Database
{
    private $host = "127.0.0.1";
    private $name = "appart_db";
    private $username = 'marc';
    private $password = '7G))pIHs.BZlfo8r';
    private $port = 8889;
    private $connection;

public function connect(): PDO
{
    $this->connection = null;

    try {
        $this->connection = new PDO(
        'mysql:host=' . $this->host . ';dbname=' . $this->name . ";port=" . $this->port,
        $this->username,
        $this->password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    $this->connection->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION
    );
    } catch (PDOException $e) {
        die(
            'Database connection error : ' .
            $e->getMessage() .
            "\nLine : " .
            $e->getLine()
        );
    }

    return $this->connection;
}}