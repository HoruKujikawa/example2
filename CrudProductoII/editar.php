<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modificar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body>
  <h1 class="bg-primary p-2 text-white text-center">Modificar Productos</h1>

<br>




<form class="container" action="Modificar.php" method="POST">
<div class="mb-3">
  <label class="form-label">Talla</label>
  <input type="text" class="form-control" name="talla" value="<?php echo $talla; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Color</label>
  <input type="text" class="form-control" name="color" value="<?php echo $color; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Cantidad</label>
  <input type="number" class="form-control" name="cantidad" value="<?php echo $cantidad; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Descripcion</label>
  <input type="text" class="form-control" name="descripcion" value="<?php echo $descripcion; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Nombre</label>
  <input type="text" class="form-control" name="nombre" value="<?php echo $nombre; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Marca</label>
  <input type="text" class="form-control" name="marca" value="<?php echo $marca; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Estado</label>
  <input type="text" class="form-control" name="estado" value="<?php echo $estado; ?>">
</div>
<div class="mb-3">
  <label class="form-label">Categorias</label>
  <input type="text" class="form-control" name="categorias" value="<?php echo $categorias; ?>">
</div>
<div class= "text-center">
  <button type="submit" class="btn btn-danger">Guardar</button>
  <a href="index.php" class="btn btn-dark">Regresar a la Lista</a>
</div>
</form>
  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
</html>