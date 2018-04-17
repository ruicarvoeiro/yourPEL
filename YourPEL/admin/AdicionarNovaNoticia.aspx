<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="AdicionarNovaNoticia.aspx.cs" Inherits="AdminYourPEL.AdicionarNovaNoticia" %>

<asp:Content ID="Content5" ContentPlaceHolderID="Noticia" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation" class="active"><a href="AdicionarNovaNoticia.aspx">Criar Notícia</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="AdicionarNovaNoticia" runat="server">
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
                        <asp:TextBox ID="titulo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Autor</label>
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
                        <asp:TextBox ID="tema" CssClass="form-control" runat="server" Text="Notícias" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Descrição</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox MaxLength="99" ID="descricao" CssClass="form-control" runat="server"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Imagem: </label>
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
                        <label>Texto</label>
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
                        <asp:Button ID="submeter" runat="server" class="btn btn-block btn-danger" Text="Publicar" OnClick="submeter_Click"/>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="sair" runat="server" class="btn btn-block btn-danger" Text="Cancelar" OnClick="sair_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('<%=txtCkEditor.ClientID %>', { filebrowserImageUploadUrl: '/handlers/UploadImagens.ashx' });
    </script>
</asp:Content>
