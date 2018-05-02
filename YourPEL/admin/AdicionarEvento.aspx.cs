using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YourPEL.admin;

namespace AdminYourPEL
{
    public partial class AdicionarEvento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void criar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString()))
            {
                try
                {
                    con.Open();

                    if (con != null)
                    {
                        
                        if (imagem.HasFile)
                        {

                            int idEventoAInserir = inserirEvento(
                                nome.Text, local.Text, descricao.Text, ".", horaInicio.Text, horaFim.Text); 

                            EVENTO novoEvento = new EVENTO();

                            novoEvento.idEvento = idEventoAInserir;
                            novoEvento.nome = nome.Text;


                            string path = Server.MapPath(".") + "\\Imagens\\" + "id" + novoEvento.idEvento + "_" + novoEvento.nome + Path.GetExtension(imagem.FileName).ToLower();
                            imagem.SaveAs(path);
                            novoEvento.url = "admin//Imagens//" + "id" + novoEvento.idEvento + "_" + novoEvento.nome + Path.GetExtension(imagem.FileName).ToLower();
              
                            UpdateEventoUrl(novoEvento.idEvento, novoEvento.url); 


                            Response.Redirect("~/admin/Evento.aspx", false);
                        }

                    }
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                }

            }
        }
        public static void UpdateEventoUrl(int id, string novoUrl)
        {
            string sql = "Update EVENTO Set url = '" + novoUrl + "' Where idEvento = '" + id + "';";

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }

        private int inserirEvento(string nome, string local, string descricao, string url, string hI, string hF)
        {
            int idDoEvento = 0;
            var format = "yyyy-MM-dd HH:mm";
            DateTime horaInicio = new DateTime();
            horaInicio = DateTime.ParseExact(hI, format, null);

            DateTime horaFim = new DateTime();
            horaFim = DateTime.ParseExact(hF, format, null);

            string query = "INSERT INTO EVENTO values('" +
                            nome + "','" +
                            local + "','" +
                            descricao + "','" +
                            horaInicio + "','" +
                            horaFim + "','" +
                            url + "'); SELECT SCOPE_IDENTITY();"; 

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    idDoEvento = Convert.ToInt32(command.ExecuteScalar().ToString());

                }
            }
            return idDoEvento;
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Evento.aspx", false);
        }
    }
}