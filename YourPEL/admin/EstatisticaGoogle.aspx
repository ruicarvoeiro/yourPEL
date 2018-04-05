<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="EstatisticaGoogle.aspx.cs" Inherits="AdminYourPEL.EstatisticaGoogle" %>

<asp:Content ID="Content12" ContentPlaceHolderID="Estatistica" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation" class="active"><a href="EstatisticaGoogle.aspx">Estatísticas Google</a></li>
        <li role="presentation"><a href="EstatisticaInstagram.aspx">Estatísticas Instagram</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content14" ContentPlaceHolderID="EstatisticaGoogle" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>Página Estatísticas Google Analytics YourPel</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <meta name="google-signin-client_id" content="955704158269-gsoosttjtp7g77v3pakijp27ejp8cj59.apps.googleusercontent.com"/>
    <meta name="google-signin-scope" content="https://www.googleapis.com/auth/analytics.readonly"/>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            font-size: x-large;
            font-weight: 700;
        }
    </style>
</head>
<body class="auto-style2">

    <script>
        (function (w, d, s, g, js, fs) {
            g = w.gapi || (w.gapi = {}); g.analytics = { q: [], ready: function (f) { this.q.push(f); } };
            js = d.createElement(s); fs = d.getElementsByTagName(s)[0];
            js.src = 'https://apis.google.com/js/platform.js';
            fs.parentNode.insertBefore(js, fs); js.onload = function () { g.load('analytics'); };
        }(window, document, 'script'));
    </script>


    <h1>Estatísticas Google Analytics</h1>

    <form id="form1" runat="server">
        <div class="auto-style3">
           <p> <asp:Button runat="server" ID="btnRegresso" Text="Regressar à Página Inicial de Estatística" PostBackUrl="~/Estatistica.aspx"/> </p>
        </div>

    <!-- Containers para graficos -->
    <div id="embed-api-auth-container"></div>
    <p class="auto-style3">Sessões, utilizadores e novos utilizadores no último mês</p>
    <div id="chart-container"></div>
    <p class="auto-style3">Sessões por utilizador, visitas de páginas e páginas por sessão no último mês</p>
    <div id="chart2-container"></div>
    <p class="auto-style3">Sessões e utilizadores por faixa etária no último mês</p>
    <div id="chart3-container"></div>
    <p class="auto-style3">Sessões e utilizadores por género no último mês</p>
    <div id="chart4-container"></div>
    <p class="auto-style3">Duração média de sessão e bounce rate no último mês</p>
    <div id="chart5-container"></div>
    <p class="auto-style3">Sessões por cidade no último mês</p>
    <div id="chart6-container"></div>
    <div id="view-selector-container"></div>


    <script>

        gapi.analytics.ready(function () {

            /**
             * Authorize the user immediately if the user has already granted access.
             * If no access has been created, render an authorize button inside the
             * element with the ID "embed-api-auth-container".
             */
            gapi.analytics.auth.authorize({
                container: 'embed-api-auth-container',
                clientid: '955704158269-gsoosttjtp7g77v3pakijp27ejp8cj59.apps.googleusercontent.com'
            });


            /**
             * Create a new ViewSelector instance to be rendered inside of an
             * element with the id "view-selector-container".
             */
            var viewSelector = new gapi.analytics.ViewSelector({
                container: 'view-selector-container'
            });

            // Render the view selector to the page.
            viewSelector.execute();


            /**
             * Create a new DataChart instance with the given query parameters
             * and Google chart options. It will be rendered inside an element
             * with the id "chart-container".
             */
            var dataChart = new gapi.analytics.googleCharts.DataChart({
                query: {
                    metrics: 'ga:sessions, ga:users, ga:newUsers',
                    dimensions: 'ga:date',
                    'start-date': '30daysAgo',
                    'end-date': 'yesterday'
                },
                chart: {
                    container: 'chart-container',
                    type: 'LINE',
                    options: {
                        width: '100%',
                        colors: ['blue', 'green', '#52b7ff']
                    }
                }
            });

            var dataChart2 = new gapi.analytics.googleCharts.DataChart({
                query: {
                    metrics: 'ga:sessionsPerUser, ga:pageviews, ga:pageviewsPerSession',
                    dimensions: 'ga:date',
                    'start-date': '30daysAgo',
                    'end-date': 'yesterday'
                },
                chart: {
                    container: 'chart2-container',
                    type: 'LINE',
                    options: {
                        width: '100%',
                        colors: ['blue', 'green', '#52b7ff']
                    }
                }
            });

            var dataChart3 = new gapi.analytics.googleCharts.DataChart({
                query: {
                    metrics: 'ga:sessions, ga:users',
                    dimensions: 'ga:userAgeBracket',
                    'start-date': '30daysAgo',
                    'end-date': 'yesterday'
                },
                chart: {
                    container: 'chart3-container',
                    type: 'LINE',
                    options: {
                        width: '100%',
                        colors: ['blue', 'green', '#52b7ff']
                    }
                }
            });

            var dataChart4 = new gapi.analytics.googleCharts.DataChart({
                query: {
                    metrics: 'ga:sessions, ga:users',
                    dimensions: 'ga:userGender',
                    'start-date': '30daysAgo',
                    'end-date': 'yesterday'
                },
                chart: {
                    container: 'chart4-container',
                    type: 'LINE',
                    options: {
                        width: '100%',
                        colors: ['blue', 'green', '#52b7ff']
                    }
                }
            });

            var dataChart5 = new gapi.analytics.googleCharts.DataChart({
                query: {
                    metrics: 'ga:avgSessionDuration, ga:bounceRate',
                    dimensions: 'ga:date',
                    'start-date': '30daysAgo',
                    'end-date': 'yesterday'
                },
                chart: {
                    container: 'chart5-container',
                    type: 'LINE',
                    options: {
                        width: '100%',
                        colors: ['blue', 'green', '#52b7ff']
                    }
                }
            });

            var dataChart6 = new gapi.analytics.googleCharts.DataChart({
                query: {
                    metrics: 'ga:sessions',
                    dimensions: 'ga:city',
                    'start-date': '30daysAgo',
                    'end-date': 'yesterday'
                },
                chart: {
                    container: 'chart6-container',
                    type: 'GEO',
                    options: {
                        region: 'PT',
                        width: '100%',
                        height: '100%'
                    }
                }
            });


            /**
             * Render the dataChart on the page whenever a new view is selected.
             */
            viewSelector.on('change', function (ids) {
                dataChart.set({ query: { ids: ids } }).execute();
                dataChart2.set({ query: { ids: ids } }).execute();
                dataChart3.set({ query: { ids: ids } }).execute();
                dataChart4.set({ query: { ids: ids } }).execute();
                dataChart5.set({ query: { ids: ids } }).execute();
                dataChart6.set({ query: { ids: ids } }).execute();
            });

        });
    </script>


        <div class="auto-style3">
           <p> <asp:Button runat="server" ID="btnTopo" Text="Regressar ao Topo" PostBackUrl="#top"/> </p>
        </div>
    </form>
</body>
</html>
</asp:Content>
