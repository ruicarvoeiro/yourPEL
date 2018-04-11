<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Videos.aspx.cs" Inherits="AdminYourPEL.Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Videos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation"><a href="AdicionarNovoVideo.aspx">Adicionar Video</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Videos</h2>
    <br />
    <br />
    <form id="form1" runat="server">

        <asp:GridView ID="GridView1" runat="server"
                CssClass="table table-hover table-striped" GridLines="None"
                AutoGenerateColumns="False" DataKeyNames="idArtigo" DataSourceID="SqlDataSource1" OnRowCommand="GridViewEditar_RowCommand">
            <Columns>
                <asp:BoundField DataField="dataHora" HeaderText="dataHora" SortExpression="dataHora" />
                <asp:BoundField DataField="idArtigo" HeaderText="idArtigo" SortExpression="idArtigo" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
                <asp:BoundField DataField="urlYoutube" HeaderText="urlYoutube" SortExpression="urlYoutube" />
                <asp:CheckBoxField DataField="ativo" HeaderText="ativo" SortExpression="ativo" />
                <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [ARTIGO] WHERE [idArtigo] = @idArtigo" InsertCommand="INSERT INTO [ARTIGO] ([dataHora], [autor], [titulo], [tema], [urlYoutube], [ativo], [descricao]) VALUES (@dataHora, @autor, @titulo, @tema, @urlYoutube, @ativo, @descricao)" SelectCommand="SELECT [dataHora], [idArtigo], [autor], [titulo], [tema], [urlYoutube], [ativo], [descricao] FROM [ARTIGO] WHERE ([subTema] LIKE '%' + @subTema + '%')" UpdateCommand="UPDATE [ARTIGO] SET [dataHora] = @dataHora, [autor] = @autor, [titulo] = @titulo, [tema] = @tema, [urlYoutube] = @urlYoutube, [ativo] = @ativo, [descricao] = @descricao WHERE [idArtigo] = @idArtigo">
            <DeleteParameters>
                <asp:Parameter Name="idArtigo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="dataHora" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="titulo" Type="String" />
                <asp:Parameter Name="tema" Type="String" />
                <asp:Parameter Name="urlYoutube" Type="String" />
                <asp:Parameter Name="ativo" Type="Boolean" />
                <asp:Parameter Name="descricao" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="Video" Name="subTema" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="dataHora" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="titulo" Type="String" />
                <asp:Parameter Name="tema" Type="String" />
                <asp:Parameter Name="urlYoutube" Type="String" />
                <asp:Parameter Name="ativo" Type="Boolean" />
                <asp:Parameter Name="descricao" Type="String" />
                <asp:Parameter Name="idArtigo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="AdicionarNovoVideo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EditarVideos" runat="server">
</asp:Content>
