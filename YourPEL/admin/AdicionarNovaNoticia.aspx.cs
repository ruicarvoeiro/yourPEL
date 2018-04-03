using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class AdicionarNovaNoticia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submeter_Click(object sender, EventArgs e)
        {

            var format = "yyyy-MM-dd";
            var strDate = DateTime.Now.ToString(format);
            string url = "";
            if (imagem.HasFile)
            {
                
                string path = Server.MapPath(".") + "\\Imagens\\" + strDate + "_" + titulo.Text + Path.GetExtension(imagem.FileName).ToLower();
                imagem.SaveAs(path);
                url = "~\\Imagens\\" + strDate + "_" + titulo.Text + Path.GetExtension(imagem.FileName).ToLower();
            }

            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string encodedText = Server.HtmlEncode(txtCkEditor.Text);
            cmd.CommandText = "INSERT INTO ARTIGO VALUES('" + strDate + "','" + autor.Text + "','" + titulo.Text + "','" + txtCkEditor.Text + "','" + 1 + "','" + tema.Text + "','" + "" + "','" + descricao.Text + "','" + "" + "','" + true + "','" + url + "')";
            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect("~/admin/Noticia.aspx");

        }

        protected void sair_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Noticia.aspx");
        }
    }
}