<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="EditarEvento.aspx.cs" Inherits="AdminYourPEL.EditarEvento1" %>

<asp:Content ID="Content9" ContentPlaceHolderID="Eventos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="AdicionarEvento.aspx">Adicionar Evento</a></li>
        <li role="presentation" class="active"><a href="EditarEvento.aspx">Editar Evento</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="EditarEvento" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT * FROM [EVENTO]"></asp:SqlDataSource>
            <asp:GridView ID="GridViewEditar" runat="server"
                AutoGenerateColumns="False"
                SelectMethod="GridViewEditar_GetData"
                UpdateMethod="GridViewEditar_UpdateItem"
                DeleteMethod="GridViewEditar_DeleteItem"
                DataKeyNames="idEvento"
                CssClass="table table-hover table-striped" GridLines="None" >
                <Columns>
                    <asp:BoundField DataField="idEvento" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="idEvento" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                    <asp:BoundField DataField="local" HeaderText="Local" SortExpression="local" />
                    <asp:BoundField DataField="descricao" HeaderText="Descrição" SortExpression="descricao" />
                    <asp:BoundField DataField="dataHora_Inicial" HeaderText="Hora de Início" SortExpression="dataHora_Inicial" />
                    <asp:BoundField DataField="dataHora_Final" HeaderText="Hora de Fim" SortExpression="dataHora_Final" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="row">
            <div class="col-md-1">
                    <div class="form-group">
                    </div>
                </div>
            <div class="col-md-10">
                <div class="form-group">
                    <asp:Button ID="Voltar" runat="server" class="btn btn-block btn-danger" Text="Voltar" OnClick="Voltar_Click" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
