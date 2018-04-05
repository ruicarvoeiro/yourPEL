using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class addPost : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String titulo = tbTitulo.Text.ToString();
            String texto = tbTexto.Text.ToString();
            String tema = ddTema.SelectedItem.Text.ToString();
            var format = "yyyy-MM-dd";
            var strDate = DateTime.Now.ToString(format);

            conn.Open();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO POST VALUES ('" +
                titulo + "','" +
                texto + "','" +
                strDate + "','" +
                tema + "','" +
                "true','" +
                "false')", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/admin/Forum.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Forum.aspx");
        }
    }
}