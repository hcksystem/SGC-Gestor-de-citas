<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistro.aspx.cs" Inherits="SGC_Gestor_de_citas.frmRegistro" %>

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
<html>

    <head runat="server">
        <title>Registro</title>
    </head>
    <body>
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
        <form runat="server">
            <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card" style="margin: 26px 13px 0px 42px;">

                    <div class="card-header">
                        <h5 class="title">Registrarse</h5>

                                <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mi perfil</h5>
                                <p>Formulario diseñado para que pueda registrarse y proporcionarnos la información necesaria para la creación de su perfil dentro del sistema.</p>
                                 <h6>Nombre</h6>
            <p>
            Este espacio es para digitar un nombre propio de persona. 
           </p>
           <br />
            <h6>Apellido</h6>
            <p>
          Este espacio es para digitar un apellido de persona. 
           </p>
           <br />
            <h6>Correo</h6>
        <p>
            Este espacio es para su correo electrónico, ejemplo: persona1@gmail.com.
        </p>
         <br />
        <h6>Teléfono</h6>
        <p>
            Espacio para digitar su número telefónico, de preferencia un número de celular al cuál si es necesario se le pueda contactar.
        </p>
         <br />
         <h6>Identificación</h6>
        <p>
            Este espacio es para digitar su número de identificación, tiene que agregar los ceros (0), por ejemplo 808880888.
        </p>
         <br />
        <h6>Nombre de usuario</h6>
         <p>
             Espacio para digitar un nombre de usuario, este espacio es muy importante ya que será el que se utilizará para ingresar al sistema. <br />
             por ejemplo: juansito27.
         </p>
                                <br />
        <h6>Cambiar contraseña</h6>
        <p>Este espacio es para su contraseña.<br />
            Formato de contraseña: la misma debe de tener entre 8 y 15 caracteres, una mayúscula, una minúscula y no puede tener caracteres especiales, ejemplo: (@-*/·"$%).<br />
            Este apartado es para cambiar su contraseña:
            <br />
            Contraseña anterior: debe digitar su contraseña actual.<br />
            Contraseña nueva: debe digitar la contraseña nueva, recuerde seguir el formato de contraseña citado enteriormente. 
        </p>
                                <br />
                                <h6>Botón guardar</h6>
                                <br />
                                <p>Botón que guarda la nueva información de su perfil.</p>
                                <br />
                                <h6>Botón volver</h6>
                                <p>
                                    Este botón lo regresará al formulario de inicio de sesión.
                                </p>
                            </div>

                        </div>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                        </div>
                        <table class="table table-hover">
            <tr>
                <th>Nombre</th>
                <td colspan="2">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" TabIndex="1" placeHolder="* Requerido *"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteL"
                            ControlToValidate="txtNombre" ErrorMessage="Digite su nombre" Display="Dynamic"
                             ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <th>Apellido</th>
                <td colspan="2">
                   <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" TabIndex="2" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteL"
                            ControlToValidate="txtApellido" ErrorMessage="Digite su apellido" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Correo electrónico</th>
                <td colspan="2">
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TabIndex="3" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtCorreo" ErrorMessage="Digite su correo electrónico" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="El correo electrónico no esta digitado correctamente" ControlToValidate="txtCorreo" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="ManteL" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <th>Teléfono</th>
                <td colspan="2">
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TabIndex="4" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteL" ControlToValidate="txtTelefono" ErrorMessage="Digite su teléfono" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Digite un número de teléfono con el formato adecuado (ej:8888-8888)" ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="red" ValidationGroup="ManteL" ValidationExpression="^[5-9]\d{3}-?\d{4}$"></asp:RegularExpressionValidator>


                </td>
            </tr>
                             <tr>
                <th>Identificación</th>
                <td colspan="2">
                  <asp:TextBox ID="txtIdentificacion" runat="server" CssClass="form-control" TabIndex="5" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtIdentificacion" ErrorMessage="Digite su identificación" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
     
                </td>
            </tr>
                            <tr>
                <th>Nombre usuario</th>
                <td colspan="2">
                 <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" TabIndex="6" placeHolder="* Requerido *"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtNombreUsuario" ErrorMessage="Digite su nombre de usuario" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>

     
                </td>
            </tr>
                            <tr>
                <th>Contraseña</th>
                <td colspan="2">
                         <div class="input-group-append">
                                            <asp:TextBox ID="txtContrasennaInicio" TextMode="Password" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                            <div class="input-group-append">
                                                <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()">
                                                    <span class="fa fa-eye-slash icon"></span>
                                                </button>
                                            </div>
                                        </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ManteL"
                                    ControlToValidate="txtContrasennaInicio" ErrorMessage="Digite su contraseña" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"
                                    ErrorMessage="La contraseña debe tener entre 8 y 15 caracteres, al menos un número, una mayúscula, una minúscula y no puede tener caracteres especiales"
                                    ControlToValidate="txtContrasennaInicio" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="ManteL"></asp:RegularExpressionValidator>

     
                </td>
            </tr>


           
                           
            <tr>
                <td colspan="2">
                   <asp:Button ID="btnRegistarme" runat="server" Text="Registrarme" CssClass="btn btn-info btn-md" OnClick="btnRegistarme_Click" ValidationGroup="ManteL" />
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-info btn-md" OnClick="btnVolver_Click"/>
                </tr>    
        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </form>
    </body>

    <%--<script src="assets/js/core/jquery.min.js"></script>--%>
    <%--<script src="assets/js/core/popper.min.js"></script>--%>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!-- Chart JS -->
    <script src="assets/js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="assets/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="assets/js/now-ui-dashboard.min.js?v=1.5.0"></script>
    <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
</html>
