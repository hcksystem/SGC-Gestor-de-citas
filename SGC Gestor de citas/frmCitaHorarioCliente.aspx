<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente.Master" AutoEventWireup="true" CodeBehind="frmCitaHorarioCliente.aspx.cs" Inherits="SGC_Gestor_de_citas.frmCitaHorarioCliente" %>

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

        h5 {
            margin-bottom: -20px;
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
                                    <asp:DropDownList CssClass="form-control" ID="HorarioDisponible" runat="server"></asp:DropDownList>

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

                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-round" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-round" />

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
