using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YourPEL.admin;

namespace AdminYourPEL
{
    public partial class EditarUtilizador : System.Web.UI.Page
    {
        string cenas;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            cenas = LoginPagina.Username;
        }

        private string ReturnPassword()
        {

            string pass = "";
            con.Open();
            string query = "SELECT PASSWORD FROM UTILIZADOR WHERE USERNAME = '" + cenas + "';";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                pass = sdr["PASSWORD"].ToString();
            }
            con.Close();

            return pass;
        }

        protected void submeter_Click(object sender, EventArgs e)
        {
            string passAntiga = ReturnPassword();
            if (passAntiga == txtPasswordA.Text)
            {
                if (txtPasswordA.Text != PasswordNova1.Text)
                {
                    if (PasswordNova1.Text == PasswordNova2.Text)
                    {
                        con.Open();
                        SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        string query = cmd.CommandText = "UPDATE UTILIZADOR SET PASSWORD='" + PasswordNova1.Text + "' WHERE USERNAME='" + cenas + "'";
                        cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        SqlDataReader sdr = cmd.ExecuteReader();
                        con.Close();
                        avisos.Text = "Password alterada com êxito!";
                        Response.Redirect("~/EditarUtilizador.aspx");
                    }
                    avisos.Text = "Confirmação de password errada!";
                }
                avisos.Text = "Password antiga igual á atual!";
            }
            avisos.Text = "Password antiga errada!";
        }
    }
}