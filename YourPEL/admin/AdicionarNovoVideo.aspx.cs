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
    public partial class AdicionarNovoVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submeter_Click(object sender, EventArgs e)
        {

            var format = "yyyy-MM-dd";
            var strDate = DateTime.Now.ToString(format);

            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO ARTIGO VALUES('" + strDate + "','" + autor.Text + "','" + titulo.Text + "','" + txtVideoDesc.Text + "','" + 1 + "','" + tema.Text + "','" + "" + "','" + "" + "','" + urlYoutube.Text + "','" + false + "','" + "" + "')";
            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect("~/admin/Videos.aspx");
        }
    }
}