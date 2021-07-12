<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmInventario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmInventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="assets/css/now-ui-dashboard.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />

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



                                <div class="row" minimumvalue="1">


                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Categorias"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="dropCategorias" runat="server" CssClass="form-control" OnSelectedIndexChanged="dropCategorias_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="lblCantidadModificar" runat="server" Text="Cantidad de Stock" Visible="true"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtCantidad" TextMode="Number" min="1" step="1" Text="0" runat="server" CssClass="form-control" Visible="true"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="lblAcciones" runat="server" Text="Seleccione una acción" Visible="true"></asp:Label>
                                            <br />
                                 <asp:DropDownList ID="dropSumRes" runat="server" CssClass="form-control" AutoPostBack="true" Visible="true"></asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:GridView ID="gridLista" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True" OnRowDataBound="gridLista_RowDataBound" OnPageIndexChanging="gridLista_PageIndexChanging" OnSelectedIndexChanged="gridLista_SelectedIndexChanged" >
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" HeaderText="Seleccionar" SelectImageUrl="~/assets/img/Seleccionar).png" ShowSelectButton="True" />
                                                    <asp:BoundField DataField="id" HeaderText="Código"></asp:BoundField>
                                                    <asp:BoundField DataField="nombre" HeaderText="Producto"></asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Descripción"></asp:BoundField>
                                                    <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="₡{0:N2}"></asp:BoundField>

                                                </Columns>

                                                <HeaderStyle CssClass="table-info" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:GridView ID="gridInventario" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True" OnRowDataBound="gridInventario_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="idProducto" HeaderText="Producto"></asp:BoundField>
                                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad"></asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Descripción"></asp:BoundField>

                                                </Columns>

                                                <HeaderStyle CssClass="table-info" />
                                            </asp:GridView>
                                        </div>
                                    </div>

                                 

                                    <hr />
                                     <div class="col-md-4">
                                        <div class="form-group">

                                           
                                        </div>
                                    </div>
                                    
                                     <div class="col-md-4">
                                        <div class="form-group">

                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-round " OnClick="btnGuardar_Click" />
                                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-round" />
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
