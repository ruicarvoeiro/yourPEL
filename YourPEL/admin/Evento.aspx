<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="AdminYourPEL.Evento" %>
<asp:Content ID="Content9" ContentPlaceHolderID="Eventos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="AdicionarEvento.aspx">Adicionar Evento</a></li>
    </ul>
    <br />
    <br />
    <h2>Lista de Eventos</h2>
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idEvento" DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="idEvento" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idEvento" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="local" HeaderText="local" SortExpression="local" />
                    <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
                    <asp:BoundField DataField="dataHora_Inicial" HeaderText="dataHora_Inicial" SortExpression="dataHora_Inicial" />
                    <asp:BoundField DataField="dataHora_Final" HeaderText="dataHora_Final" SortExpression="dataHora_Final" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [EVENTO] WHERE [idEvento] = @idEvento" InsertCommand="INSERT INTO [EVENTO] ([nome], [local], [descricao], [dataHora_Inicial], [url], [dataHora_Final]) VALUES (@nome, @local, @descricao, @dataHora_Inicial, @url, @dataHora_Final)" SelectCommand="SELECT [idEvento], [nome], [local], [descricao], [dataHora_Inicial], [url], [dataHora_Final] FROM [EVENTO]" UpdateCommand="UPDATE [EVENTO] SET [nome] = @nome, [local] = @local, [descricao] = @descricao, [dataHora_Inicial] = @dataHora_Inicial, [url] = @url, [dataHora_Final] = @dataHora_Final WHERE [idEvento] = @idEvento">
                <DeleteParameters>
                    <asp:Parameter Name="idEvento" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="local" Type="String" />
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="dataHora_Inicial" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="dataHora_Final" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="local" Type="String" />
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="dataHora_Inicial" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="dataHora_Final" />
                    <asp:Parameter Name="idEvento" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <div class="col-md-1">
                    <div class="form-group">
                    </div>
                </div>
            <div class="col-md-10">
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="AdicionarEvento" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="EditarEvento" runat="server">
</asp:Content>

