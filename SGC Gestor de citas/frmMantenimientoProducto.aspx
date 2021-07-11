﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoProducto.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!Doctype html>
    <html>
    
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />

     <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />

<div class="panel-header-sm">
</div>
<div class="content">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="title">Formulario de Productos</h5>
            </div>
            <hr />
            <div class="card-body">

           <div class="row">
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Nombre del Producto</label>
                    <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtNombreProducto" ErrorMessage=" *Es necesario indicar un nombre" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Categoría</label>
                    <asp:DropDownList ID="dropCategoria" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Descripción</label>
                    <asp:TextBox ID="txtDescripcionProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtDescripcionProducto" ErrorMessage=" *Digite una descripción del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
             </div>
            <div class="col-md-6 pl-1">
                <div class="form-group">
                    <label>Propósito del producto</label>
                    <asp:TextBox ID="txtPropositoProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtPropositoProducto" ErrorMessage="Digite un propósito para el producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>       
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <label>Precio unitario</label>
                    <asp:TextBox ID="txtPrecioProducto" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteP"
                        ControlToValidate="txtPrecioProducto" ErrorMessage="Digite el precio del producto" Display="Dynamic"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El precio no puede ser negativo, no debe contener puntos o comas, solo se acepta un dígito entero" ControlToValidate="txtPrecioProducto" ValidationGroup="ManteP" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

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
                </div>
            </div>
            <div class="col-md-4 pl-1">
                <div class="form-group">
                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" ValidationGroup="ManteP" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    <asp:Button ID="btnModificar" class="btn btn-primary btn-round" runat="server" Text="Modificar" Visible="false" OnClick="btnModificar_Click"/>
                </div>
                </div>
               </div>

                 <div class="col-12 tab">
                    <input id="tab-1" type="checkbox" style="display:none">
                     <hr />
                    <label for="tab-1">Mostrar lista</label>
                    <div class="tab-content">
                   <div style="overflow: scroll">

           <%-- <asp:GridView ID="gridProductos" runat="server" CssClass="mGrid GridView" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" ShowFooter="True" OnRowCancelingEdit="gridProductos_RowCancelingEdit" OnRowDeleting="gridProductos_RowDeleting" OnRowEditing="gridProductos_RowEditing" OnRowUpdating="gridProductos_RowUpdating" OnPageIndexChanging="gridProductos_PageIndexChanging" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged">                               
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Editar" ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ButtonType="Image" DeleteImageUrl="~/assets/img/basurero.jpg" />

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
                    </asp:GridView>--%>

          <asp:GridView ID="gridProductos" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" PageSize="5" AllowPaging="True" AllowSorting="True" Width="1240px" OnRowDeleting="gridProductos_RowDeleting" OnPageIndexChanging="gridProductos_PageIndexChanging" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged" OnRowDataBound="gridProductos_RowDataBound">
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
</html>




</asp:Content>
