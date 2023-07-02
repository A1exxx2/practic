<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <title>GK</title>
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="sass/register.css">
</head>
<body class="align">

  <div class="grid align__item">

    <div class="register">

      <svg xmlns="http://www.w3.org/2000/svg" class="site__logo" width="56" height="84" viewBox="77.7 214.9 274.7 412"><defs><linearGradient id="a" x1="0%" y1="0%" y2="0%"><stop offset="0%" stop-color="#8ceabb"/><stop offset="100%" stop-color="#378f7b"/></linearGradient></defs></svg>
      <div class="but">
        <p><a href="index.php">X</a></p>
        </div>
      <h2>Вход</h2>

      <form action="php/auth.php" method="post" class="form">

        <div class="form__field">
          <input type="email" name="email" id="email" placeholder="info@mailaddress.com">
        </div>

        <div class="form__field">
          <input type="password" name="password" id="password" placeholder="••••••••••••">
        </div>
        

        <div class="form__field">
          <input type="submit" name="login" id="login" value="Sign Up">
        </div>

      </form>

      <p>Нет аккаунта? <a href="register.php">Регистрация</a></p>

    </div>

  </div>

</body>
</html>