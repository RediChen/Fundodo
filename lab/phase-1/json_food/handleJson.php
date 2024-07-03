<?php
include("../../console-lib.php");
$jsonStr = file_get_contents('./course.json');
$jsonData = json_decode($jsonStr, true);

$cols = $jsonData["columns"];

$rows = $jsonData["products"];

// printArray($cols);
// printArray($rows);

$occurrences = [];

foreach ($rows as $row) {
    $occurrences[] = count($row);
}

$stat = array_count_values($occurrences);

printArray($stat);

printArray($rows[5]);
