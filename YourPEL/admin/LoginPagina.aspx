<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Login.Master" AutoEventWireup="true" CodeBehind="LoginPagina.aspx.cs" Inherits="YourPEL.admin.LoginPagina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LoginUtilizador" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>Username: </label>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>Password: </label>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" class="btn btn-block btn-danger" Text="Login" OnClick="btnLogin_Click"/>
                </div>
                <asp:Label ID="lblAviso" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
