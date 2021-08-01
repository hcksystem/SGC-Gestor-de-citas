<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SGC_Gestor_de_citas.frmLogin" %>

<!DOCTYPE html>
<link href="assets/css/Iniciosesion.css" rel="stylesheet" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

     <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/estiloLista.css" rel="stylesheet" />
  


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
</head>
<body>
    <%--<form runat="server">--%>

    <script type="text/javascript">
        function mostrarPassword() {
            var cambio = document.getElementById("txtContrasennaInicio");
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
    

    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12" style="box-shadow: 0 1px 15px 1px rgb(39 39 39 / 30%);">
                        <form runat="server" class="form" action="" method="post">
                            <br />
                            <h3 class="text-center text-info">Inicio de sesión</h3>
                            <br />
                            <div class="form-group">
                                <label for="username" class="text-info">Nombre de usuario:</label><br>
                                <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" TabIndex="1" AutoComplete="off"
                                    placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtNombreUsuario" ErrorMessage="Digite su nombre de usuario"
                                    Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Contraseña:</label><br>
                                <div class="input-group-append">
                                    <asp:TextBox ID="txtContrasennaInicio" TextMode="Password" runat="server" CssClass="form-control"
                                        placeHolder="* Requerido *"></asp:TextBox>
                                    <div class="input-group-append">
                                        <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()">
                                            <span class="fa fa-eye-slash icon"></span>
                                        </button>
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtContrasennaInicio" ErrorMessage="Digite su contraseña"
                                    Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>



                            </div>
                            <div class="form-group">


                                <asp:Button ID="btnIniciar" runat="server" Text="Iniciar sesión" CssClass="btn btn-info btn-md"
                                    OnClick="btnIniciar_Click" ValidationGroup="ManteL" />
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="frmRegistro.aspx" class="text-info">Registrarse</a>
                            </div>
                            <div id="olvido-link" class="text-right">
                                <a href="frmOlvideMiContrasenna.aspx" class="text-info">¿Olvidó su contraseña?</a>
                            </div>

                          
                          
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--</form>--%>
</body>
</html>
