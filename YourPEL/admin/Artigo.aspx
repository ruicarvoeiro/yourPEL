<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Artigo.aspx.cs" Inherits="AdminYourPEL.Artigo" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentCorpo" ContentPlaceHolderID="Artigos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="AdicionarNovoArtigo.aspx">Criar Artigo</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Artigos</h2>
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="container">
            <h4>Artigos Alimentação</h4>
            <asp:GridView ID="GridView1" runat="server" 
                CssClass="table table-hover table-striped" GridLines="None"
                AutoGenerateColumns="False" DataKeyNames="idArtigo" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="idArtigo" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idArtigo" />
                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                    <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
                    <asp:BoundField DataField="subTema" HeaderText="subTema" SortExpression="subTema" />
                    <asp:BoundField DataField="ordemRelevancia" HeaderText="ordemRelevancia" SortExpression="ordemRelevancia" />
                    <asp:CheckBoxField DataField="ativo" HeaderText="ativo" SortExpression="ativo" />
                    <asp:BoundField DataField="dataHora" HeaderText="dataHora" SortExpression="dataHora" />
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="False"/>
                       <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Editar" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [ARTIGO] WHERE [idArtigo] = @idArtigo" InsertCommand="INSERT INTO [ARTIGO] ([titulo], [tema], [subTema], [ordemRelevancia], [ativo], [dataHora]) VALUES (@titulo, @tema, @subTema, @ordemRelevancia, @ativo, @dataHora)" SelectCommand="SELECT [idArtigo], [titulo], [tema], [subTema], [ordemRelevancia], [ativo], [dataHora] FROM [ARTIGO] WHERE ([tema] LIKE '%' + @tema + '%')" UpdateCommand="UPDATE [ARTIGO] SET [titulo] = @titulo, [tema] = @tema, [subTema] = @subTema, [ordemRelevancia] = @ordemRelevancia, [ativo] = @ativo, [dataHora] = @dataHora WHERE [idArtigo] = @idArtigo">
                <DeleteParameters>
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="tema" Type="String" />
                    <asp:Parameter Name="subTema" Type="String" />
                    <asp:Parameter Name="ordemRelevancia" Type="Int32" />
                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="Alimentação" Name="tema" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="tema" Type="String" />
                    <asp:Parameter Name="subTema" Type="String" />
                    <asp:Parameter Name="ordemRelevancia" Type="Int32" />
                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <h4>Artigos Sexualidade</h4>
            <asp:GridView ID="GridView2" runat="server" 
                CssClass="table table-hover table-striped" GridLines="None"
                AutoGenerateColumns="False" DataKeyNames="idArtigo" DataSourceID="SqlDataSource2" OnRowCommand="GridView2_RowCommand">
                <Columns>
                    <asp:BoundField DataField="idArtigo" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idArtigo" />
                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                    <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
                    <asp:BoundField DataField="subTema" HeaderText="subTema" SortExpression="subTema" />
                    <asp:BoundField DataField="ordemRelevancia" HeaderText="ordemRelevancia" SortExpression="ordemRelevancia" />
                    <asp:CheckBoxField DataField="ativo" HeaderText="ativo" SortExpression="ativo" />
                    <asp:BoundField DataField="dataHora" HeaderText="dataHora" SortExpression="dataHora" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="false" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Editar" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [ARTIGO] WHERE [idArtigo] = @idArtigo" InsertCommand="INSERT INTO [ARTIGO] ([titulo], [tema], [subTema], [ordemRelevancia], [ativo], [dataHora]) VALUES (@titulo, @tema, @subTema, @ordemRelevancia, @ativo, @dataHora)" SelectCommand="SELECT [idArtigo], [titulo], [tema], [subTema], [ordemRelevancia], [ativo], [dataHora] FROM [ARTIGO] WHERE ([tema] LIKE '%' + @tema + '%')" UpdateCommand="UPDATE [ARTIGO] SET [titulo] = @titulo, [tema] = @tema, [subTema] = @subTema, [ordemRelevancia] = @ordemRelevancia, [ativo] = @ativo, [dataHora] = @dataHora WHERE [idArtigo] = @idArtigo">
                    <DeleteParameters>
                        <asp:Parameter Name="idArtigo" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="titulo" Type="String" />
                        <asp:Parameter Name="tema" Type="String" />
                        <asp:Parameter Name="subTema" Type="String" />
                        <asp:Parameter Name="ordemRelevancia" Type="Int32" />
                        <asp:Parameter Name="ativo" Type="Boolean" />
                        <asp:Parameter DbType="Date" Name="dataHora" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView2" DefaultValue="Sexualidade" Name="tema" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="titulo" Type="String" />
                        <asp:Parameter Name="tema" Type="String" />
                        <asp:Parameter Name="subTema" Type="String" />
                        <asp:Parameter Name="ordemRelevancia" Type="Int32" />
                        <asp:Parameter Name="ativo" Type="Boolean" />
                        <asp:Parameter DbType="Date" Name="dataHora" />
                        <asp:Parameter Name="idArtigo" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            <br />
            <h4>Artigos Consumos Nocivos</h4>
            <asp:GridView ID="GridView3" runat="server" 
                CssClass="table table-hover table-striped" GridLines="None"
                AutoGenerateColumns="False" DataKeyNames="idArtigo" DataSourceID="SqlDataSource3" OnRowCommand="GridView3_RowCommand">
                <Columns>
                    <asp:BoundField DataField="idArtigo" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idArtigo" />
                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                    <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
                    <asp:BoundField DataField="subTema" HeaderText="subTema" SortExpression="subTema" />
                    <asp:BoundField DataField="ordemRelevancia" HeaderText="ordemRelevancia" SortExpression="ordemRelevancia" />
                    <asp:CheckBoxField DataField="ativo" HeaderText="ativo" SortExpression="ativo" />
                    <asp:BoundField DataField="dataHora" HeaderText="dataHora" SortExpression="dataHora" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="false" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Editar" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [ARTIGO] WHERE [idArtigo] = @idArtigo" InsertCommand="INSERT INTO [ARTIGO] ([titulo], [tema], [subTema], [ordemRelevancia], [ativo], [dataHora]) VALUES (@titulo, @tema, @subTema, @ordemRelevancia, @ativo, @dataHora)" SelectCommand="SELECT [idArtigo], [titulo], [tema], [subTema], [ordemRelevancia], [ativo], [dataHora] FROM [ARTIGO] WHERE ([tema] LIKE '%' + @tema + '%')" UpdateCommand="UPDATE [ARTIGO] SET [titulo] = @titulo, [tema] = @tema, [subTema] = @subTema, [ordemRelevancia] = @ordemRelevancia, [ativo] = @ativo, [dataHora] = @dataHora WHERE [idArtigo] = @idArtigo">
                <DeleteParameters>
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="tema" Type="String" />
                    <asp:Parameter Name="subTema" Type="String" />
                    <asp:Parameter Name="ordemRelevancia" Type="Int32" />
                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView3" DefaultValue="Consumos Nocivos" Name="tema" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="tema" Type="String" />
                    <asp:Parameter Name="subTema" Type="String" />
                    <asp:Parameter Name="ordemRelevancia" Type="Int32" />
                    <asp:Parameter Name="ativo" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="dataHora" />
                    <asp:Parameter Name="idArtigo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
<asp:Content ID="AdicionarNovoArtigo" ContentPlaceHolderID="AdicionarNovoArtigo" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="EditarArtigos" runat="server">
</asp:Content>




