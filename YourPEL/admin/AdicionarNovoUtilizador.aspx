<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="AdicionarNovoUtilizador.aspx.cs" Inherits="AdminYourPEL.AdicionarNovoUtilizador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="AdicionarNovoVideo" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation" class="active"><a href="addDocumentos.aspx">Criar Utilizador</a></li>
    </ul>
    <br />
    <br />
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>User: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="user" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Password:</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="pass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Tipo:</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:DropDownList ID="ddtipo" CssClass="form-control" runat="server">
                            <asp:ListItem Selected="True" Value="A">Administrador</asp:ListItem>
                            <asp:ListItem Value="M">Moderador</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="submeter" runat="server" class="btn btn-block btn-danger" Text="Publicar" OnClick="submeter_Click" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="sair" runat="server" class="btn btn-block btn-danger" Text="Sair" OnClick="sair_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
