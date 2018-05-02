<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="AdicionarEvento.aspx.cs" Inherits="AdminYourPEL.AdicionarEvento" %>
<asp:Content ID="Content9" ContentPlaceHolderID="Eventos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation" class="active"><a href="AdicionarEvento.aspx">Adicionar Evento</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="AdicionarEvento" runat="server">
        <form id="form1" runat="server">
         <div class="container">
             
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Nome: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="nome" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Local: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="local" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Descrição: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="descricao" CssClass="form-control" MaxLength="99" runat="server"></asp:TextBox>
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
                        <label>Hora de Início: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="horaInicio" TextMode="DateTime" CssClass="form-control" runat="server" placeholder="yyyy-MM-dd HH:mm" ></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Hora de Fim: </label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="horaFim" TextMode="DateTime" CssClass="form-control" runat="server" placeholder="yyyy-MM-dd HH:mm"></asp:TextBox>
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
                        <asp:Button ID="criar" runat="server" class="btn btn-block btn-danger" Text="Criar"  OnClick="criar_Click"/>
                    </div>
                </div>
                <div class="col-md-5">
                     <div class="form-group">
                        <asp:Button ID="cancelar" runat="server" class="btn btn-block btn-danger" Text="Cancelar" OnClick="cancelar_Click" />
                    </div>
                </div>
            </div>
            
        </div>
            <script src="Scripts/jquery-3.3.1.min.js"></script>

    </form>
</asp:Content>
