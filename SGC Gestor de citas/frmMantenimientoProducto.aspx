<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoProducto.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoProducto" %>

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
    </style>
<div class="panel-header-sm">
</div>
<div class="content">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="title">Formulario de Productos</h5>

                    <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mantenimiento de productos</h5>

                             <h6>Nombre del producto</h6>
                            <p>
                                Este espacio es requerido, lo que significa que es un dato indispensable
                            para tener éxito en el registro de los productos.
                            El dato debe ser breve y claro, ejemplos: cepillo eléctrico, plancha de cabello, shampoo etc.
                            </p>
                            <br />
                            <h6>Categoría</h6>
                            <p>
                                Este espacio es para que categorice o asigne un producto a un grupo de materiales
                            según su categoría, para que le sea más fácil buscarlos a futuro.
                            por ejemplo: cuidado para la piel, utencilios básicos, cosméticos, etc.
                            </p>
                            <br />
                            <h6>Descripción</h6>
                            <p>
                                Este espacio es para que brevemente se describa el producto, 
                            por ejemplo: color negro brillante(tintes), tipos de fijación (ceras o gel para cabello)
                            </p>
                            <br />
                                  <h6>Propósito</h6>
                            <p>
                                Este espacio tiene como fin que se indique cuál es el propósito que tiene ese producto que almacenamos ya sea que lo queremos vender, si es para consumo del local o alguna otra idea que tengamos.
                            </p>
                            <br />
                            <h6>Precio Unitario</h6>
                            <p>
                              En este espacio dijitaremos el valor unitario de cada uno de esos productos, este precio es 
                            el valor de salida que tendría el producto, no el valor en el cual lo adquirimos.
                            </p>
                                <br />
                            <h6>Cantidad que se posee</h6>
                            <p>Representa la cantidad bruta de productos que se estan incluyendo, esta se verá reflejada en el inventario, por ejemplo (1, 2, 3, etc).</p>
                            <br />
                          <h6>Estado</h6>
                           <p>
                               En este espacio se verá reflejado el estado del producto.<br />
                               Activos: Productos que están actualmente en posesión de inventario.<br />
                               Inactivos: Productos que ya salieron y que ya se han eliminado.
                           </p>
                                <br />
                                <h6>Nota para inventario</h6>
                                <p>
                                    Nota opcional, se puede utilizar para comunicar alguna nota importante para luego visualizarlo en el formulario de inventario.
                                </p>
                            <br />
                            <h6>Mostrar Lista</h6>
                            <p>
                            Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado de los productos que tenemos almacenados hasta el momento, en esa lista tendríamos acceso a la opción de seleccionar o eliminar un producto.
                            <br />
                            Si se selecciona el botón de seleccionar dentro de la tabla, se llenaran los campos del formulario, para proceder a modificar el campo que se desee.
                                <br />
                            Modificar: Este botón se habilitará luego de darle click al botón de seleccionar.
                            
                            <br />
                            Eliminar: Al tocar este botón se mostrará un mensaje de confirmación como este, ("¿Esta seguro?"), si se le da aceptar, se eliminará la tabla y si se le da cancelar se cancelará la eliminación y va a redireccionar al menú principal.
                        </p>
                        <br />
                        <h6>Botón guardar</h6>
                        <p>
                            Al tocar este botón lo que estamos haciendo es registrar todos los datos de los campos anteriores que dijitamos, los cambios se podrán visualizar dando click en la etiqueta "Mostrar lista", antes mencionada.
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
            <div class="col-md-4">
                <div class="form-group">
                    <label>Nombre del Producto</label>
                    <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtNombreProducto" ErrorMessage=" *Es necesario indicar un nombre" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="col-md-4">
                <div class="form-group">
                    <label>Categoría</label>
                    <asp:DropDownList ID="dropCategoria" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Descripción</label>
                    <asp:TextBox ID="txtDescripcionProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtDescripcionProducto" ErrorMessage=" *Digite una descripción del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
             </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Propósito del producto</label>
                    <asp:TextBox ID="txtPropositoProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtPropositoProducto" ErrorMessage="Digite un propósito para el producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>       
            <div class="col-md-4">
                <div class="form-group">
                    <label>Precio unitario</label>
                    <asp:TextBox ID="txtPrecioProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtPrecioProducto" ErrorMessage="Digite el precio del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="El precio no puede ser negativo, no debe contener puntos, se acepta un dígito entero, si necesita un decimal debe indicarlo con una coma','" ControlToValidate="txtPrecioProducto" ValidationGroup="ManteP" ValidationExpression="^[0-9]\d*(\,\d+)?$"></asp:RegularExpressionValidator>

                </div>
            </div>   
               
                <div class="col-md-4">
                <div class="form-group">
                    <label>Cantidad actual</label>
                    <asp:TextBox ID="txtCantidad" TextMode="Number" min="1" step="1" Text="0" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtCantidad" ErrorMessage="Digite la cantidad del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Estado</label>
                    <asp:DropDownList ID="dropEstado" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

                   <div class="col-md-6">
                <div class="form-group">
                    <label>Nota para inventario</label>
                    <asp:TextBox ID="txtNota" min="1" step="1"  runat="server" CssClass="form-control" placeHolder="* Opcional *"></asp:TextBox>
                    
                </div>
            </div>
                 <div class="col-md-6">
                <div class="form-group">
               
                </div>
            </div>
           
             
            <div class="col-md-3">
                <div class="form-group">
                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" ValidationGroup="ManteP" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    <asp:Button ID="btnModificar" class="btn btn-primary btn-round" runat="server" Text="Modificar" Visible="false" OnClick="btnModificar_Click"/>
                </div>
                </div>
               

                 <div class="col-12 tab">
                    <input id="tab-1" type="checkbox" style="display:none">
                     <hr />
                    <label for="tab-1">Mostrar lista</label>
                    <div class="tab-content">
                   <div style="overflow: scroll">

                   

          <asp:GridView ID="gridProductos" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" PageSize="5" AllowPaging="True" AllowSorting="True" OnRowDeleting="gridProductos_RowDeleting" OnPageIndexChanging="gridProductos_PageIndexChanging" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged" OnRowDataBound="gridProductos_RowDataBound" Width="100%">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Editar" ShowHeader="true" HeaderText="Seleccionar" ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ShowHeader="true" HeaderText="Eliminar" ButtonType="Image" DeleteImageUrl="~/assets/img/basurero.jpg" />
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="idcategoria" HeaderText="Categoría" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripción"  />
                <asp:BoundField DataField="proposito" HeaderText="Propósito" />
                <asp:BoundField DataField="precio" HeaderText="Precio" />
                <asp:BoundField DataField="estado" HeaderText="Estado" />
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
