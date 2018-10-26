<?php
include('config.php');
//index.php
if ($_SESSION["username"]){
  header("location:dashboard.php");
}
else{
    header("location:goiffree.php");

}
session_start();

?>
