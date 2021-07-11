<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoUsuario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />


        <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />



    <!DOCTYPE html>
    <html>    
    <div class="panel-header-sm">
    </div>
    <div class="content">
    <div class="row">
    <div class="col-md-12">
    <div class="card">
        
        <div class="card-header">
            <h5 class="title">Datos Personales</h5>
        </div>
        <hr />
        <div class="card-body">

            <div class="row">
                <div class="col-md-4 pl-1">
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtNombre" ErrorMessage="El nombre es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-4 pl-1">
                    <div class="form-group">
                        <label>Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtApellido" ErrorMessage="El apellido es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-4 pl-1">
                    <div class="form-group">
                        <label>Correo electrónico</label>
                        <asp:TextBox ID="txtCorreo" TextMode="Email" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtCorreo" ErrorMessage="El correo electrónico es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="El correo electrónico no esta digitado correctamente" ControlToValidate="txtCorreo" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="ManteN"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="col-md-3 pl-1">
                    <div class="form-group">
                        <label>Teléfono</label>
                        <asp:TextBox ID="txtTelefono" TextMode="Phone" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtTelefono" ErrorMessage="El teléfono es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Digite un número de teléfono con el formato adecuado (ej:8888-8888)" ValidationGroup="ManteN" ValidationExpression="^[5-9]\d{3}-?\d{4}$" ControlToValidate="txtTelefono"></asp:RegularExpressionValidator>
                    </div>
                </div>
                 <div class="col-md-3 pl-1">
                    <div class="form-group">
                        <label>Identificación</label>
                        <asp:TextBox ID="txtIdentificacion"  runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtIdentificacion" ErrorMessage="La identificación es necesaria" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ErrorMessage="Formato de identificación incorrecto, ej: 202220222) " ValidationGroup="ManteN" ValidationExpression="^[1-9]-?\d{4}-?\d{4}$" ControlToValidate="txtIdentificacion"></asp:RegularExpressionValidator>
                    </div>
                </div>   
                
                 <div class="col-md-3 pl-1">
                    <div class="form-group">
                        <label>Nombre de usuario</label>
                        <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtNombreUsuario" ErrorMessage="El nombre de usuario es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3 pl-1">
                    <div class="form-group">
                        <label>Contraseña</label>
                        <asp:TextBox ID="txtContrasenna" TextMode="Password" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtContrasenna" ErrorMessage="La contraseña es necesaria" Display="Dynamic"
                            SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"
                                ErrorMessage="La contraseña debe tener entre 8 y 15 caracteres, al menos un número, una mayúscula, una minúscula y no puede tener caracteres especiales"
                                ControlToValidate="txtContrasenna" Display="Dynamic" ForeColor="Red"
                                ValidationGroup="ManteN"></asp:RegularExpressionValidator>
                      
                    </div>
                </div>
                <div class="col-md-6">
                      <div class="form-group">
                        <label>Rol del usuario</label>
                        <asp:DropDownList ID="dropRol" runat="server" CssClass="form-control"></asp:DropDownList>
                      </div>
                    </div>
                <div class="col-md-6 ">
                      <div class="form-group">
                        <label>Estado</label>
                        <asp:DropDownList ID="dropEstado" runat="server" CssClass="form-control"></asp:DropDownList>
                      </div>
                    </div>
                 <div class="col-md-4 pl-1">
                    <div class="form-group">
                     <%--   <label>Persona</label>--%>
                        <asp:TextBox ID="txtPersona" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>                        
                    </div>
                </div>
               <%-- <div class="col-md-4 pl-1">
                    <div class="form-group">
                    </div>
                </div>--%>
              
                <div class="col-md-4 pl-1">
                    <div class="form-group">
                       
                    </div>
                </div>

                <div class="col-md-4 pl-1">
                    <div class="form-group">
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" ValidationGroup="ManteN" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        <asp:Button ID="btnModificar" class="btn btn-primary btn-round" runat="server" Text="Modificar" Visible="false" OnClick="btnModificar_Click" />
                    </div>
                </div>
              </div>
                <div class="col-12 tab">
                <input id="tab-1" type="checkbox" style="display:none">
                <hr />
                <label for="tab-1">Mostrar lista</label>
                <div class="tab-content">
                <div style="overflow: scroll">
              
              <asp:GridView ID="gridUsuarios" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" PageSize="2" AllowPaging="True" AllowSorting="True" Width="1240px" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" OnPageIndexChanging="gridUsuarios_PageIndexChanging" OnRowDeleting="gridUsuarios_RowDeleting" OnRowDataBound="gridUsuarios_RowDataBound">
              <Columns>
                <asp:CommandField ShowSelectButton="True" HeaderText="Modificar" ShowHeader="true" SelectText="Editar" SelectImageUrl="~/assets/img/Seleccionar).png" ButtonType="Image" />
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
       

  </html>
</asp:Content>
