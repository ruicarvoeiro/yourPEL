<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="GestaoGlossario.aspx.cs" Inherits="AdminYourPEL.GestaoGlossario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="GestaoGlossario" runat="server">

        <br />
        <br />
        <br />
        <ul class="nav nav-pills">
            <!-- class="active" -->
            <li role="presentation"><a href="GlossarioA.aspx">Alimentação</a></li>
            <li role="presentation"><a href="GlossarioC.aspx">Consumos Nocivos</a></li>
            <li role="presentation"><a href="GlossarioS.aspx">Sexualidade</a></li>
        </ul>
        <br />
        <br />
        
</asp:Content>
<asp:Content ID="GlossariaAlimentacao" ContentPlaceHolderID="GlossarioA" runat="server">
</asp:Content>
<asp:Content ID="GlossarioConsumos" ContentPlaceHolderID="GlossarioC" runat="server">
</asp:Content>