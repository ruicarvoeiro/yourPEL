<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="AdicionarNovoVideo.aspx.cs" Inherits="AdminYourPEL.AdicionarNovoVideo" %>

<asp:Content ID="Content7" ContentPlaceHolderID="Videos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation" class="active"><a href="AdicionarNovoVideo.aspx">Adicionar Video</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="AdicionarNovoVideo" runat="server">
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Titulo: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="titulo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Autor</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="autor" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Tema</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="tema" CssClass="form-control" runat="server" Text="Videos" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Texto</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="txtVideoDesc" CssClass="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Youtube URL</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="urlYoutube" CssClass="form-control" runat="server" ToolTip="Para um melhor funcionamento do site, o link deverá ser de uma Youtube Playlist."></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:Button ID="submeter" runat="server" class="btn btn-block btn-danger" Text="Publicar" OnClick="submeter_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
