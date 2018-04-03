<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Documentos.aspx.cs" Inherits="AdminYourPEL.Documentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Documentos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation"><a href="addDocumentos.aspx">Adicionar Documentos</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Documentos</h2>
    <br />
    <br />
    <form id="form1" runat="server">
            <div id="listaDocs" class="row">
               <asp:Label ID="lblFeedback2" runat="server" ForeColor="Red"></asp:Label>   
                <asp:GridView ID="Docs" runat="server" AutoGenerateColumns="False" DataKeyNames="idDocumento" DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped" GridLines="None">
                    <Columns>
                        
                        <asp:BoundField DataField="idDocumento" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idDocumento" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
                        <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [DOCUMENTO] WHERE [idDocumento] = @idDocumento" InsertCommand="INSERT INTO [DOCUMENTO] ([nome], [descricao], [tema]) VALUES (@nome, @descricao, @tema)" SelectCommand="SELECT [idDocumento], [nome], [descricao], [tema] FROM [DOCUMENTO]" UpdateCommand="UPDATE [DOCUMENTO] SET [nome] = @nome, [descricao] = @descricao, [tema] = @tema WHERE [idDocumento] = @idDocumento">
                    <DeleteParameters>
                        <asp:Parameter Name="idDocumento" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="descricao" Type="String" />
                        <asp:Parameter Name="tema" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="descricao" Type="String" />
                        <asp:Parameter Name="tema" Type="String" />
                        <asp:Parameter Name="idDocumento" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
    </form>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
</asp:Content>
