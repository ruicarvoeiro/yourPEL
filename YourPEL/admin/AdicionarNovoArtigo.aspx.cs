using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class AdicionarNovoArtigo : System.Web.UI.Page
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
                url = "admin//Imagens//" + strDate + "_" + titulo.Text + Path.GetExtension(imagem.FileName).ToLower();
            }
            String cena = ddsubTema.Items[ddsubTema.SelectedIndex].Text;

            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string encodedText = Server.HtmlEncode(txtCkEditor.Text);
            cmd.CommandText = "INSERT INTO ARTIGO VALUES('" + strDate + "','" + autor.Text + "','" + titulo.Text + "','" + txtCkEditor.Text + "',0,'" + ddtema.Text + "','" + ddsubTema.Text + "','" + descricao.Text + "','" + "" + "','" + false + "','" + (cena == "Links Úteis" ? descricao.Text : url) + "')";
            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect("~/admin/Artigo.aspx");
        }

        protected void sair_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Artigo.aspx");
        }

        protected void ddsubTema_SelectedIndexChanged(object sender, EventArgs e)
        {
            String cena = ddsubTema.Items[ddsubTema.SelectedIndex].Text;
            if (cena == "Sabias Que?")
            {
                Label2.Text = "Descrição";
                LabelImagens.Visible = false;
                imagem.Visible = false;
                LabelTexto.Visible = false;
                txtCkEditor.Visible = false;
                titulo.Visible = false;
                LabelTitulo.Visible = false;
                titulo.Text = "sem_titulo";

            }
            else if (cena == "Links Úteis")
            {
                titulo.Visible = true;
                LabelTitulo.Visible = true;
                LabelImagens.Visible = false;
                imagem.Visible = false;
                LabelTexto.Visible = false;
                txtCkEditor.Visible = false;
                Label1.Visible = false;
                autor.Visible = false;
                Label2.Text = "URL";
            }
            else if (cena == "Artigos")
            {
                Label2.Text = "Descrição";
                Label1.Visible = true;
                autor.Visible = true;
                LabelImagens.Visible = true;
                imagem.Visible = true;
                LabelTexto.Visible = true;
                txtCkEditor.Visible = true;
                titulo.Visible = true;
                LabelTitulo.Visible = true;
            }
        }
    }
}