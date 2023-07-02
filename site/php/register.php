<?php


if (isset($_POST['registration'])) {
    // Получаем данные из формы
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Проверяем, что все поля заполнены
    if (empty($email) && empty($password)) {
        exit();
    }
   
    $conn = mysqli_connect("localhost", "root", "", "uvelir");
    // Проверяем подключение к базе данных
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Добавляем пользователя в базу данных
    $sql = mysqli_query($conn,"INSERT INTO users ( email, password, code) VALUES ( '$email', '$password', '0')");

    mysqli_close($conn);
    header('Location: ../index.php ');
}
?>