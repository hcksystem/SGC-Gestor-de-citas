<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoNegocio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoNegocio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
    
    <style  type="text/css">
        
        #global {
            height: 300px;
            width: 200px;
            border: 1px solid #ddd;
            background: #f1f1f1;
            overflow-y: scroll;
        }

        #mensajes {
            height: auto;
        }

        .texto {
            padding: 4px;
            background: #fff;
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
                        <h5 class="title">Negocio</h5>

                         <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mantenimiento de categorías</h5>
                                <h6>Nombre de la categoría</h6>
                                <p>
                                    Espacio donde se debe indicar una categoría en la cual desee catalogar sus productos.
                             <br />
                                    Por ejemplo: cosméticos, electrónicos, cuidado para la piel, productos de latex etc.
                                </p>
                                <br />
                                <h6>Botón de guardar</h6>
                                <p>Se guardará la categoría que se digito en el espacio de nombre</p>
                                <br />
                                <h6>Mostrar Lista</h6>
                                <p>
                                    Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado
                            de las categorías que tenemos almacenadas hasta el momento, en esa lista tendríamos acceso a la opción de seleccionar o eliminar una categoría.
                                </p>
                                <br />
                                <h6>Seleccionar</h6>
                                <p>
                                    Se habilitarán los espacios para que se edite la información necesaria y se llenarán los campos dentro del formulario para seguidamente editar lo que se desee y se le da al botón modificar. Luego de esto se podrán visualizar los cambios atualizados en la tabla.
                                </p>
                                <br />
                                <h6>Eliminar</h6>
                                <p>
                                    Al tocar este botón se mostrará un mensaje de confirmación como este, ("Esta seguro que desea eliminar este registro?"), si se le da aceptar, se eliminará el registro selecionado y si se le da cancelar la acción se anulará.
                                </p>

                            </div>

                        </div>
                    </div>
                    <hr />
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <asp:TextBox ID="txtNombreNegocio" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtNombreNegocio" ErrorMessage="El nombre del negocio es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtDescripcion" ErrorMessage="La descripción es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Nuestra Misión</label>
                                    <asp:TextBox ID="txtMision" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtMision" ErrorMessage="La misión es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Nuestra Visión</label>
                                    <asp:TextBox ID="txtVision" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="txtVision" ErrorMessage="La visión es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-md-12 pl-1">
                                <div>
                                    <label>Logo</label>
                                    <br />

                                    <asp:FileUpload ID="FileUpload1" accept=".jpg" runat="server" ForeColor="#626c7d" Font-Size="Small" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteN"
                                        ControlToValidate="FileUpload1" ErrorMessage="El logo es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" ValidationGroup="ManteN" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    <asp:Button ID="btnModificar" CssClass="btn btn-primary btn-round" runat="server" Text="Modificar" Visible="false" OnClick="btnModificar_Click" />
                                </div>
                            </div>

                            <div class="col-12 tab">
                                <input id="tab-1" type="checkbox" style="display: none">
                                <hr />
                                <label for="tab-1">Mostrar lista</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">
                                        <asp:GridView CssClass="mGrid GridView" ID="gridNegocio" Width="100%" OnRowDataBound="gridNegocio_RowDataBound" PagerStyle-CssClass="pgr" PageSize="2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" ShowFooter="True" OnRowCancelingEdit="gridNegocio_RowCancelingEdit" OnRowDeleting="gridNegocio_RowDeleting" OnRowEditing="gridNegocio_RowEditing" OnRowUpdating="gridNegocio_RowUpdating" OnPageIndexChanging="gridNegocio_PageIndexChanging" OnSelectedIndexChanged="gridNegocio_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField ShowHeader="true" HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Select" ImageUrl="~/assets/img/Seleccionar).png" Text="Seleccionar" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="true" HeaderText="Eliminar">
                                                    <ItemTemplate>
                                                        <%--<asp:HiddenField ID="hdID" Value='<%# Eval("id") %>' runat="server" />--%>
                                                        <asp:ImageButton ID="btnSweetAlert" runat="server" CommandName="Delete" ImageUrl="~/assets/img/basurero.jpg" Text="Eliminar" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="id" HeaderText="ID" />

                                                <asp:TemplateField HeaderText="Nombre">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<% # Bind("nombre") %>' Width="170"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtNombre" runat="server" Text='<% # Bind("nombre") %>' Width="170"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Logo">
                                                    <ItemTemplate>
                                                        <img src='<%# Eval("logo") %>' id="imageControl" runat="server" width="90" height="100" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<% # Bind("descripcion") %>' Width="170"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtDescripcion" runat="server" Text='<% # Bind("descripcion") %>' Width="170"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Misión">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<% # Bind("mision") %>' Width="170"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtMision" runat="server" Text='<% # Bind("mision") %>' Width="170"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Visión">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<% # Bind("vision") %>' Width="170"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtVision" runat="server" Text='<% # Bind("vision") %>' Width="170"></asp:TextBox>
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
