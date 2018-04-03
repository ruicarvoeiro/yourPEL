<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Estatistica.aspx.cs" Inherits="AdminYourPEL.Estatistica" %>
<asp:Content ID="Content12" ContentPlaceHolderID="Estatistica" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="EstatisticaGoogle.aspx">Estatísticas Google</a></li>
        <li role="presentation"><a href="EstatisticaInstagram.aspx">Estatísticas Instagram</a></li>
    </ul>
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="page-header">
            <h1>Página Estatísticas YourPEL</h1>
        </div>

        <div class="auto-style3">
            <asp:Label runat="server" ID="lbVisitas"></asp:Label>
        </div>

        <div class="auto-style3">
            <asp:Label runat="server" ID="lbVisitasUnicas"></asp:Label>
        </div>

        <div>
            <p class="auto-style3">Visitas diárias nos últimos 10 dias</p>
            <p>
                <img src="/GraficoVisitas.cshtml" />
            </p>
        </div>

        <div>
            <p class="auto-style3">Visitas por dispositivo</p>
            <p>
                <img src="/GraficoDispositivos.cshtml" />
            </p>
        </div>

        <div>
            <p class="auto-style3">Visitas por Tema</p>
            <p><img src="/GraficoTemas.cshtml" /> </p>
        </div>

        <div>
            <p class="auto-style3">10 Artigos mais visitados</p>
            <p><img src="/GraficoArtigos.cshtml" /> </p>
        </div>

        <div class="page-header">
            <h1>Estatísticas Fórum YourPEL</h1>
        </div>

        <div class="auto-style3">
            <asp:Label runat="server" ID="lbTopicosAbertos"></asp:Label>
        </div>

        <div class="auto-style3">
            <asp:Label runat="server" ID="lbTopicosFechados"></asp:Label>
        </div>               

        <div class="auto-style3">
            <asp:Label runat="server" ID="lbRespostas"></asp:Label>
        </div>
        <br />
        <br />
        <div class="row">
                <div class="col-md-1">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="criar" runat="server" class="btn btn-block btn-danger" Text="Exportar dados para CSV"  OnClick="btnCsvClick"/>
                    </div>
                </div>
         </div>
         <div class="row">
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:Label ID="lbCsv" runat="server"></asp:Label>
                    </div>
                </div>
         </div>
    </form>
</asp:Content>
<asp:Content ID="Content13" ContentPlaceHolderID="EstatisticaInstagram" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="EstatisticaGoogle" runat="server">
</asp:Content>
