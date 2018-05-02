<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="EditarArtigos.aspx.cs" Inherits="AdminYourPEL.EditarArtigos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content19" ContentPlaceHolderID="EditarArtigos" runat="server">
    <br />
    <br />
    <br />
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
                        <label>Descrição</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="descricao" CssClass="form-control" TextMode="MultiLine" runat="server"/>
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
        <script type="text/javascript" src="Scripts/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('<%=txtCkEditor.ClientID %>', { filebrowserImageUploadUrl: 'admin/handlers/UploadImagens.ashx' });
    </script>

</asp:Content>
