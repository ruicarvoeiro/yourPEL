<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Noticia.aspx.cs" Inherits="AdminYourPEL.Noticia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Noticia" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation"><a href="AdicionarNovaNoticia.aspx">Criar Notícia</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Notícias</h2>
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="table table-hover table-striped" GridLines="None"
                AutoGenerateColumns="False" DataKeyNames="idArtigo" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="idArtigo" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idArtigo" />
                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                    <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
                    
                    <asp:CheckBoxField DataField="ativo" HeaderText="ativo" SortExpression="ativo" />
                    <asp:BoundField DataField="dataHora" HeaderText="dataHora" SortExpression="dataHora" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Editar" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [ARTIGO] WHERE [idArtigo] = @idArtigo" InsertCommand="INSERT INTO [ARTIGO] ([titulo], [tema], [ativo], [dataHora]) VALUES (@titulo, @tema, @ativo, @dataHora)" SelectCommand="SELECT [idArtigo], [titulo], [tema], [ativo], [dataHora] FROM [ARTIGO] WHERE ([tema] LIKE '%' + @tema + '%')" UpdateCommand="UPDATE [ARTIGO] SET [titulo] = @titulo, [tema] = @tema, [ativo] = @ativo, [dataHora] = @dataHora WHERE [idArtigo] = @idArtigo">
                <DeleteParameters>
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="tema" Type="String" />

                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="Notícias" Name="tema" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="tema" Type="String" />

                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="AdicionarNovaNoticia" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EditarNoticia" runat="server">
</asp:Content>
