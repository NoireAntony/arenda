<?php
include 'temp/head.php';
session_start();
include 'temp/database.php';
include 'temp/nav.php';
?>
  <?php
if (!empty($_POST)) {
    $password=$_POST['password'];
    $login=$_POST['login'];
    $_SESSION['password']=$password;
$sql="SELECT * FROM `users` WHERE `password`='$password' AND `login`='$login'";
$result=$mysqli->query($sql);
if($result->num_rows === 0) {
    $message = "Пользователь неверно ввел логин или пароль";
    echo $message;
    exit(); 
}
foreach($result as $row)
{ 
    session_start();
 $_SESSION["id_user"]=$row["id_user"];
 $_SESSION["password"]=$row["password"]; 
 $_SESSION["login"]=$row["login"]; 
echo "Пользователь прошел авторизацию";
}
}
if (!empty($_SESSION)){
    if   ($_SESSION['login']=$login){
   if   ($_SESSION['password']=$password){
       header ('location:zakaz.php'); 
    }
    if($_SESSION['login']=="sklad"){
      if ($_SESSION['password']=="123qwe")
       header ('location:manager.php'); 
   }
if (array_key_exists( "defaut", $_GET) && !is_null ($_GET[ 'default']) ) {
  $defaut = $_GET['defaut'];
  if (stripos ($defaut, "<script") !== false){
    header ("location: ?default=English");
    exit;
  }
}
   }
  }
?>  
      <h1>Авторизация</h1>
<div class="container-fluid">
<h2 style="text-align:center"> <p>Войдите в свой аккунт</p>
<p>Добро пожаловать!<br> Если вы не зарегистрированы, <br>пройдите<a class="nav-link active" aria-current="page" href="register.php">Регистрацию</a>на сайте.</p>
<br><br>
<form method="post" action="autorization.php">
<div class="form-element">
<label>Логин</label>
<input type="login" name="login" required />
</div> <br><br>
<div class="form-element">
<label>Пароль</label>
<input type="password" name="password" required />
</div> <br><br>
<div class="form-element">
<input type="submit" value="Войти">
</div>
</div>
<p>
<?php
     echo $message;
        ?>
        </p>
</form>
</div>
</div>
</main>  
</header>
</div>
 </div>
 </div>
  <?php
    echo $message;
     ?>
      </p>
</form>
</div>
</div>
</main>  
</header>
      <div class="container"style="width:500px; border:2px;" >
</div>
</div>
</div>
      <?php
include 'temp/footer.php';
?>
