<?php 
$code = uniqid();
$email = 'da-2333@mail.ru';
$sql = "INSERT INTO confirmation_codes (email, code) VALUES ('$email', '$code')";
$result = mysqli_query($conn, $sql);

$to = 'da-2333@mail.ru';
$subject = 'Подтверждение электронной почты';
$message = 'Код для подтверждения: ' . $code;
$headers = 'From: noreply@mail.ru' . "\\r\\n" .
        'Reply-To: noreply@mail.ru' . "\\r\\n" .
        'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);

$code = $_POST['code'];
$email = 'da-2333@mail.ru';
$sql = "SELECT * FROM users WHERE email = '$email' AND code = '$code'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
    // Код подтвержден
} else {
    // Код неверный
}

?>