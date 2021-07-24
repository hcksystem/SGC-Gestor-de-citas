<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente.Master" AutoEventWireup="true" CodeBehind="frmPerfilCliente.aspx.cs" Inherits="SGC_Gestor_de_citas.frmPerfilCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />
    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>

    <link href="assets/css/estiloLista.css" rel="stylesheet" />

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .h6, h6 {
            font-size: 1rem;
            font-weight: bold;
        }
        .card label {
    
    margin-left: 8px;
}

    </style>

    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title">Cliente</h5>

                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mi perfil</h5>
                                <p>Formulario diseñado para que se pueda modificar la información de su perfil.</p>
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
                                    Espacio para digitar su numero telefónico, de preferencia un número de celular al cuál si es necesario se le pueda contactar.
                                </p>
                                <br />
                                <h6>Identificación</h6>
                                <p>
                                    Este espacio es para su cédula o número de identificación tiene que agregar los ceros (0), por ejemplo 808880888.
                                </p>
                                <br />
                                <h6>Cambiar contraseña</h6>
                                <p>
                                    Este espacio es para su contraseña.<br />
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
                            </div>

                        </div>

                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                        </div>
                        <table class="table table-hover">
                            <tr>
                                <th>Identificación</th>
                                <td colspan="2">
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtID" placeholder="Identificación"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Nombre Completo</th>
                                <td colspan="2">
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtNombre" placeholder="Nombre"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Apellidos</th>
                                <td colspan="2">
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtApellidos" placeholder="Apellidos"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Correo electrónico</th>
                                <td colspan="2">
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtCorreo" placeholder="E-mail"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Teléfono</th>
                                <td>
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtTelefono" placeholder="E-mail"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Cambiar Contraseña</th>
                                <td>
                                        <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Contraseña actual"></asp:TextBox>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Mostrar contraseña" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />

                                        
                                   

                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" ID="txtNewPassword" placeholder="Nueva contraseña"></asp:TextBox>
                                    <asp:CheckBox ID="CheckBox2" runat="server" Text="Mostrar contraseña" OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="true" />

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" CssClass="btn-block btn btn-primary" Text="Guardar" ID="Guardar" OnClick="Guardar_Click"></asp:Button>
                                </td>
                                <td>
                                    <asp:Button runat="server" CssClass="btn-block btn btn-secondary" Text="Cancelar"></asp:Button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
