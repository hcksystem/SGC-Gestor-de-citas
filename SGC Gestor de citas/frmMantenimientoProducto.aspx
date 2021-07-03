<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoProducto.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!Doctype html>
    <html>
    
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />
<div class="panel-header-sm">
</div>
<div class="content">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="title">Formulario de Productos</h5>
            </div>
            <div class="card-body">

           <div class="row">
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Nombre del Producto</label>
                    <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control" placeHolder="* Dato requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtNombreProducto" ErrorMessage=" *Es necesario indicar un nombre" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Categoria"></asp:Label>
                    <asp:TextBox ID="txtCategoriaProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtCategoriaProducto" ErrorMessage=" *Digite la categoria del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Descripcion</label>
                    <asp:TextBox ID="txtDescripcionProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtDescripcionProducto" ErrorMessage=" *Digite una descripción del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 pl-1">
                <div class="form-group">
                    <label>Cantidad que se posee</label>
                    <asp:TextBox ID="txtCantidadProducto" TextMode="Number" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteP" ControlToValidate="txtCantidadProducto" ErrorMessage="Digite la cantidad de productos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="ManteP" ControlToValidate="txtCantidadProducto" ErrorMessage="La cantidad de producto debe ser mayor que 0" Display="Dynamic" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </div>
            </div>

            <div class="col-md-6 pl-1">
                <div class="form-group">
                    <label>Proposito del Producto</label>
                    <asp:TextBox ID="txtPropositoProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtPropositoProducto" ErrorMessage="Digite un proposito para el producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Precio Unitario</label>
                    <asp:TextBox ID="txtPrecioProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtPrecioProducto" ErrorMessage="Digite el precio del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
           <div class="row">
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
                    </div>
                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Producto" ValidationGroup="ManteP" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                </div>
   <div class="tab">
                                    <input id="tab-1" type="checkbox">
                                    <label for="tab-1">Mostrar Lista</label>
                                    <div class="tab-content">
                                      
                                        <div style="overflow: scroll">

            <asp:GridView ID="gridProductos" runat="server" CssClass="mGrid GridView" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" ShowFooter="True" OnRowCancelingEdit="gridProductos_RowCancelingEdit" OnRowDeleting="gridProductos_RowDeleting" OnRowEditing="gridProductos_RowEditing" OnRowUpdating="gridProductos_RowUpdating" Width="1240px">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />

                            &nbsp;<asp:Button ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<% # Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtID" runat="server" Text='<% # Bind("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NOMBRE">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<% # Bind("nombre") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Text='<% # Bind("nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CATEGORIA">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<% # Bind("categoria") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCategoria" runat="server" Text='<% # Bind("categoria") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DESCRIPCION">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<% # Bind("descripcion") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescripcion" runat="server" Text='<% # Bind("descripcion") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CANTIDAD">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<% # Bind("cantidad") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCantidad" TextMode="Number" runat="server" Text='<% # Bind("cantidad") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROPOSITO">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<% # Bind("proposito") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProposito" runat="server" Text='<% # Bind("proposito") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PRECIO">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<% # Bind("precio") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrecio" runat="server" Text='<% # Bind("precio") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ESTADO">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<% # Bind("estado") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEstado" runat="server" Text='<% # Bind("estado") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                    </div>
                </div>
            
</html>




</asp:Content>
