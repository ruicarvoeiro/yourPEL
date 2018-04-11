using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourPEL.admin
{
    public partial class Administracao : System.Web.UI.MasterPage
    {
        int idUtilizador;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/admin/LoginPagina.aspx");
            }
            else
            {
                Sessao();
                Configuracao();
                
            }
        }

        private void Configuracao()
        {
            idUtilizador = ReturnIdUtilizador();
            con.Open();
            string qry = "SELECT [TIPO] FROM [YourPEL].[dbo].[UTILIZADOR] WHERE ID_UTILIZADOR ='" + idUtilizador + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                string tipoUser = sdr["TIPO"].ToString();
                if (tipoUser.Equals("A", StringComparison.Ordinal))
                {
                    MenuUtilizadores.Visible = true;
                }
                else if (tipoUser.Equals("M", StringComparison.Ordinal))
                {
                    MenuUtilizadores.Visible = false;
                }
                else
                {
                    Response.Redirect("~/admin/LoginPagina.aspx");
                }
            }
            con.Close();
        }

        private void Sessao()
        {
            int id = ReturnIdUtilizador();
            con.Open();
            String query = "SELECT USERNAME FROM UTILIZADOR WHERE ID_UTILIZADOR = " + id;
            SqlCommand cmdd = new SqlCommand(query, con);
            SqlDataReader sdrr = cmdd.ExecuteReader();
            Session["user"] = sdrr.Read();
            con.Close();
        }

        private int ReturnIdUtilizador()
        {
            String cenas = LoginPagina.Username;
            int idUser;
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string query = cmd.CommandText = "SELECT ID_UTILIZADOR FROM UTILIZADOR WHERE USERNAME ='" + cenas + "'";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            idUser = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();


            return idUser;
        }
    }
}