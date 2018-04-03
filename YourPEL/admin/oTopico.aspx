<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="oTopico.aspx.cs" Inherits="AdminYourPEL.oTopico" %>

<asp:Content ID="Content16" ContentPlaceHolderID="Forum" runat="server">
</asp:Content>
<asp:Content ID="Content17" ContentPlaceHolderID="AddPost" runat="server">
</asp:Content>
<asp:Content ID="Content18" ContentPlaceHolderID="oTopico" runat="server">
    <form runat="server">
        <br />
        <br />
        <br />
        <div id="mostraResposta" class="form-group" runat="server">
             <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <asp:Button ID="Button2" runat="server" class="btn btn-block btn-danger" Text="Ativar Visibilidade"  OnClick="Button2_Click"/>
                    </div>
                </div>
                <div class="col-md-5">
                     <div class="form-group">
                        <asp:Button ID="Button3" runat="server" class="btn btn-block btn-danger" Text="Desativar Visibilidade" OnClick="Button3_Click" />
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
                        <asp:Button ID="Button4" runat="server" class="btn btn-block btn-danger" Text="Abrir Tópico"  OnClick="Button4_Click"/>
                    </div>
                </div>
                <div class="col-md-5">
                     <div class="form-group">
                        <asp:Button ID="Button5" runat="server" class="btn btn-block btn-danger" Text="Fechar Tópico" OnClick="Button5_Click" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Título</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="TextBox1" CssClass="form-control" TextMode="MultiLine" runat="server"/>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Texto</label>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="MultiLine" runat="server"/>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-striped" DataKeyNames="ID_RESPOSTA" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="TEXTO" HeaderText="TEXTO" SortExpression="TEXTO" />
                    <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT [ID_RESPOSTA], [TEXTO], [DATA_HORA] FROM [RESPOSTA] WHERE ([ID_POST] = @ID_POST)" DeleteCommand="DELETE FROM [RESPOSTA] WHERE [ID_RESPOSTA] = @ID_RESPOSTA">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID_POST" QueryStringField="ID_POST" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <asp:TextBox TextMode="MultiLine" ID="idTbResponder" runat="server" />
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
                        <asp:Button ID="Button1" runat="server" class="btn btn-block btn-danger" Text="Publicar" OnClick="Button1_Click"/>
                    </div>
                </div>
            </div>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('<%=idTbResponder.ClientID %>', { filebrowserImageUploadUrl: '/Handlers/UploadImagens.ashx' });
            </script>
            <br />
        </div>
    </form>
</asp:Content>
