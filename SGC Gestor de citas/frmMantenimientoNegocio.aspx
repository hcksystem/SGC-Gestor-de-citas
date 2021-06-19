<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoNegocio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoNegocio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="panel-header panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Negocio</h5>
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-5 pr-1">
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <asp:TextBox ID="txtNombreNegocio" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 px-1">
                                <div class="form-group">
                                    <label>Nuestra Mision</label>
                                    <asp:TextBox ID="txtMision" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Nuestra Vision</label>
                                    <asp:TextBox ID="txtVision" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 pr-1">
                                <div class="form-group">
                                    <label>Logo</label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Negocio" />
                      </div>
                    </div>
                                 <div class="col-md-4 pr-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnMostrarLista" class="btn btn-primary btn-round" runat="server" Text="Mostrar lista" />
                      </div>
                    </div>
                       
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" />
                      </div>
                    </div>
                  </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
