<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AyudaProducto.aspx.cs" Inherits="SGC_Gestor_de_citas.AyudaProducto" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Ayuda producto
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <meta itemprop="image" content="https://s3.amazonaws.com/creativetim_bucket/products/72/opt_nudp_thumbnail.jpg">
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <div class="panel-header panel-header-sm">
        </div>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="typography-line">
                                <h4>
                                    <p class="text-success">
                                        Ayuda (formulario producto)                     
                               
                                    </p>
                                </h4>
                            </div>
                            <h6>Nombre del producto</h6>
                            <p>
                                Este espacio es requerido, lo que significa que es un dato indispensable
                            para tener éxito en el registro de productos.
                            El dato debe ser breve y claro, ejemplos: Cepillo eléctrico, Plancha de cabello, Shampoo etc.
                            </p>
                            <br />
                            <h6>Categoría</h6>
                            <p>
                                Este espacio es para que categorice o asigne un producto a un grupo de materiales
                            segun su categoría para que le sea mas fácil buscarlos a futuro.
                            por ejemplo: Aparatos eléctricos, utencilios básicos, aplicables etc.
       
                            </p>
                            <br />
                            <h6>Descripción</h6>
                            <p>
                                Este espacio es apara que brevemente haga una nota o describa el producto, 
                            por ejemplo: color negro brillante(tintes), tipos de fijacion (ceras o gel para cabello)
                            </p>
                            <br />
                            <h6>Cantidad que se posee</h6>
                            <p>Representa la cantidad bruta de productos que se estan incluyendo, por ejemplo (1, 2, 3, etc).</p>
                            <br />
                            <h6>Proposito</h6>
                            <p>
                                Este espacio tiene como fin que se indique cual es el proposito que tiene ese producto que almacenamos
                            ya sea que lo queremos vender, si es para consumo del local o alguna otra idea que tengamos.
       
                            </p>
                            <br />
                            <h6>Precio Unitario</h6>
                            <p>
                                En este espacio dijitaremos el valor unitario de cada uno de esos productos, este precio es 
                            el valor de salida que tendría el producto, no el valor en el cual lo adquirimos.
                       
                            </p>
                            <br />
                            <h6>Mostrar Lista</h6>
                            <p>
                                Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado
                            de todos los productos que tenemos almacenados hasta el momento, en esa lista tendriamos acceso a la 
                            opción de modificar o eliminar un producto.
                            Modificar: seguidamente se habilaran los espacios para que se edite la información necesaria dentro
                            de la misma tabla y se le da actualizar. Luego de esto se podrán visualizar los cambios realizados en la
                            tabla.
                            Eliminar: Al tocar este botón se mostrará un mensaje de confirmación como este, ("Esta seguro"),
                            si se le da OK, se eliminará la tabla y si se le da OK se cancelará la eliminación.
       
                       
                            </p>
                            <br />
                            <h6>Boton guardar</h6>
                            <p>
                                Al tocar este botón lo que estamos haciendo es registrar todos los datos de los campos anteriores que dijitamos, 
                            los cambios se podrán visualizar dando click en la etiqueta "Mostrar lista", antes mencionada.


                       
                            </p>
                            <br />


                            <h6>Boton cancelar</h6>
                            <p>Con este boton podremos limpiar todos los campos del formulario, en caso de que nos arrepintamos de hacer el registro</p>
                            <div class="typography-line">
                                <blockquote>
                                    <p class="blockquote " style="border-block-color: aqua">
                                        Puede acceder al formulario de productos dando click en el siguiente enlace:
                                   
                                        <asp:LinkButton ID="btnFormProductoAyuda" runat="server" OnClick="btnFormProductoAyuda_Click">Formulario Producto</asp:LinkButton>
                                        <br>
                                        <br>
                                    </p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!-- Chart JS -->
        <script src="assets/js/plugins/chartjs.min.js"></script>
    </form>
</body>
</html>





















