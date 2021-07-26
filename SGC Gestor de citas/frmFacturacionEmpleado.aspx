<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado.Master" AutoEventWireup="true" CodeBehind="frmFacturacionEmpleado.aspx.cs" Inherits="SGC_Gestor_de_citas.frmFacturacionEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn {
            background-color: #626c7d
        }

            .btn:hover {
                background-color: #0c3254;
            }

        .example1 {
            border-radius: 15px;
            width: 150px;
        }

        .mySelect {
            border-radius: 0;
            -webkit-appearance: none;
        }
    </style>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
    <link href="assets/css/estiloLista.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#<%=txtBuscar.ClientID %>").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: '<%=ResolveUrl("~/WS.asmx/GetAutoCompleteData") %>',
                            data: "{ 'Texto': '" + request.term + "'}",
                            dataType: "json",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item
                                    }
                                }))
                            },
                            error: function (response) {
                                alert(response.responseText);
                            },
                            failure: function (response) {
                                alert(response.responseText);
                            }
                        });
                    },
                    select: function (e, i) {
                        $("#<%=txtBuscar.ClientID %>").tooltip(i.item.val);
                    },
                    minLength: 1
                });
            });
    </script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#<%=txtBuscarCliente.ClientID %>").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: '<%=ResolveUrl("~/WS.asmx/GetClientes") %>',
                            data: "{ 'Texto': '" + request.term + "'}",
                            dataType: "json",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item
                                    }
                                }))
                            },
                            error: function (response) {
                                alert(response.responseText);
                            },
                            failure: function (response) {
                                alert(response.responseText);
                            }
                        });
                    },
                    select: function (e, i) {
                        $("#<%=txtBuscarCliente.ClientID %>").tooltip(i.item.val);
                    },
                    minLength: 1
                });
            });
    </script>
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
                        <h5 class="title">Facturación</h5>
                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Facturación</h5>
                                <br />
                                <p>
                                    En la parte superior se mostrarán espacios importantes para poder efectuar la factura.
                                    <br />
                                    * Nº Factura: Este campo contiene el código de factura, es un código único y cada factura contiene un código diferente.<br />
                                    * Fecha: Captura la fecha actual del sistema.<br />
                                    * Encargado: Captura el usuario registrado en el sistema, puede ser el administrador o empleado registrado en ese momento en el sistema.
                                    <br />
                                </p>
                                <h6>Cliente</h6>
                                <p>
                                    Espacio donde se debe elegir al cliente al que se va a facturar, puede buscarlo por cualquier dato: nombre, apellido, identificación, teléfono o id.
                                    <br />
                                    Estos estan divididos por su rol dentro del sistema:
                                    <br />
                                    por ejemplo:
                                    <br />
                                    * (Administrador;nombre apellido; 109870765).<br />
                                    * (Cliente;nombre apellido; 109870765).<br />
                                    * (Empleado;nombre apellido; 109870765).<br />
                                </p>
                                <br />


                                <br />
                                <h6>Servicios</h6>
                                <p>
                                    Espacio donde se debe elegir el servicio que se va a facturar, puede buscarlo por cualquier dato: nombre del servicio, precio, o id.
                                    <br />
                                    Estos están divididos por productos(P), servicios(S) y citas (C): por ejemplo:<br />
                                    * (S;1;Cortes de hombre; precio).<br />
                                    * (P;1;Gel;precio).
                                    * (C;1;persona1;precio).

                                </p>
                                <br />
                                <h6>Método de pago</h6>
                                <p>
                                    Se debe elegir el método de pago con el que va a cancelar su factura. 
                                </p>
                                <br />
                                <h6>Cantidad</h6>
                                <p>
                                    En este espacio se pondrá la cantidad de servicios o productos que se están facturando.<br />
                                    Nota: es obligatorio elegir una cantidad para poder efectuar la factura.
                                </p>
                                <br />
                                <h6>Botón agregar línea</h6>
                                <p>
                                    Botón que se encarga de escribir una línea del detalle de la factura, este se irá agregando cada vez que se elija un producto o un servicio.
                                </p>
                                <br />
                                <h6>Total</h6>
                                <p>
                                    Campo que realiza la suma de cada línea insertada y muestra el monto total a facturar.
                                </p>
                                <br />
                                <h6>Lista</h6>
                                Se encarga de mostrar las líneas insertadas.
                            </div>
                            <br />
                            <h6>Botón guardar</h6>
                            <p>Botón encargado de guardar la factura</p>
                            <br />
                            <h6>Botón cancelar</h6>
                            <p>Cancela a acción y hace una redirección al menú principal.</p>
                        </div>
                    </div>
                    <hr style="margin-top: 0rem;" />
                    <div class="card-body" style="padding-top: 0px">
                        <div class="row" style="margin-bottom: 7px;">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nº Factura:</label>
                                    <asp:Label ID="lblFactura" runat="server"></asp:Label>
                                    <asp:Label ID="lblNumero" runat="server" Text=""></asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Encargado:</label>
                                    <asp:Label ID="lblEncargado" runat="server"><%=Session["Usuario"].ToString() %></asp:Label>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Fecha:</label>
                                    <asp:Label ID="lblFecha" runat="server"><%=DateTime.Now.ToShortDateString() %></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cliente:</label>
                                    <asp:Label ID="lblCliente" runat="server"></asp:Label>
                                    <asp:TextBox ID="txtBuscarCliente" runat="server" CssClass="form-control autosuggest" AutoPostBack="true" OnTextChanged="txtBuscarCliente_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Fact"
                                        ControlToValidate="txtBuscarCliente" ErrorMessage="Indique la persona a quien se va a facturar" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <br />

                            <div class="form-group col-sm-12 col-xs-12">
                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; margin-left: auto; margin-right: auto; border-style: inset; border-width: 1px;">
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Servicios</label>
                                    <asp:TextBox ID="txtBuscar" AutoPostBack="true" OnTextChanged="txtBuscar_TextChanged" runat="server" CssClass="form-control autosuggest"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Fact"
                                        ControlToValidate="txtBuscar" ErrorMessage="Indique el servicio o producto a agregar" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Método de pago:</label>
                                    <asp:DropDownList ID="dropMetodopago" AutoPostBack="true" OnSelectedIndexChanged="dropMetodopago_SelectedIndexChanged" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <div runat="server" id="Ult4Digitos">
                                    <asp:TextBox ID="txtNumTarjeta" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <div class="form-group col-sm-12 col-xs-12">
                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; margin-left: auto; margin-right: auto; border-style: inset; border-width: 1px;">
                            </div>
                            <div class="col-md-6">
                                <div class="form-inline">
                                    <table>
                                        <tr>
                                            <td>
                                    <div class=" form-group">
                                        <label class="control-label">Cantidad</label>
                                        <asp:TextBox ID="txtCantidad" TextMode="Number" runat="server" CssClass="form-control-sm" min="1" Text="1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Fact"
                                            ControlToValidate="txtCantidad" ErrorMessage="Digite la cantidad del producto" Display="Dynamic"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="La cantidad debe ser un número positivo" ControlToValidate="txtCantidad" ValidationExpression="^[1-9][0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div></td><td>
                                    <div class="form-group">
                                        <asp:Button CssClass="btn btn-outline-primary" runat="server" ID="btnAgregar" Text="Agregar Linea" OnClick="btnAgregar_Click1" ValidationGroup="Fact" />
                                    </div>
                                                </td></tr>
                                        <tr><td>
                                    <div class="form-group">
                                        <table><tr><td>
                                        <asp:Label ID="Label1" runat="server" Text="Subtotal:" Font-Bold="true"></asp:Label></td><td>
                                        <asp:Label runat="server" ID="TotalFact" Text=""></asp:Label></td></tr>
                                        <tr><td><asp:Label ID="Label4" runat="server" Text="IVA:" Font-Bold="true"></asp:Label></td><td>
                                         <asp:Label runat="server" ID="TotalIVA" Text=""></asp:Label></td></tr>
                                        <tr><td><asp:Label ID="Label2" runat="server" Text="Total:" Font-Bold="true"></asp:Label></td><td>
                                        <asp:Label runat="server" ID="TotalTotal" Text=""></asp:Label></td></tr>
                                            </table>
                                    </div>
                                            </td></tr></table>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:GridView ID="gridVentas" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True">
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
                                    <asp:GridView ID="gridFactura" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="8" AllowPaging="True" OnRowDeleting="gridFactura_RowDeleting">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID"
                                                SortExpression="ID" />
                                            <asp:BoundField DataField="Tipo" HeaderText="Tipo"
                                                SortExpression="Tipo" />
                                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion"
                                                SortExpression="Descripcion" />
                                            <asp:BoundField DataField="Precio" HeaderText="Precio"
                                                SortExpression="Precio" />
                                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad"
                                                SortExpression="Cantidad" />
                                            <asp:TemplateField>

                                                <ItemTemplate>

                                                    <asp:LinkButton runat="server" ID="btnDelete" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Desea eliminar esta linea?');" />

                                                    <img src="assets/img/basurero.jpg" width="25px" alt="">
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                
                                        </Columns>

                                        <HeaderStyle CssClass="table-info" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" CssClass="btn btn-outline-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" CssClass="btn btn-outline-primary" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" CssClass="btn btn-outline-primary" OnClick="btnImprimir_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
         
</asp:Content>