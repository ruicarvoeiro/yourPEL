using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class Estatistica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int visitas = 0;
            int visitasUnicas = 0;
            int topicosAtivos = 0;
            int topicosFechados = 0;
            int respostas = 0;
            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();

                string sql = "Select COUNT(*) From VISITAS";

                SqlCommand command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        visitas = reader.GetInt32(0);
                    }
                }

                lbVisitas.Text = "Visitas totais: " + visitas;

                sql = "Select COUNT(DISTINCT idCookie) From VISITAS";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        visitasUnicas = reader.GetInt32(0);
                    }
                }

                lbVisitasUnicas.Text = "Número de visitantes: " + visitasUnicas;

                sql = "Select COUNT(*) From POST Where ATIVO = 1";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        topicosAtivos = reader.GetInt32(0);
                    }
                }

                lbTopicosAbertos.Text = "Tópicos Abertos: " + topicosAtivos;



                sql = "Select COUNT(*) From POST Where ATIVO = 0";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        topicosFechados = reader.GetInt32(0);
                    }
                }

                lbTopicosFechados.Text = "Tópicos Fechados: " + topicosFechados;



                sql = "Select COUNT(*) From RESPOSTA";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        respostas = reader.GetInt32(0);
                    }
                }

                lbRespostas.Text = "Respostas a tópicos: " + respostas;

            }

        }

        protected void btnCsvClick(object sender, EventArgs e)
        {
            //Comentadas linhas que servem para guardar o ficheiro csv na pasta Dados_Estatistica
            //string path = Server.MapPath(".") + "\\Dados_Estatistica\\dadosCsv_" + DateTime.Now.ToString("yyyyMMdd-HHmmss") + ".csv";
            var sw = new StringWriter();
            sw.WriteLine("Campo;Valores");

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();

                string sql = "Select COUNT(*) From VISITAS";

                SqlCommand command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        sw.WriteLine("Visitas;" + reader.GetInt32(0));
                    }
                }

                sql = "Select COUNT(DISTINCT idCookie) From VISITAS";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        sw.WriteLine("Visitantes;" + reader.GetInt32(0));
                    }
                }

                sql = "Select Top 10 left(data, 10), COUNT(*) From VISITAS Group By left(data, 10) Order By left(data, 10) DESC;";

                command = new SqlCommand(sql, connection);

                List<string> datas = new List<string>();
                List<int> visitas = new List<int>();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        datas.Add(reader.GetString(0));
                        visitas.Add(reader.GetInt32(1));
                    }
                }


                for (int l = 0; l < datas.Count(); l++)
                {
                    string ano = datas[l].Substring(0, 4);
                    string mes = datas[l].Substring(5, 2);
                    string dia = datas[l].Substring(8);

                    datas[l] = dia + "-" + mes + "-" + ano;
                }

                datas.Reverse();
                visitas.Reverse();

                sw.WriteLine("Data;Visitas");

                for (int l = 0; l < datas.Count(); l++)
                {
                    sw.WriteLine(datas[l] + ";" + visitas[l]);
                }

                sw.WriteLine("Dispositivo;Visitas");

                sql = "Select COUNT(*) From VISITAS Group By dispositivo;";

                command = new SqlCommand(sql, connection);
                var dispositivos = new[] { "Computador", "Smartphone", "Tablet" };
                int i = 0;

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        sw.WriteLine(dispositivos[i] + ";" + reader.GetInt32(0));
                        i++;
                    }
                }

                sw.WriteLine("Tema;Visitas");

                sql = "Select COUNT(*) From CLIQUES Where idClique like '2000%' Group By idClique;";

                command = new SqlCommand(sql, connection);
                var temas = new[] { "Alimentação", "Sexualidade", "Consumos Nocivos" };
                i = 0;

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        sw.WriteLine(temas[i] + ";" + reader.GetInt32(0));
                        i++;
                    }
                }

                List<string> artigos = new List<string>();
                List<int> visitasArtigos = new List<int>();
                List<string> nomesArtigos = new List<string>();

                sql = "Select Top 10 idClique, COUNT(*) From CLIQUES Where idClique like '3%' Group By idClique Order By COUNT(*) DESC;";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        artigos.Add(reader.GetString(0));
                        visitasArtigos.Add(reader.GetInt32(1));
                    }
                }



                for (i = 0; i < artigos.Count(); i++)
                {

                    if (artigos[i].StartsWith("3000")) { artigos[i] = artigos[i].Substring(4); }
                    else if (artigos[i].StartsWith("300")) { artigos[i] = artigos[i].Substring(3); }
                    else if (artigos[i].StartsWith("30")) { artigos[i] = artigos[i].Substring(2); }
                    else { artigos[i] = artigos[i].Substring(1); }

                }

                for (i = 0; i < artigos.Count(); i++)
                {
                    sql = "Select  titulo From ARTIGO Where idArtigo ='" + artigos[i] + "';";

                    command = new SqlCommand(sql, connection);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            nomesArtigos.Add(reader.GetString(0));
                        }
                    }

                }

                sw.WriteLine("Artigo;Visitas");

                for (i = 0; i < artigos.Count(); i++)
                {
                    sw.WriteLine(nomesArtigos[i] + ";" + visitasArtigos[i]);
                }

                sql = "Select COUNT(*) From POST Where ATIVO = 1";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        sw.WriteLine("Tópicos abertos;" + reader.GetInt32(0));
                    }
                }

                sql = "Select COUNT(*) From POST Where ATIVO = 0";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        sw.WriteLine("Tópicos fechados;" + reader.GetInt32(0));
                    }
                }

                sql = "Select COUNT(*) From RESPOSTA";

                command = new SqlCommand(sql, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        sw.WriteLine("Respostas a tópicos;" + reader.GetInt32(0));
                    }
                }

            }

            //File.WriteAllText(path, sw.ToString());
            //lbCsv.Text = "Dados exportados para " + path + " com sucesso!";

            string attachment = "attachment; filename=Dados_Estatistica_" + DateTime.Now.ToString("dd-MM-yyyy_HH-mm-ss") + ".csv";
            //chupa pilas
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Charset = "UTF-8";
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/csv";
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            HttpContext.Current.Response.Write(sw.ToString());
            HttpContext.Current.Response.End();

        }

        public String toUTF8(String str)
        {
            return HttpContext.Current.Server.HtmlDecode(str);
        }
    }
}