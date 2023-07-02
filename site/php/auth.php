<?php
session_start();
require_once('db.php');

if (isset($_POST['login'])) {

    
if($_SERVER["REQUEST_METHOD"] == "POST") {
    // Проверка наличия логина и пароля
    var_dump($_POST['email']);
    var_dump($_POST['password']);
    if(isset($_POST['email']) && isset($_POST['password'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];
     

        // Получение данные из базы данных
        $query = "SELECT * FROM users WHERE email = '$email' and password = '$password '";
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
        $count = mysqli_num_rows($result);

        if ($count == 1) {
            $_SESSION['login_user'] = $email;
            header("location: ../account.php");
        }
        // Если пользователь не найден, выводим сообщение об ошибке
        else {
            $error = "Неправильный логин или пароль";
            header("location: ../index.php");
        }
    }
}

}
?>