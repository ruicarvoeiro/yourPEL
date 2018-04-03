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
        <div class="container">
            <asp:GridView ID="gvVids" runat="server"
                CssClass="table table-hover table-striped" GridLines="None"
                DataSourceID="sdsVideos" AutoGenerateColumns="False" DataKeyNames="idArtigo" OnRowCommand="GridViewEditar_RowCommand">
                <Columns>

                    <asp:BoundField DataField="idArtigo" HeaderText="idArtigo" InsertVisible="False" ReadOnly="True" SortExpression="idArtigo" />
                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                    <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" />
                    <asp:BoundField DataField="urlYoutube" HeaderText="urlYoutube" SortExpression="urlYoutube" />
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
            <asp:SqlDataSource ID="sdsVideos" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT [idArtigo], [titulo], [texto], [urlYoutube], [ativo], [dataHora] FROM [ARTIGO] WHERE ([tema] LIKE '%' + @tema + '%')" DeleteCommand="DELETE FROM [ARTIGO] WHERE [idArtigo] = @idArtigo" InsertCommand="INSERT INTO [ARTIGO] ([titulo], [texto], [urlYoutube], [ativo],  [dataHora]) VALUES (@titulo, @texto, @urlYoutube, @ativo, @dataHora)" UpdateCommand="UPDATE [ARTIGO] SET [titulo] = @titulo, [texto] = @texto, [urlYoutube] = @urlYoutube, [ativo] = @ativo, [dataHora] = @dataHora WHERE [idArtigo] = @idArtigo">
                <DeleteParameters>
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="texto" Type="String" />
                    <asp:Parameter Name="urlYoutube" Type="String" />
                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvVids" DefaultValue="Videos" Name="tema" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="texto" Type="String" />
                    <asp:Parameter Name="urlYoutube" Type="String" />
                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter Name="dataHora" DbType="Date" />
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="AdicionarNovoVideo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EditarVideos" runat="server">
</asp:Content>
