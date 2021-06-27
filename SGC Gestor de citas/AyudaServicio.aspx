<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AyudaServicio.aspx.cs" Inherits="SGC_Gestor_de_citas.AyudaServicio" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Ayuda Servicio
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
                            <h6>
                                <p class="text-success">
                                    Ayuda (formulario servicio)                
                                </p>
                            </h6>
                        </div>
                        <h6>Nombre</h6>
        <p>
            Este espacio es para digitar un nombre del servicio que se brindará, por ejemplo: Cortes de pelo, Spa, manicure, etc. 
        </p>
        <h6>Tiempo estimado</h6>
        <p>
            Espacio para un tiempo estimado de duración del servicio, por ejemplo: 1 hora.
        </p>
        <h6>Descripción</h6>
        <p>Este espacio es para digitar una breve descripción del servicio que se brindará, por ejemplo: esmaltado de uñas semipermante.
        </p>
        <h6>Precio estimado</h6>
       
        <p>Espacio para digitar el precio del servicio, por ejemplo: 10.000 colones.
        </p>
        <h6>Foto</h6>
       
        <p>En este apartado se digitará el botón de elegir archivo, seguidamente se abrirá la careta de archivos, se elegirá una imagen representativa al servicio que se dará.
        </p>
        <h6>Producto necesario</h6>
       
        <p>Al dar click en la flecha, se mostrarán todos los servicio resgistrados, se elegirá el necesario para brindar el servicio.
        </p>
        <h6>Foto</h6>
       
        <p>Espacio para digitar el precio del servicio, por ejemplo: 10.000 colones.
        </p>
        <h6>Mostrar Lista</h6>
                        <p>
                            Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado
                            de todos los servicio que tenemos almacenados hasta el momento, en esa lista tendriamos acceso a la 
                            opción de modificar o eliminar un servicio.
                            <br />
                            <br />
                            Modificar: seguidamente se habilitarán los espacios para que se edite la información necesaria dentro
                            de la misma tabla y se le da actualizar. Luego de esto se podrán visualizar los cambios realizados en la
                            tabla.
                            <br />
                            <br />
                            Eliminar: Al tocar este botón se mostrará un mensaje de confirmación como este, ("Esta seguro"),
                            si se le da OK, se eliminará la tabla y si se le da OK se cancelará la eliminación.
       
                        </p>
                        <br />
                        <h6>Botón guardar servicio</h6>
                        <p>
                            Al tocar este botón lo que estamos haciendo es registrar todos los datos de los campos anteriores que dijitamos, 
                            los cambios se podrán visualizar dando click en la etiqueta "Mostrar lista", antes mencionada.

                        </p>
                        <br />
                        <h6>Botón cancelar</h6>
                        <p>Con este botón podremos limpiar todos los campos del formulario, en caso de que nos arrepintamos de hacer el registro</p>
                        
                         <div class="typography-line">
                           
                            <blockquote>
                                <p class="blockquote " style="border-block-color: aqua">
                                     Puede acceder al formulario de Servicio dando click en el siguiente enlace:
                                    <asp:LinkButton ID="btnFormServicioAyuda" runat="server" OnClick="btnFormServicioAyuda_Click"  >Formulario servicio</asp:LinkButton>

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
