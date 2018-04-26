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
            cena.Visible = false;
            autor.Visible = false;
            autor.Text = "sem_autor";

        }

        protected void submeter_Click(object sender, EventArgs e)
        {

            var format = "yyyy-MM-dd";
            var strDate = DateTime.Now.ToString(format);
            String tema = ddtema.SelectedItem.Text.ToString();

            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            autor.Text = "sem_autor";
            cmd.CommandText = "INSERT INTO ARTIGO VALUES('" + strDate + "','" + autor.Text + "','" + titulo.Text + "','" + "" + "','" + 1 + "','" + tema + "','" + "Videos" + "','" + txtVideoDesc.Text + "','" + urlYoutube.Text + "','" + false + "','" + "" + "')";
            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect("~/admin/Videos.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Videos.aspx");
        }
    }
}