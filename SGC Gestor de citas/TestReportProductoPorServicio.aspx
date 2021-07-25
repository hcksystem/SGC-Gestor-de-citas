<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="TestReportProductoPorServicio.aspx.cs" Inherits="SGC_Gestor_de_citas.TestReportProductoPorServicio" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content" style="overflow:scroll">
    <div class="form-inline">
        <div class="form-group">
            <asp:RadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" CssClass="form-check">
            <asp:ListItem class="form-check-input" Text="Fecha" Value="1"></asp:ListItem>
            <asp:ListItem class="form-check-input" Text="Filtro Reporte" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group" runat="server" id="divFiltro">
            <asp:TextBox CssClass="form-control" runat="server" ID="txtFiltro"/>
        </div>
        <div class="form-group" runat="server" id="divRango">
            <asp:TextBox CssClass="form-control" runat="server" ID="txtDesde" TextMode="Date"/>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtHasta" TextMode="Date"/>
        </div>
        </div>
        <div class="form-group">
            <asp:Button CssClass="btn btn-info" runat="server" ID="btnGenerar" Text="Generar" OnClick="btnGenerar_Click" />
        </div>
        <div >
            <rsweb:ReportViewer  Width="100%" Skin="WebBlue" 
            ZoomMode="Percent" 
            ZoomPercent="100" ID="ReportViewer1" runat="server"></rsweb:ReportViewer>
        </div>
        </div>
</asp:Content>
