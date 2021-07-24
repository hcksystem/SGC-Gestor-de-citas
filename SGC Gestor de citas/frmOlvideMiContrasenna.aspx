<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmOlvideMiContrasenna.aspx.cs" Inherits="SGC_Gestor_de_citas.frmOlvideMiContrasenna" %>

<!DOCTYPE html>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<script src="assets/js/sweetalert2.all.min.js"></script>
<script src="assets/js/mensaje.js"></script>
<link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />

<link href="assets/css/estiloLista.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />

<!-- CSS Files -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />





<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <title>Recuperacion de contraseña</title>
</head>
<body>
  <script type="text/javascript">
      function mostrarPassword() {
          var cambio = document.getElementById("txtPassword");
          if (cambio.type == "password") {
              cambio.type = "text";
              $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
          } else {
              cambio.type = "password";
              $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
          }
      }
      $(document).ready(function () {
          //CheckBox mostrar contraseña
          $('#ShowPassword').click(function () {
              $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
          });
      });
</script>
     <script type="text/javascript">
         function mostrarPassword1() {
             var cambio = document.getElementById("txtPassword1");
             if (cambio.type == "password") {
                 cambio.type = "text";
                 $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
             } else {
                 cambio.type = "password";
                 $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
             }
         }
         $(document).ready(function () {
             //CheckBox mostrar contraseña
             $('#ShowPassword1').click(function () {
                 $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
             });
         });
</script>

    <form id="form1" runat="server">
        <div class="panel-header-sm">
        </div>

        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card" style="margin: 26px 13px 0px 42px;">

                        <div class="card-header">
                            <h5 class="title">Recuperacion de contraseña</h5>
                        </div>

                        <div class="card-body">
                            <div class="row">
                            </div>

                            <table class="table table-hover">
                                <tr>
                                    <th>Correo</th>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TabIndex="1" placeHolder="* Requerido *"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSolicitarContrasenna" runat="server" Text="Solicitar " OnClick="btnSolicitarContrasenna_Click" />
                                    </td>
                                    <td id="CodigoVerificacion" runat="server" visible="false">
                                        <asp:TextBox ID="txtCodigoVerificacion" runat="server" CssClass="form-control" TabIndex="1" placeHolder="* Requerido *"></asp:TextBox>
                                        </td>
                                    <td id="tdVerificar" runat="server" visible="false">
                                        <asp:Button ID="btnVerificar" runat="server" CssClass="btn btn-info" TabIndex="1" OnClick="btnVerificar_Click"></asp:Button>
                                        </td>
                                </tr>

                                <tr runat="server" visible="false" id="NuevaContrasena">
                                    <th>Nueva contraseña</th>
                                    <td colspan="2">
                                        <div class="input-group-append">
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                            <div class="input-group-append">
                                                <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()">
                                                    <span class="fa fa-eye-slash icon"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr runat="server" id="confirmar" visible="false">
                                    <th></th>
                                    <td colspan="1">
                                        <asp:Button ID="btnConfirmar" CssClass="btn btn-primary btn-round" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
                                    
                                        <asp:Button ID="btnCancelar" CssClass="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    </td>
                                </tr>

                            </table>


                        </div>


                    </div>
                </div>
            </div>
        </div>


    </form>
</body>

</html>
