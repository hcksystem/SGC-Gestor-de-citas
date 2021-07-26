<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoUsuario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />

    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link href="assets/css/estiloLista.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
       
        .input-group, .form-group {
    margin-bottom: 3px;
}

        .tab label::after {
            top: 42px;
        }
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
                        <h5 class="title">Formulario de Usuarios</h5>
                          <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mantenimiento de Usuario</h5>
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
        <h6>Contraseña</h6>
        <p>Este espacio es para su contraseña, la misma debe de tener entre 8 y 15 caracteres, una mayúscula, una minúscula y no puede tener caracteres especiales, ejemplo: (@-*/·"$%)
        </p>
        <br />
        <h6>Rol de usuario</h6>
        <p>El rol viene a dar los permisos que tendrá el usuario del sistema sobre el mismo, el administrador tendrá acceso a todo el sistema: reportes, mantenimientos, facturación, el empleado tendrá acceso a lo mismo que el administrador excepto a mantenimientos y reportes y el cliente solo podrá gestionar las citas.
        </p>
         <br />
          <h6>Estado</h6>
          <p>
            En este espacio se verá reflejado el estado del usuario.<br />
             Activos: Usuarios que están actualmente activos en el sistema.<br />
             Inactivos: Usuarios que fueron eliminados.
           </p>
           <br />
          <h6>Mostrar Lista</h6>
                            <p>
                            Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado de los usuarios que tenemos almacenados hasta el momento, en esa lista tendríamos acceso a la opción de seleccionar o eliminar un usuario.
                            <br />
                            Si se selecciona el botón de seleccionar dentro de la tabla, se llenaran los campos del formulario, para proceder a modificar el campo que se desee.
                            Modificar: Este botón se habilitará luego de darle click al botón de seleccionar.
                            
                            <br />
                            Eliminar: Al tocar este botón se mostrará un mensaje de confirmación como este, ("¿Esta seguro?"), si se le da aceptar, se eliminará la tabla y si se le da cancelar se cancelará la eliminación y va a redireccionar al menú principal.
                        </p>
                        <br />
                        <h6>Botón guardar</h6>
                        <p>
                            Al tocar este botón lo que estamos haciendo es registrar todos los datos de los campos anteriores que dijitamos, 
                            los cambios se podrán visualizar dando click en la etiqueta "Mostrar lista", antes mencionada.
                        </p>
                        <br />
                        <h6>Botón cancelar</h6>
                        <p>Cancela a acción y hace una redirección al menú principal.</p>

                            </div>

                        </div>
                    </div>
                    <hr />
                    <div class="card-body">



                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <asp:TextBox ID="txtNombre" runat="server" TabIndex="1" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtNombre" ErrorMessage=" *Es necesario indicar un nombre" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Apellido</label>
                                    <asp:TextBox ID="txtApellido" runat="server" TabIndex="2" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtApellido" ErrorMessage=" *El apellido es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Correo electrónico</label>
                                    <asp:TextBox ID="txtCorreo" TextMode="Email" TabIndex="3" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtCorreo" ErrorMessage="El correo electrónico es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="El correo electrónico no esta digitado correctamente" ControlToValidate="txtCorreo" Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="ManteN"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Teléfono</label>
                                    <asp:TextBox ID="txtTelefono" TextMode="Phone" TabIndex="4" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtTelefono" ErrorMessage="El teléfono es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Digite un número de teléfono con el formato adecuado (ej:8888-8888)" ValidationGroup="ManteN" ValidationExpression="^[5-9]\d{3}-?\d{4}$" ControlToValidate="txtTelefono"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Identificación</label>
                                    <asp:TextBox ID="txtIdentificacion" TabIndex="5" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtIdentificacion" ErrorMessage="La identificación es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ErrorMessage="Formato de identificación incorrecto, ej: 202220222) " ValidationGroup="ManteN" ValidationExpression="^[1-9]-?\d{4}-?\d{4}$" ControlToValidate="txtIdentificacion"></asp:RegularExpressionValidator>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Nombre de usuario</label>
                                    <asp:TextBox ID="txtNombreUsuario" TabIndex="6" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtNombreUsuario" ErrorMessage="El nombre de usuario es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Contraseña</label>
                                         
                                <asp:TextBox ID="txtContrasenna" TabIndex="7" TextMode="Password" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Mostrar contraseña" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />

                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ManteN"
                                ControlToValidate="txtContrasenna" ErrorMessage="La contraseña es necesaria" Display="Dynamic"
                                SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                        ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"
                                        ErrorMessage="La contraseña debe tener entre 8 y 15 caracteres, al menos un número, una mayúscula, una minúscula y no puede tener caracteres especiales"
                                        ControlToValidate="txtContrasenna" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="ManteN"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Rol de usuario</label>
                                    <asp:DropDownList ID="dropRol" TabIndex="8" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Estado</label>
                                    <asp:DropDownList ID="dropEstado" TabIndex="9" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" ValidationGroup="ManteN" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    <asp:Button ID="btnModificar" class="btn btn-primary btn-round" runat="server" Text="Modificar" Visible="false" OnClick="btnModificar_Click" />
                                </div>
                            </div>



                            <div class="col-12 tab">
                                <input id="tab-1" type="checkbox" style="display: none">
                                <hr />
                                <label for="tab-1">Mostrar lista</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">

                                        <asp:GridView ID="gridUsuarios" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" PageSize="5" AllowPaging="True" AllowSorting="True" Width="100%" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" OnPageIndexChanging="gridUsuarios_PageIndexChanging" OnRowDeleting="gridUsuarios_RowDeleting" OnRowDataBound="gridUsuarios_RowDataBound">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" HeaderText="Seleccionar" ShowHeader="true" SelectText="Editar" SelectImageUrl="~/assets/img/Seleccionar).png" ButtonType="Image" />
                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" HeaderText="Eliminar" ShowHeader="true" ButtonType="Image" DeleteImageUrl="~/assets/img/basurero.jpg" />
                                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                                <asp:BoundField DataField="nombreUsuario" HeaderText="Nombre de usuario" />
                                                <asp:BoundField DataField="contrasenna" HeaderText="Contraseña" Visible="False" />
                                                <asp:BoundField DataField="idRoll" HeaderText="Rol" />
                                                <asp:BoundField DataField="estado" HeaderText="Estado" />
                                                <asp:BoundField DataField="idPersona" HeaderText="ID Persona" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                                                <asp:BoundField DataField="correo" HeaderText="Correo" />
                                                <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                                                <asp:BoundField DataField="identificacion" HeaderText="Identificación" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
