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
    public partial class EditarVideo : System.Web.UI.Page
    {

        String post;
        int idArtigo;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                post = Request.QueryString["idArtigo"];
                idArtigo = Convert.ToInt32(post);
                con.Open();
                string qry = "SELECT * FROM ARTIGO WHERE idArtigo ='" + idArtigo + "'";
                
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    titulo.Text = sdr["titulo"].ToString();
                    autor.Text = sdr["autor"].ToString();
                    txtVideoDesc.Text = sdr["texto"].ToString();
                    urlYoutube.Text = sdr["urlYoutube"].ToString();
                }
                else
                {
                    Response.Redirect("~/admin/Videos.aspx");
                }
                con.Close();
            }
        }

        protected void submeter_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["idArtigo"];
            idArtigo = Convert.ToInt32(post);
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            db.Open();
            SqlCommand cmd = db.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE ARTIGO SET titulo='"+titulo.Text+ "', autor='" + autor.Text + "',texto='" + txtVideoDesc.Text + "',urlYoutube='" + urlYoutube.Text + "' WHERE idArtigo='" +this.idArtigo+"'";
            cmd.ExecuteNonQuery();
            db.Close();
            Response.Redirect("~/admin/Videos.aspx");
        }

        protected void sair_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Videos.aspx");
        }
    }
}