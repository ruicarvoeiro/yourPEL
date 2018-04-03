<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="addDocumentos.aspx.cs" Inherits="AdminYourPEL.addDocumentos" %>

<asp:Content ID="Content17" ContentPlaceHolderID="Documentos" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation" class="active"><a href="addDocumentos.aspx">Adicionar Documentos</a></li>
    </ul>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="AddPost" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div id="edicaoDocs" class="row">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />

                <asp:Label runat="server" ID="lblFeedback" ForeColor="Red"></asp:Label>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Nome do documento:</label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtNomeDocumento" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Breve descrição:</label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtDescricaoDocumento" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Tema:</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:DropDownList ID="listTemaDocumento" CssClass="form-control" runat="server">
                                <asp:ListItem Value="ALIMENTACAO">Alimentação</asp:ListItem>
                                <asp:ListItem Value="CONSUMOS">Consumos Nocivos</asp:ListItem>
                                <asp:ListItem Value="SEXUALIDADE">Sexualidade</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                          <div class="col-md-5">
                            <div class="form-group">
                                <asp:Button runat="server" ID="btnAddDocumento" OnClick="Page_Load" Text="Adicionar" class="btn btn-block btn-danger" />
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <asp:Button ID="cancelar" runat="server" class="btn btn-block btn-danger" Text="Cancelar" OnClick="cancelar_Click" />
                            </div>
                        </div>


                    </div>

            </div>
        </div>
    </form>
</asp:Content>
