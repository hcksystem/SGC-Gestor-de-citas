<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmFacturacion.aspx.cs" Inherits="SGC_Gestor_de_citas.Facturación" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .btn {
            background-color: #626c7d
        }

            .btn:hover {
                background-color: #0c3254;
            }
    </style>
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Facturación</h5>
                    </div>
                    <hr style="margin-top: 0rem;" />
                    <div class="card-body" style="padding-top: 0px">
                        <div class="row" style="margin-bottom: 7px;">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nº Factura:</label>
                                    <asp:Label ID="lblFactura" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Encargado:</label>
                                    <asp:Label ID="lblEncargado" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Fecha:</label>
                                    <asp:Label ID="lblFecha" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cliente:</label>
                                    <asp:Label ID="lblCliente" runat="server"></asp:Label>
                                </div>
                            </div>



                            <br />

                            <div class="form-group col-sm-12 col-xs-12">
                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; margin-left: auto; margin-right: auto; border-style: inset; border-width: 1px;">
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Servicios</label>
                                    <asp:DropDownList ID="dropServicio" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Método de pago:</label>
                                    <asp:DropDownList ID="dropMetodopago" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:TextBox ID="txtNumTarjeta" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-12 col-xs-12">
                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; margin-left: auto; margin-right: auto; border-style: inset; border-width: 1px;">
                            </div>
                           
                            <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="lblCodigo" runat="server" Text="Código:"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="dropBuscar" runat="server" CssClass="form-control"></asp:DropDownList>

<%--                                            <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" placeHolder="Buscar por nombre de producto" CssClass="form-control p-3" OnTextChanged="txtBuscar_TextChanged"></asp:TextBox>--%>

                                        </div>
                                    </div>
                              <div class="col-md-2 ">
                                        <div class="form-group">
                                            <br />
                                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn " OnClick="btnBuscar_Click" />
  
                                        </div>
                                    </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cantidad</label>
                                    
                                    <asp:TextBox ID="txtCantidad" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:GridView ID="gridVentas" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True">
                                                <Columns>
                                                

                                                </Columns>

                                                <HeaderStyle CssClass="table-info" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:GridView ID="gridFactura" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png" ShowSelectButton="True" HeaderText="Seleccionar" />


                                        </Columns>

                                        <HeaderStyle CssClass="table-info" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" CssClass="btn btn-round" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" CssClass="btn btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
