<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmInventario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmInventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
     <link href="assets/css/estiloLista.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

        .table th {
            color: white
        }
       .btn{
           margin-bottom: -4px;
       }
      .mover{
          margin-top:-23px;
      }
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
                    <h5 class="title">Inventario</h5>
                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Formulario de inventario</h5>
                                <h6>inventario</h6>
                                <p>
                                   Formualario diseñado para poder realizar acciones como agregar o disminuir cantidad de productos, esto se podrán visualizar en la tabla on sus respectivos datos.
                             
                                </p>
                                <br />
                                <h6>Botón buscar</h6>
                                <p>
                                    Filtra los productos por nombre, por ejemplo: si coloco crema buscará ese producto y lo mostrará en la tabla.
                                </p>
                                <br />

                                <h6>Seleccionar</h6>
                                <p>
                                   Al presionarlo se habilitarán dos campos.
                                    <br />
                                    Cantidad: Espacio para digitar una cantidad, mayor que 0.
                                    <br />
                                    Seleccione una acción: Seleccionar el espacio que desea según la necesidad. <br />
                                    Agregar: sumar a inventario.
                                    <br />
                                    Disminuir: restar a inventario.
                                </p>
                                <br />
                                <h6>Botón guardar</h6>
                              <p>
                                  Guarda la nueva cantidad.
                              </p>
                                <br />
                                <h6>Botón cancelar</h6>
                                <p>
                                    Cancela la acción y redirige al menú principal.
                                </p>
                            </div>

                        </div>
                </div>
                <hr />
        <div class="card-body">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                               <%-- <asp:Label ID="Label3" runat="server" Text="Buscar producto"></asp:Label>--%>
                                <br />
                                <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" placeHolder="Buscar por nombre de producto" CssClass="form-control mover" OnTextChanged="txtBuscar_TextChanged" AutoComplete="off"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="form-group">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" class="btn btn-primary btn-round" OnClick="btnBuscar_Click"/>
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-primary btn-round" OnClick="btnGuardar_Click" Visible="false" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-primary btn-round" OnClick="btnCancelar_Click" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="col-md-12" >
                            <div class="form-group" style="overflow:scroll">
                                <asp:GridView ID="gridInventario" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True" OnRowDataBound="gridInventario_RowDataBound" OnSelectedIndexChanged="gridInventario_SelectedIndexChanged" Width="100%">
                                    <Columns>
                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png" ShowSelectButton="True" HeaderText="Seleccionar" />
                                        <asp:BoundField DataField="id" HeaderText="Código"></asp:BoundField>
                                        <asp:BoundField DataField="idProducto" HeaderText="id producto" Visible="true"></asp:BoundField>
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
                                <asp:TextBox ID="txtCantidadNueva" TextMode="Number" min="1" step="1" Text="0" runat="server" CssClass="form-control" Visible="false" Height="40px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblAcciones" runat="server" Text="Seleccione una acción" Visible="false"></asp:Label>
                                <br />
                                <asp:DropDownList ID="dropSumRes" runat="server" CssClass="form-control" AutoPostBack="true" Visible="false" Height="40px"></asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div class="col-md-4">
                            <div class="form-group">
                                
                            </div>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>
</div>
</asp:Content>
