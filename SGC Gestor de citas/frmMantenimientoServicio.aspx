<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoServicio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />
    <!DOCTYPE html>
    <html>
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Mantenimiento de Servicios</h5>
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
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Tiempo estimado </label>
                                    <asp:TextBox ID="txtTiempoEstimado" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteS"
                                        ControlToValidate="txtTiempoEstimado" ErrorMessage="El tiempo es necesario" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Descripcion</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteS"
                                        ControlToValidate="txtDescripcion" ErrorMessage="La descripcion es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div>
                                    <label>Foto </label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="#626c7d" Font-Size="Small" />
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
                                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Limpiar" />
                                </div>
                            </div>                                                  
                        </div>
                        <div class="col-12 tab">
                            <input id="tab-1" type="checkbox" style="display: none">
                            <hr />
                            <label for="tab-1">Mostrar Lista</label>
                            <div class="tab-content">

                                <div style="overflow: scroll">

                                    <asp:GridView ID="gridServicios" runat="server" CssClass="mGrid GridView" AutoGenerateColumns="False" DataKeyNames="id" AllowSorting="false" ShowFooter="True" OnRowDeleting="gridServicios_RowDeleting"  OnRowDataBound="gridServicios_RowDataBound" OnPageIndexChanging="gridServicios_PageIndexChanging" OnSelectedIndexChanged="gridServicios_SelectedIndexChanged">
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
                                            <asp:TemplateField HeaderText="Foto">
                                                <ItemTemplate>
                                                    <img src='<%# Eval("fotoSugerida") %>' id="imageControl" runat="server" width="70" height="100" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
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
