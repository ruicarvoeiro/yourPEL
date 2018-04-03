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
    public partial class EditarPublicacao : System.Web.UI.Page
    {
        String post;
        int idArtigo;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                post = Request.QueryString["idPublicacao"];
                idArtigo = Convert.ToInt32(post);
                con.Open();
                string qry = "SELECT * FROM PUBLICACAO WHERE idPUBLICACAO ='" + idArtigo + "'";

                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    titulo.Text = sdr["titulo"].ToString();
                    conteudoo.Text = sdr["conteudo"].ToString();
                }
                else
                {
                    Response.Redirect("~/admin/Publicações.aspx");
                }
                con.Close();
            }
        }

        protected void submeter_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["idPublicacao"];
            idArtigo = Convert.ToInt32(post);
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE PUBLICACAO SET titulo='" + titulo.Text + "', conteudo='" + conteudoo.Text + "' WHERE idPUBLICACAO='" + this.idArtigo + "'";
            cmd.ExecuteNonQuery();
            db.Close();
            Response.Redirect("~/admin/Publicações.aspx");
        }

        protected void sair_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Publicações.aspx");
        }
    }
}