<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="EditarPublicacao.aspx.cs" Inherits="AdminYourPEL.EditarPublicacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content19" ContentPlaceHolderID="EditarPublicacao" runat="server">
    <br />
    <br />
    <br />
    <form runat="server">
        <div class="container">
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
                        <asp:Button ID="sair" runat="server" class="btn btn-block btn-danger" Text="Cancelar" OnClick="sair_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="Scripts/ckeditor/ckeditor.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('<%=conteudoo.ClientID %>', { filebrowserImageUploadUrl: '/handlers/UploadImagens.ashx' });
    </script>
</asp:Content>
