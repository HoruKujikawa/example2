<?php

include 'conexion.php';
$conexion = mysqli_connect('localhost','root', '', 'Bling');

if (isset($_POST['confirmar'])) {

  $id_producto = $_POST['id_producto'];

  $eliminar = "DELETE from producto Where id_producto = '$id_producto'";

  if (mysqli_query($conexion, $eliminar)) {
    echo "El producto se eliminó correctamente.";
  
  } else {
    echo "Se produjo un error al eliminar el producto.";
  }

}
?>