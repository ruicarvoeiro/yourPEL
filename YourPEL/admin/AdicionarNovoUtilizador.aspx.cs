using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class AdicionarNovoUtilizador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submeter_Click(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO UTILIZADOR VALUES('" + user.Text + "', '" + pass.Text + "', '" + ddtipo.Text + "');";
            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect("~/admin/Utilizadores.aspx");
        }

        protected void sair_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Utilizadores.aspx");
        }
    }
}