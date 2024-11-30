<?php
include 'temp/head.php';
include 'temp/database.php';
include 'temp/navklient.php';
session_start();
$id_user = $_SESSION['id_user'];
if (!empty($_POST)) {
  $id_auto = $_POST['id_auto'];
  $date =$_POST['date'];
  $sql = "INSERT INTO zayavka(id_user, id_auto,  date) VALUES ('$id_user', '$id_auto',  '$date')";
  $result = $mysqli->query($sql);
  var_dump($_POST);
  if ($result) {
    header('location:person.php');
  } else {
    $message = 'Ошибка' . $sql;
  }
}
?>
<main>
  <div class="container">
    <div class="row">
        <h1 >Заказ</h1>
      </div>
      <hr>
    </div>
    <div class="row">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
        <form action="" method="POST">
          <div class="mb-3">
            <label for="inputDelivery" class="form-label">Выберите товар</label>
            <select class="form-select" name="id_auto" required>
              <?php
              $auto= $mysqli->query("SELECT id_auto, name_auto FROM auto");
              foreach ($auto as $list) {
                echo '<option value="'.$list["id_auto"].'">'.$list["name_auto"].'</option>';
              }
              ?>
            </select>
          </div>
         
          <div class="mb-3">
            <label for="date" class="form-label">Дата заказа</label>
            <input type="date" class="form-control" id="date" name="date" required>
          </div>
          
          
            <button type="submit" class="btn btn-success">Заказать</button><br><br>
          </div>
        </form>
      </div>
      <div class="col-lg-4"></div>
    </div>
  </div>
</main>