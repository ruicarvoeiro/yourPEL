<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Utilizadores.aspx.cs" Inherits="AdminYourPEL.Utilizadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content26" ContentPlaceHolderID="Utilizadores" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="AdicionarNovoUtilizador.aspx">Criar Utilizador</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Utilizadores</h2>
    <br />
    <br />
    <form id="formUtilizadores" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_UTILIZADOR" DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped" GridLines="None">
            <Columns>
                <asp:BoundField DataField="ID_UTILIZADOR" HeaderText="ID_UTILIZADOR" InsertVisible="False" ReadOnly="True" SortExpression="ID_UTILIZADOR" />
                <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [UTILIZADOR] WHERE [ID_UTILIZADOR] = @ID_UTILIZADOR" InsertCommand="INSERT INTO [UTILIZADOR] ([USERNAME], [TIPO]) VALUES (@USERNAME, @TIPO)" SelectCommand="SELECT [ID_UTILIZADOR], [USERNAME], [TIPO] FROM [UTILIZADOR]" UpdateCommand="UPDATE [UTILIZADOR] SET [USERNAME] = @USERNAME, [TIPO] = @TIPO WHERE [ID_UTILIZADOR] = @ID_UTILIZADOR">
            <DeleteParameters>
                <asp:Parameter Name="ID_UTILIZADOR" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="TIPO" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="TIPO" Type="String" />
                <asp:Parameter Name="ID_UTILIZADOR" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
