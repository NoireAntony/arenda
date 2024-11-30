<?php
include 'temp/head.php';
include 'temp/database.php';
include 'temp/navklient.php'; 
?>
<main>
<h1 style="color:green; text-align:center;">Личный кабинет</h1>

</div>
<div class="container">
<div class="row">
    <table class="table">
        <tr>
  <th>Номер Заказа</th>
    <th>Дата заказа</th>
    <th>Автомобиль</th>
        </tr>  
<?php
$id_user=$_SESSION ['id_user'];
$id_auto=$_SESSION ['id_auto'];
//$sql = "SELECT * FROM `zayavka`, 'auto' WHERE zayavka.id_auto=auto.id_auto";
$sql = "SELECT * FROM `zayavka`WHERE id_user= '{$_SESSION ['id_user']}'";
$result =  $mysqli->query($sql);
if(!empty($result))
foreach( $result as $row){   
echo  '<tr><td>' . $row['id_zayavka'] . '</td>
<td>' . $row['date'] . '</td>
<td>' . $row['id_auto'] . '</td>


</tr>';
}
?>
</table>
</div>  
</div>
    </table>
</div>  
</div>
<?php 
include 'temp/footer.php';  
?>
