<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmCitaHorario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmCitaHorario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
    <style>
  
        h5 {
            margin-bottom: -20px;
        }
                .h6, h6 {
            font-size: 1rem;
            font-weight: bold;
        }
                .btn{
                    margin-bottom:-62px;
                }
    </style>
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Gestión de citas</h5>
                        <br />

                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Cita</h5>
                                <br />
                                <h6>Resumen de servicio elegido</h6>
                                <p>
                                    Espacio donde se visualizará el resumen del servicio seleccionado, es importante verificar que se haya elegido el servicio deseado, sino se puede dar click en el botón que dice "cancelar" para retroceder una pantalla y elegir el servicio que se desea.
                             <br />  
                                </p>
                                <br />
                                <h6>Fecha de atención</h6>
                                <p>Espacio para elegir la fecha de atención, se visualizará un calendario para reservar la cita, tome en cuenta que si el espacio adyacente "horario disponible" no habilita las horas es por qué no hay citas en la fecha seleccionada, igualmente solo estarán habilitadas las fechas en las que el negocio labora.</p>
                                <br />
                                <h6>Horario disponible</h6>
                                <p>
                                    Se mostrarán las horas disponibles para la fecha seleccionada.
                                    <br />
                                    NOTA: Para que se habiliten las horas se debe seleccionar primero una fecha, si no hay horas disponibles proceda a elegir otra fecha, si no sale la hora que se desea es por que la cita ya fue reservada.
                           
                                </p>
                                <br />
                                <h6>Descripción </h6>
                                <p>
                                   Espacio para digitar una descripción: por ejemplo: corte de pelo - en capas, decoloración, balayage.
                                    <br />
                                    Este espacio es opcional, pero tome en cuenta que es muy importante para nosotros que se brinde esta información.
                                </p>
                                <br />
                                <h6>Botón Guardar</h6>
                                <p>
                                    Al tocar este botón se reservará su cita, seguidamente se mostrará un mensaje: "se ha registrado correctamente".
                                </p>
                                <h6>!IMPORTANTE¡ Podrá ver la confirmación de su cita en su correo electrónico</h6>
                            </div>

                        </div>
                        <hr />

                        <asp:Label ID="Label3" runat="server" class="col col-form-label" Text="Nombre" Font-Bold="true">Servicio seleccionado</asp:Label>
                        <div class="col-md-6">
                            <div style="background-color: lightcyan; border-radius: 10px; color: black; padding: .5em; margin-left: -17px;">
                                <asp:DropDownList ID="dropServicio" OnSelectedIndexChanged="dropServicio_SelectedIndexChanged" class="form-control" Visible="false" runat="server" AutoPostBack="true"></asp:DropDownList>

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <span style="font-weight: bold;">Nombre: </span>
                                        <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label><br />
                                        <span style="font-weight: bold;">Descripción: </span>
                                        <asp:Label ID="lblDescripcion" runat="server" Text=""></asp:Label><br />
                                        <span style="font-weight: bold;">Precio: ₡</span>
                                        <asp:Label ID="lblPrecio" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lblId" runat="server" Text="" Visible="false"></asp:Label>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>

                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <br />
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Fecha de atención:</label>
                                    <asp:TextBox ID="txtFechaAtencion" AutoPostBack="true" OnTextChanged="txtFechaAtencion_TextChanged" TextMode="Date" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteC"
                                        ControlToValidate="txtFechaAtencion" ErrorMessage="La fecha de atención es necesaria" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <br />
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Horario disponible:</label>
                                    <asp:DropDownList CssClass="form-control" ID="HorarioDisponible" runat="server" OnSelectedIndexChanged="HorarioDisponible_SelectedIndexChanged"></asp:DropDownList>

                                </div>
                            </div>
                            <br />
                            <div class="col-md-8 pl-1">
                                <div class="form-group">
                                    <label>Descripción:</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeHolder="* Descripción opcional *"></asp:TextBox>

                                </div>
                            </div>
                            <br />
                            <br />

                            <div class="col-md-4">
                                <div class="form-group">

                           <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-primary btn-round" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-primary btn-round" OnClick="btnCancelar_Click" />

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
