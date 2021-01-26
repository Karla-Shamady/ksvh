<?php
include "./php/conexion.php";
if(!isset($_GET['id_venta'])){
    header("Location: ./");
}
$datos = $conexion->query("select
          ventas.*,
          usuario.nombre,usuario.telefono,usuario.email 
          from ventas
          inner join usuario on ventas.id_usuario = usuario.id
          where ventas.id=".$_GET['id_venta'])or die($conexion->error);
$datosUsuario = mysqli_fetch_row($datos);
$datos2 = $conexion->query("select * from envios where id_venta=".$_GET['id_venta'])or die($conexion->error);
$datosEnvio= mysqli_fetch_row($datos2);

$datos3= $conexion->query("select productos_venta.*,
                productos.nombre as nombre_producto,productos.imagen
                from productos_venta inner join productos on productos_venta.id_producto = productos.id
                where id_venta =".$_GET['id_venta'])or die($conexion->error);
// SDK de Mercado Pago
require __DIR__ .  '/vendor/autoload.php';

// Agrega credenciales
MercadoPago\SDK::setAccessToken('TEST-2427164035187071-012303-e4131c621b9a1e5859c1cf615523b23a-705539381');

// Crea un objeto de preferencia
$preference = new MercadoPago\Preference();
$preference->back_urls = array(
    "success" => "https://localhost/carrito/thankyou.php?id_venta=".$_GET['id_venta']."&metodo=mercado_pago",
    "failure" => "https://localhost/carrito/errorpago.php?error=failure",
    "pending" => "https://localhost/carrito/errorpago.php?error=pending"
);
$preference->auto_return = "approved";
// Crea un ítem en la preferencia
$datos=array();
while($f = mysqli_fetch_array($datos3)){
    $item = new MercadoPago\Item();
    $item->title =$f['nombre_producto'];;
    $item->quantity =$f['cantidad'];;
    $item->unit_price = $f['precio'];;
    $datos[]=$item;
}
$preference->items = $datos;
$preference->save();
//curl -X POST -H "Content-Type: application/json" "https://api.mercadopago.com/users/test_user?access_token=TEST-8080024448714508-012300-8453555edacd022993ffd18ac92312a7-457726565" -d "{'site_id':'MLM'}"
//{"id":705539381,"nickname":"TEST4HKSI6YE","password":"qatest9037","site_status":"active","email":"test_user_98147526@testuser.com"} //VENDEDOR
//{"id":705543245,"nickname":"TESTHPYOHU6T","password":"qatest1599","site_status":"active","email":"test_user_43683492@testuser.com"} //COMPRADOR
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elige metodo de pago</title>
</head>
<body>
    <script src="https://www.paypal.com/sdk/js?client-id=AdQ4D4H86SgC73rSpmsVgvdoe2bgvdzvt_PYR00qsNyytsQOGrOKhUXCQDq4ihXIGcFwozNxydrgg1n4&currency=MXN"> // Replace YOUR_SB_CLIENT_ID with your sandbox client ID
    </script>
  <div class="site-wrap">
  <?php include("./layouts/header.php"); ?> 

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Elige metodo de pago</h2>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
                <link rel="stylesheet" href="fonts/icomoon/style.css">

                <link rel="stylesheet" href="css/bootstrap.min.css">
                <link rel="stylesheet" href="css/magnific-popup.css">
                <link rel="stylesheet" href="css/jquery-ui.css">
                <link rel="stylesheet" href="css/owl.carousel.min.css">
                <link rel="stylesheet" href="css/owl.theme.default.min.css">


                <link rel="stylesheet" href="css/aos.css">

                <link rel="stylesheet" href="css/style.css">
          </div>
          <div class="col-md-7">

            <form action="#" method="post">
              
              <div class="p-3 p-lg-5 border">

                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Venta #<?php echo $_GET['id_venta'];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Nombre <?php echo $datosUsuario[4];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Email<?php echo $datosUsuario[6];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Telefono<?php echo $datosUsuario[5];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Compañia<?php echo $datosEnvio[2];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Direccion<?php echo $datosEnvio[3];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">Estado<?php echo $datosEnvio[4];?></label>          
                  </div>                 
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_fname" class="text-black">CP<?php echo $datosEnvio[5];?></label>          
                  </div>                 
                </div>
               
              </div>
            </form>
          </div>
          <div class="col-md-5 ml-auto">
              <h4 class="h1">Total: <?php echo $datosUsuario[2];?></h4>
              <form action="http://localhost/carrito/thankyou.php?id_venta=<?php echo $_GET['id_venta']?>&metodo=mercado_pago" method="POST">
                    <h2>Mercado pago</h2>
                    <script
                    src="https://www.mercadopago.com.mx/integrations/v1/web-payment-checkout.js"
                    data-preference-id="<?php echo $preference->id; ?>">
                    </script>
               </form>
               <div id="paypal-button-container"></div>
          </div>
        </div>
      </div>
    </div>

    <?php include("./layouts/footer.php"); ?> 
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
  <script>
      paypal.Buttons({
        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: '<?php echo $datosUsuario[2];?>'
              }
            }]
          });
        },
        onApprove: function(data, actions) {
          return actions.order.capture().then(function(details) {
            
            if(details.status == 'COMPLETED'){
                location.href="./thankyou.php?id_venta=<?php echo $_GET['id_venta'];?>&metodo=paypal";
            }
           
          });
        }
      }).render('#paypal-button-container'); // Display payment options on your web page
    </script>
</body>
</html>