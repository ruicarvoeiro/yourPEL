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
    public partial class LoginPagina : System.Web.UI.Page
    {
        static string username;
        string pass;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());

        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = null;
            username = txtUsername.Text;
            pass = txtPassword.Text;
        }
        public static string Username
        {
            get { return username; }
            set { username = value; }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            try
            {
                
                con.Open();
                string qry = "SELECT count(*) FROM UTILIZADOR WHERE USERNAME='" + username + "' and PASSWORD='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                string output = cmd.ExecuteScalar().ToString();
                
                if (output=="1")
                {
                    
                    if (Session["user"] == null)
                    {
                        //Session.Add("user", txtUsername.Text);
                        Session["user"] = username;
                        con.Close();
                        int idutilizador = ReturnIdUtilizador(username, pass);
                        Response.Redirect("~/admin/PaginaPrincipal.aspx?ID_UTILIZADOR=" + idutilizador);
                        
                    }
                }
                else
                {
                    lblAviso.Text = "Utilizador ou Password errados. <br />Tente novamente com dados corretos!";

                }
                con.Close();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private int ReturnIdUtilizador(string user, string password)
        {
            int idUser = 0;
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string query = cmd.CommandText = "SELECT ID_UTILIZADOR FROM UTILIZADOR WHERE USERNAME='" + user + "' and PASSWORD='" + password + "'";
            //SqlCommand cmdid = new SqlCommand(query, con);
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            idUser = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            

            return idUser;
        }
    }
}