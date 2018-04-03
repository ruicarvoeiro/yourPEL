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
    public partial class addPublicacao : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (titulo.Text == "" || conteudoo.Text == "")
            {
                lbPubErro.Text = "Preencha todos os dados da publicação!";
            }
            else
            {
                String texto = titulo.Text.ToString();

                SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
                db.Open();
                SqlCommand cmd = db.CreateCommand();
                cmd.CommandType = CommandType.Text;
                string encodedText = Server.HtmlEncode(conteudoo.Text);
                cmd.CommandText = "Insert Into PUBLICACAO" +
                   $"(titulo, conteudo) " +
                   $"Values ('{texto}', '{conteudoo.Text}');" +
                   $"SELECT SCOPE_IDENTITY();";
                cmd.ExecuteNonQuery();
                db.Close();


                Response.Redirect("~/admin/Publicações.aspx", false);
            }


        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Publicações.aspx", false);
        }
    }
}