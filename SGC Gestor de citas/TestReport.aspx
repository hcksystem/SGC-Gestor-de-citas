<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="TestReport.aspx.cs" Inherits="SGC_Gestor_de_citas.TestReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
    <div class="form-inline">
        <div class="form-group">
    <asp:TextBox CssClass="form-control" runat="server" ID="txtFechaDesde" TextMode="Date"></asp:TextBox>
            </div>
        <div class="form-group">
    <asp:TextBox CssClass="form-control" runat="server" ID="txtFechaHasta" TextMode="Date"></asp:TextBox>
            </div>
        <div class="form-group">
            <asp:Button CssClass="btn btn-info" runat="server" ID="btnGenerar" Text="Generar" OnClick="btnGenerar_Click" />
        </div>
        </div>
        <div>
            <rsweb:ReportViewer Height="800px" Width="800px" Skin="WebBlue" 
            ZoomMode="Percent" 
            ZoomPercent="100" ID="ReportViewer1" runat="server"></rsweb:ReportViewer>
        </div>
        </div>
</asp:Content>
