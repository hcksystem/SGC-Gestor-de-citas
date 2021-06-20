﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoServicio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
    <html>
    <link href="assets/css/estilogrid.css" rel="stylesheet" />   

    <div class="panel-header-sm">
        </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Mantenimiento de Servicios</h5>
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-5 pl-1">
                                <div class="form-group">
                                    <label>Nombre </label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 pl-1">
                                <div class="form-group">
                                    <label>Descripcion</label>

                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Precio estimado</label>

                                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Tiempo estimado </label>
                                    <asp:TextBox ID="txtTiempoEstimado" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div>

                                    <label>Foto </label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />

                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">

                                    <label>Producto necesario </label>
                                    <asp:DropDownList ID="dropProducto" runat="server"></asp:DropDownList>

                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">

                                    <label>Foto </label>
                                    <asp:DropDownList ID="dropNegocio" runat="server"></asp:DropDownList>

                                </div>
                            </div>

                            <div class="col-md-3 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-3 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Servicio" OnClick="btnGuardar_Click" />                   
                                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Cancelar" />
                                </div>
                            </div>
                        <head>
                            <meta charset="utf-8" />
                            <title>Lista Servicios</title>
                            <link href="assets/css/now-ui-dashboard.css" rel="stylesheet" />
                        </head>
                        <body>
                            <input type="checkbox" id="btn-modal" />
                            <label for="btn-modal" class="lbl-modal">Mostrar Lista</label>
                            <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                            <header>Lista Servicios</header>
                            <label for="btn-modal">X</label>

                <asp:GridView ID="gridServicios" runat="server" CssClass="mGrid GridView" AutoGenerateColumns="False" DataKeyNames="id" AllowSorting="false" ShowFooter="True" OnRowCancelingEdit="gridServicios_RowCancelingEdit" OnRowDeleting="gridServicios_RowDeleting" OnRowEditing="gridServicios_RowEditing" OnRowUpdating="gridServicios_RowUpdating" OnRowDataBound="gridServicios_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<% # Bind("id") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIDServicio" runat="server" Text='<% # Bind("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NOMBRE">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<% # Bind("nombre") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombreServicio" runat="server" Text='<% # Bind("nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DESCRIPCION">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<% # Bind("descripcion") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescripcionServicio" runat="server" Text='<% # Bind("descripcion") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PRECIO ESTiMADO">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<% # Bind("precioEstimado") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrecioEstimado" TextMode="Number" runat="server" Text='<% # Bind("precioEstimado") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TIEMPO ESTIMADO">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<% # Bind("tiempoEstimado") %>'></asp:Label>
                        <%--configurar algo para el datetime--%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTiempoEstimado" TextMode="DateTime" runat="server" Text='<% # Bind("tiempoEstimado") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FOTO SUGERIDA">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<% # Bind("fotoSugerida") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="fileFoto" runat="server"></asp:FileUpload>
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
                <asp:TemplateField HeaderText="PRODUCTO">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<% # Bind("idProducto") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropProducto" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NEGOCIO">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<% # Bind("idNegocio") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropNegocio" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                            &nbsp;<asp:Button ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        </ItemTemplate>
                    </asp:TemplateField>

 


                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
               </asp:GridView>                   
            </div>
        </div>
    </body>
</html>

</asp:Content>
