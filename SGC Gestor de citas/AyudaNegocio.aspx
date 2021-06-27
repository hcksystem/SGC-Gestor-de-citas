<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AyudaNegocio.aspx.cs" Inherits="SGC_Gestor_de_citas.AyudaNegocio" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Ayuda Servicio</title>
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
                                    Ayuda (formulario Negocio)                
                                </p>
                            </h6>
                        </div>
                        <h6>Nombre</h6>
        <p>
            Este espacio es para digitar el nombre que tendrá el negocio, por ejemplo: Tienda Glow, Beauty Store etc. 
        </p>
        <h6>Descripción</h6>
        <p>Este espacio es para digitar una breve descripción del negocio, por ejemplo: Negocio de belleza y cuidado personal.
        </p>
        <h6>Nuestra visión</h6>
        <p>
            Espacio para colocar la visión del negocio, por ejemplo: Satisfacer siempre las necesidades de nuestros clientes.
        </p>
        <h6>Nuestra misión</h6>
        <p>Espacio para colocar a misión del negocio, por ejemplo: Llegar a convertirnos en un negocio reconocido a nivel nacional.
        </p>
        <h6>Logo</h6>
        <p>En este apartado se digitará el botón de elegir archivo, seguidamente se abrirá la carpeta de archivos, se elegirá una imagen representativa al logo del negocio, se buscará el logo o la imagen representativa.              
        <h6>Mostrar Lista</h6>
                        <p>
                            Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado
                            del negocio que tenemos almacenado hasta el momento, en esa lista tendríamos acceso a la 
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
                        <h6>Botón guardar negocio</h6>
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
                                     Puede acceder al formulario de negocio dando click en el siguiente enlace:
                                    <asp:LinkButton ID="btnFormNegocioAyuda" runat="server" OnClick="btnFormNegocioAyuda_Click"  >Formulario negocio</asp:LinkButton>

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
