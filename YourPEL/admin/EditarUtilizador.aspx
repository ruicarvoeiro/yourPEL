<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="EditarUtilizador.aspx.cs" Inherits="AdminYourPEL.EditarUtilizador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EditarUtilizador" runat="server">
    <br />
    <br />
    <br />
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Password Antiga: </label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtPasswordA" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Password Nova: </label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:TextBox ID="PasswordNova1" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Confirmar Password Nova: </label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:TextBox ID="PasswordNova2" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
            </div>
            <asp:Label runat="server" ID="avisos" ></asp:Label>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="submeter" runat="server" class="btn btn-block btn-danger" Text="Confirmar" OnClick="submeter_Click" />
                    </div>
                </div>
            </div>

        </div>
        </form>
</asp:Content>
