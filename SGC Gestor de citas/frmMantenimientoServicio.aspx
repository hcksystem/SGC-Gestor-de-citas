<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoServicio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoServicio" %>

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
    <style>
              .h6, h6 {
            font-size: 1rem;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Mantenimiento de Servicios</h5>

                          <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mantenimiento de servicios</h5>

                                 <h6>Nombre</h6>
         <p>
          Este espacio es para digitar un nombre del servicio que se brindará, por ejemplo: Cortes de pelo, Spa, manicure, etc. 
           </p>
           <br />
           <h6>Precio estimado</h6>
       
        <p>Espacio para digitar el precio del servicio, por ejemplo: 10000 colones.
        </p>
        <h6>Duración</h6>
        <p>
            Espacio para un tiempo estimado de duración del servicio, por ejemplo: 60.<br />
            Nota: debe de llenar este espacio con la cantidad de minutos, por ejemplo: una hora equivale a 60 minutos, sólo se permiten cantidades.
        </p>
          <br />
        <h6>Descripción</h6>
        <p>Este espacio es para digitar una breve descripción del servicio que se brindará, por ejemplo: esmaltado de uñas semipermante.
        </p>
      <br />
        <h6>Foto</h6>
       
        <p>En este apartado se digitará el botón de elegir archivo, seguidamente se abrirá la carpeta de archivos, se elegirá una imagen representativa al servicio que se dará.
        </p>
          <br />
        <h6>Estado</h6>
          <p>
            En este espacio se verá reflejado el estado del producto.<br />
             Activos: Servicios que se ofrecen actualmente en el negocio.<br />
             Inactivos: Sevicios que ya no se ofrecen y que ya se han eliminado.
           </p>
           <br />
        <h6>Producto necesario</h6>
        <p>Al dar click en el espacio, se mostrarán todos los productos resgistrados, se elegirá el necesario para brindar el servicio.
        </p>
        <h6>Negocio</h6>
       
        <p> En este espacio se verá reflejado el negocio creado con anterioridad en el mantenimiento de negocio.
        </p>
        <h6>Mostrar Lista</h6>
                        <p>
                            Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado de todos los servicio que tenemos almacenados hasta el momento, en esa lista tendriamos acceso a la opción de seleccionar o eliminar un servicio.
                            <br />
                            Seleccionar: al dar click en este botón se habilitarán los espacios para que se edite la información necesaria dentro del formulario y se le da guardar.
                            Luego de esto se podrán visualizar los cambios realizados en la tabla.
                            <br />
                            Eliminar: Al tocar este botón se mostrará un mensaje de confirmación como este, ("¿Esta seguro?"), si se le da aceptar, se eliminará la tabla y si se le da cancelar se cancelará la eliminación.
       
                        </p>
                        <br />
                        <h6>Botón guardar</h6>
                        <p>
                            Al tocar este botón lo que estamos haciendo es registrar todos los datos de los campos anteriores que dijitamos, 
                            los cambios se podrán visualizar dando click en la etiqueta "Mostrar lista", antes mencionada.

                        </p>
                        <br />
                        <h6>Botón cancelar</h6>
                        <p>Cancela la acción y hace una redirección al menú principal.</p>

                            </div>

                        </div>

                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteS"
                                        ControlToValidate="txtNombre" ErrorMessage="El nombre del servicio es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Precio estimado</label>
                                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteS"
                                        ControlToValidate="txtPrecio" ErrorMessage="El precio del servicio es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="El precio no puede ser negativo, no debe contener puntos, solo se acepta un dígito entero, si necesita colocar un decimal, indiquelo utilizando ',' coma " ControlToValidate="txtPrecio" ValidationGroup="ManteS" ValidationExpression="^[0-9]\d*(\,\d+)?$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Duración </label>
                                    <asp:TextBox ID="txtTiempoEstimado"  TextMode="Number" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteS"
                                        ControlToValidate="txtTiempoEstimado" ErrorMessage="El tiempo es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteS"
                                        ControlToValidate="txtDescripcion" ErrorMessage="La descripción es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div>
                                    <label>Foto </label>
                                    <br />
                                    <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="#626c7d" Font-Size="Small" />
                                    <asp:ImageButton Width="35px" Height="35px" ID="FotoSugerida" runat="server" Visible="false" OnClick="FotoSugerida_Click"  />
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Estado</label>
                                    <asp:DropDownList ID="dropEstado" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Producto necesario </label>
                                    <asp:DropDownList ID="dropProducto" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Negocio</label>
                                    <asp:DropDownList ID="dropNegocio" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" ValidationGroup="ManteS" Text="Guardar" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Cancelar" OnClick="btnCancelar_Click"/>
                                    <asp:Button ID="btnModificar" class="btn btn-primary btn-round" runat="server" Text="Modificar" Visible="false" OnClick="btnModificar_Click" />
                                </div>
                            </div>                                                  
                    
                        <div class="col-12 tab">
                            <input id="tab-1" type="checkbox" style="display: none">
                            <hr />
                            <label for="tab-1">Mostrar lista</label>
                            <div class="tab-content">

                                <div style="overflow: scroll">

                                    <asp:GridView ID="gridServicios" runat="server" CssClass="mGrid GridView" AutoGenerateColumns="False" DataKeyNames="id" AllowSorting="false" ShowFooter="True" AllowPaging="True" PageSize="6" OnRowDeleting="gridServicios_RowDeleting"  OnRowDataBound="gridServicios_RowDataBound" OnPageIndexChanging="gridServicios_PageIndexChanging" OnSelectedIndexChanged="gridServicios_SelectedIndexChanged" Width="100%">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="true" HeaderText="Seleccionar">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Select" ImageUrl="~/assets/img/Seleccionar).png" Text="Seleccionar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="true" HeaderText="Eliminar">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" ImageUrl="~/assets/img/basurero.jpg" Text="Eliminar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="id" HeaderText="ID"  />
                                            <asp:TemplateField HeaderText="Nombre">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<% # Bind("nombre") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtNombreServicio" runat="server" Text='<% # Bind("nombre") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<% # Bind("descripcion") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtDescripcionServicio" runat="server" Text='<% # Bind("descripcion") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Precio estimado">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<% # Bind("precioEstimado") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtPrecioEstimado" TextMode="Number" runat="server" Text='<% # Bind("precioEstimado") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Duración">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5"  runat="server" Text='<%# Bind("Duracion") %>'></asp:Label> 

                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtTiempoEstimado" TextMode="Number" runat="server" Text='<% # Bind("duracion") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Foto">
                                                <ItemTemplate>
                                                    <img src='<%# Eval("fotoSugerida") %>' id="imageControl" runat="server" width="100" height="100" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estado">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<% # Bind("estado") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEstado" runat="server" Text='<% # Bind("estado") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Producto">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<% # Bind("idProducto") %>'  Width="125"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="dropProducto" runat="server"></asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Negocio">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<% # Bind("idNegocio") %>'  Width="125"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="dropNegocio" runat="server"></asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            
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
