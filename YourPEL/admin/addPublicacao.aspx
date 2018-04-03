<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/admin/Administracao.Master" validateRequest="false" AutoEventWireup="true" CodeBehind="addPublicacao.aspx.cs" Inherits="AdminYourPEL.addPublicacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Publicações" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation" class="active"><a href="addPublicacao.aspx">Adicionar Publicação</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="addPublicacao" runat="server">

    <form id="form1" runat="server">
        <div>
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
                            <label>Conteúdo: </label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <asp:TextBox ID="conteudoo" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
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
                        <asp:Button ID="criarPub" runat="server" class="btn btn-block btn-danger" OnClick="Button1_Click" Text="Criar" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                         <asp:Button ID="Button1" runat="server" class="btn btn-block btn-danger" OnClick="cancelar_Click" Text="Cancelar" />
                    </div>
                </div>
            </div>
            <div>
                <asp:Label ID="lbPubErro" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('<%=conteudoo.ClientID %>', { filebrowserImageUploadUrl: '/Handlers/UploadImagens.ashx' });
    </script>
</asp:Content>

