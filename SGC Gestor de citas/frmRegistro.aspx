<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistro.aspx.cs" Inherits="SGC_Gestor_de_citas.frmRegistro" %>

<!DOCTYPE html>


<link href="assets/css/loginRegistro.css" rel="stylesheet" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="assets/js/sweetalert2.all.min.js"></script>
<script src="assets/js/mensaje.js"></script>
<link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
<style>
    #login .container #login-row #login-column #login-box{
        height:784px,
    }

    .text-info{
        color: #0c3254
    }
    .btn-info{
        background-color:#0c3254;
        border-color: #0c3254 
    }
</style>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro</title>
</head>

<body>
    <%--<form runat="server">--%>


    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-12">
                    <div id="login-box" class="col-md-12">
                        <form runat="server" class="form" action="" method="post">
                            <br />
                            <h3 class="text-center text-info">Registro</h3>
                            <br />

                            <div class="form-group">
                                <label for="username" class="text-info">Nombre:</label>
                                
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" TabIndex="1" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtNombre" ErrorMessage="Digite su nombre" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>

                            <div class="form-group">
                                <label for="username" class="text-info">Apellido:</label>
                                
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" TabIndex="2" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtApellido" ErrorMessage="Digite su apellido" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>

                            <div class="form-group">
                                <label for="username" class="text-info">Correo:</label>
                                
                                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TabIndex="3" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtCorreo" ErrorMessage="Digite su correo electrónico" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="El correo electrónico no esta digitado correctamente" ControlToValidate="txtCorreo" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="ManteN"></asp:RegularExpressionValidator>

                            </div>


                            <div class="form-group">
                                <label for="username" class="text-info"># Teléfono:</label>
                                
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TabIndex="4" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtTelefono" ErrorMessage="Digite su teléfono" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Digite un número de teléfono con el formato adecuado (ej:8888-8888)" ValidationGroup="ManteL" ValidationExpression="^[5-9]\d{3}-?\d{4}$" ControlToValidate="txtTelefono"></asp:RegularExpressionValidator>

                            </div>

                            <div class="form-group">
                                <label for="username" class="text-info"># Identificación:</label>
                                <asp:TextBox ID="txtIdentificacion" runat="server" CssClass="form-control" TabIndex="5" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtIdentificacion" ErrorMessage="Digite su identificación" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>


                            <div class="form-group">
                                <label for="username" class="text-info">Nombre de usuario:</label>
                                <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" TabIndex="6" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtNombreUsuario" ErrorMessage="Digite su nombre de usuario" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Contraseña:</label>
                                <asp:TextBox ID="txtContrasennaInicio" runat="server" TextMode="Password" CssClass="form-control" TabIndex="2" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtContrasennaInicio" ErrorMessage="Digite su contraseña" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"
                                    ErrorMessage="La contraseña debe tener entre 8 y 15 caracteres, al menos un número, una mayúscula, una minúscula y no puede tener caracteres especiales"
                                    ControlToValidate="txtContrasennaInicio" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="ManteL"></asp:RegularExpressionValidator>


                            </div>
                            <div class="form-group">


                                <asp:Button ID="btnRegistarme" runat="server" Text="Registrarme" CssClass="btn btn-info btn-md" OnClick="btnRegistarme_Click" />
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
