<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="AdicionarNovoArtigo.aspx.cs" Inherits="AdminYourPEL.AdicionarNovoArtigo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BemVindoPH" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Artigos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation" class="active"><a href="AdicionarNovoArtigo.aspx">Criar Artigo</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AdicionarNovoArtigo" runat="server">
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="LabelTitulo" Font-Bold="true" runat="server" Text="Título"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="titulo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="Label1" Font-Bold="true" runat="server" Text="Autor"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="autor" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <asp:DropDownList ID="ddtema" CssClass="form-control" runat="server">
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
                        <label>SubTema</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:DropDownList OnSelectedIndexChanged="ddsubTema_SelectedIndexChanged" AutoPostBack="True"  ID="ddsubTema" CssClass="form-control" runat="server">
                            <asp:ListItem Value="Artigo">Artigos</asp:ListItem>
                            <asp:ListItem Value="SabiasQue">Sabias Que?</asp:ListItem>
                            <asp:ListItem Value="Links">Links Úteis</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="Label2" Font-Bold="true" runat="server" Text="Descrição"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="descricao" CssClass="form-control" MaxLength="99" runat="server"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                       <asp:Label ID="LabelImagens" Font-Bold="true" runat="server" Text="Imagem"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:FileUpload ID="imagem" CssClass="form-control" runat="server"></asp:FileUpload>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="LabelTexto" Font-Bold="true" runat="server" Text="Texto"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                       <asp:TextBox ID="txtCkEditor" TextMode="MultiLine" runat="server"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="submeter" runat="server" class="btn btn-block btn-danger" Text="Publicar" OnClick="submeter_Click" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="sair" runat="server" class="btn btn-block btn-danger" Text="Sair" OnClick="sair_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script "text/javascript" src="Scripts/ckeditor/ckeditor.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('<%=txtCkEditor.ClientID %>', { filebrowserImageUploadUrl: 'handlers/UploadImagens.ashx' });
    </script>

</asp:Content>