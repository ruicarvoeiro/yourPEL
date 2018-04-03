<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="EstatisticaInstagram.aspx.cs" Inherits="AdminYourPEL.EstatisticaInstagram" %>
<asp:Content ID="Content12" ContentPlaceHolderID="Estatistica" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="EstatisticaGoogle.aspx">Estatísticas Google</a></li>
        <li role="presentation" class="active"><a href="EstatisticaInstagram.aspx">Estatísticas Instagram</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content13" ContentPlaceHolderID="EstatisticaInstagram" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server" />

        <div>
            <p>
                <asp:Button ID="btnAuthenticate" runat="server" Text="Gerar Estatísticas" OnClick="btnAuthenticate_Click" />
            </p>

        </div>

        <div class="auto-style3">
            <label id="tituloEstatisticas"></label>
        </div>
        
        <div id="estatisticas" class="auto-style2">
        </div>

        <div class="auto-style3">
            <p>
                <asp:Button runat="server" ID="btnRegressar" Text="Regressar" OnClick="btnRegressar_Click" />
            </p>
        </div>

        <!--<script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>-->
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script type="text/javascript">

            function GetUserData() {
                $.ajax({
                    type: "GET",
                    async: true,
                    contentType: "application/json; charset=utf-8",
                    url: 'https://api.instagram.com/v1/users/' + instagramaccessid + '/media/recent?access_token=' + instagramaccesstoken + '&count=10',
                    dataType: "jsonp",
                    cache: false,

                    success: function (data) {
                        var result = "<br><table border= 1 align = center ><tr><th>Legenda do Post</th><th>Likes</th><th>Comments</th></tr>";

                        for (var i = 0; i < 10; i++) {
                            if(data.data[i] != null){
                                result += "<tr><td>" + data.data[i].caption.text + "</td><td>" + data.data[i].likes.count + "</td><td>" + data.data[i].comments.count + "</td></tr>";
                            }
                        }
                        
                        result+= "</table>"
                        $('#tituloEstatisticas').text("Likes e Comments dos últimos 10 posts");
                        document.getElementById("estatisticas").innerHTML += result;

                    }
                });
            }
        </script>

    </form>
</asp:Content>