<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Publicações.aspx.cs" Inherits="AdminYourPEL.Publicações" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Publicações" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation"><a href="addPublicacao.aspx">Criar Publicações</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Publicações</h2>
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idPUBLICACAO" DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped" GridLines="None" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="idPUBLICACAO" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idPUBLICACAO" />
                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="False" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Editar" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [PUBLICACAO] WHERE [idPUBLICACAO] = @idPUBLICACAO" InsertCommand="INSERT INTO [PUBLICACAO] ([titulo], [conteudo]) VALUES (@titulo, @conteudo)" SelectCommand="SELECT [idPUBLICACAO], [titulo], [conteudo] FROM [PUBLICACAO]" UpdateCommand="UPDATE [PUBLICACAO] SET [titulo] = @titulo, [conteudo] = @conteudo WHERE [idPUBLICACAO] = @idPUBLICACAO">
                <DeleteParameters>
                    <asp:Parameter Name="idPUBLICACAO" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="idPUBLICACAO" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
