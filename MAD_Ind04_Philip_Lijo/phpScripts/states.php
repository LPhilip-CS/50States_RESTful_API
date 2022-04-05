<?php

$dbhost = 'cs.okstate.edu';
$dbuser = 'liphili';
$dbpass = 'swif+Pig50';
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, 'liphili');

if (!$conn) {
    die('Could not connect: ' . mysqli_connect_error());
}


// select all data from states table
$sql = "SELECT * FROM states";
$query = mysqli_query($conn, $sql);

$results = [
    'states' => $query->fetch_all(MYSQLI_ASSOC)
];

$conn->close();

echo json_encode($results);

?>

