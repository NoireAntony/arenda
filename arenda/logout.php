<?php
include 'temp/head.php';
include 'temp/database.php';
include 'temp/nav.php';

session_start();
if(isset($_SESSION["users"]))
unset($_SESSION['users']);
//session_destroy();

//session_start();

 if(($_SESSION["id_user"]))
 {
   header("location:index.php");

 }
  

include 'temp/footer.php';?>