<?php
// Подключение к базе данных
$conn = mysqli_connect("localhost", "root", "", "uvelir");
// Проверка подключения
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>