<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="addPost.aspx.cs" Inherits="AdminYourPEL.addPost" %>
<asp:Content ID="Content17" ContentPlaceHolderID="Forum" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation" class="active"><a href="addPost.aspx">Novo Post</a></li>
    </ul>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content16" ContentPlaceHolderID="AddPost" runat="server">
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Titulo: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="tbTitulo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Texto: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="tbTexto" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Tema</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:DropDownList ID="ddTema" CssClass="form-control" runat="server">
                            <asp:ListItem Selected="True" Value="Alimentação">Alimentação</asp:ListItem>
                            <asp:ListItem Value="Consumos Nocivos">Consumos Nocivos</asp:ListItem>
                            <asp:ListItem Value="Sexualidade">Sexualidade</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:Button ID="Button1" runat="server" class="btn btn-block btn-danger" Text="Adicionar" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
