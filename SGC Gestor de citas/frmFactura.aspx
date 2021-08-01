<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmFactura.aspx.cs" Inherits="SGC_Gestor_de_citas.frmFactura" %>
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
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
     <div class="panel-header-sm">
    </div>
    <div class="content" style="min-height:500px">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Facturas
                        </h5>
                    </div>

                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-inline">
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txtNumFact" TextMode="Number" placeholder="Número Factura" AutoPostBack="true" OnTextChanged="txtNumFact_TextChanged"/>
                                </div>
                                    </div>
                            </div>
                            <div class="col-md-12"><rsweb:ReportViewer  Width="100%" Skin="WebBlue" 
            ZoomMode="Percent" 
            ZoomPercent="100" ID="ReportViewer1" runat="server" ShowBackButton="False" 
                                    ShowCredentialPrompts="False" ShowDocumentMapButton="False" 
                                    ShowFindControls="False" ShowPageNavigationControls="False" 
                                    ShowParameterPrompts="False" ShowPromptAreaButton="False" 
                                    ShowZoomControl="False"></rsweb:ReportViewer>
                            </div>
                        </div>
                            
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
