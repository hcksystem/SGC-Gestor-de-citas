<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmInventario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmInventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="assets/css/now-ui-dashboard.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />
     <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />


    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <!DOCTYPE html>
    <html>



    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title">Inventario</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>



                                <div class="row" >


                                  <%--  <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Categorias"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="dropCategorias" runat="server" CssClass="form-control" OnSelectedIndexChanged="dropCategorias_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                    </div>--%>

                                       <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Buscar producto"></asp:Label>
                                            <br />

                                            <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" placeHolder="Buscar por nombre de producto" CssClass="form-control p-3" OnTextChanged="txtBuscar_TextChanged"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-md-2 ">
                                        <div class="form-group">
                                            <br />
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn " OnClick="btnBuscar_Click" />

                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:GridView ID="gridInventario" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True" OnRowDataBound="gridInventario_RowDataBound" OnSelectedIndexChanged="gridInventario_SelectedIndexChanged">
                                                <Columns>
                                                 <asp:CommandField ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png" ShowSelectButton="True" HeaderText="Seleccionar" />
                                                    <asp:BoundField DataField="id" HeaderText="Codigo" ></asp:BoundField>
                                                    <asp:BoundField DataField="idProducto" HeaderText="Producto" Visible="true" ></asp:BoundField>
                                                    <asp:BoundField DataField="nombre" HeaderText="Producto"></asp:BoundField>
                                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad"></asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Descripción"></asp:BoundField>

                                                </Columns>

                                                <HeaderStyle CssClass="table-info" />
                                            </asp:GridView>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtStock" runat="server" Visible="false"></asp:TextBox>
                                        </div>
                                    </div>
                                        <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="lblCantidadModificar" runat="server" Text="Cantidad a cambiar" Visible="false"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtCantidadNueva" TextMode="Number" min="1" step="1" Text="0" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="lblAcciones" runat="server" Text="Seleccione una acción" Visible="false"></asp:Label>
                                            <br />
                                 <asp:DropDownList ID="dropSumRes" runat="server" CssClass="form-control" AutoPostBack="true" Visible="false"></asp:DropDownList>

                                        </div>
                                    </div>
                                 
                                     <div class="col-md-4">
                                        <div class="form-group">

                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-round " OnClick="btnGuardar_Click" Visible="false"/>
                                             <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-round " OnClick="btnCancelar_Click" Visible="false"/>

                                        </div>
                                    </div>
                                        



                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .btn{background-color:#626c7d}
            .btn:hover{background-color:#0c3254;}           
            .table th{color:white}
        </style>
    </html>
    

</asp:Content>
