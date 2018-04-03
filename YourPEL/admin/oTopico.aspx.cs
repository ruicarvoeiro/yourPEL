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
    public partial class oTopico : System.Web.UI.Page
    {
        String post;
        int idPost;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                post = Request.QueryString["ID_POST"];
                idPost = Convert.ToInt32(post);
                visibilidade(idPost);
                ativado(idPost);
                String connStr = ConfigurationManager.ConnectionStrings["YourPELcs"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("SELECT * FROM POST WHERE ID_POST = " + idPost, conn);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0][1].ToString();
                TextBox2.Text = dt.Rows[0][2].ToString();
            }
        }
        private void ativado(int idPost)
        {
            String connStr = ConfigurationManager.ConnectionStrings["YourPELcs"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT * FROM POST WHERE ID_POST = " + idPost, conn);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);


            string xx = dt.Rows[0][6].ToString();
            Boolean yy = Convert.ToBoolean(xx);
            if (yy == true)
            {
                Button2.Visible = false;
                Button3.Visible = true;
            }
            else
            {
                Button2.Visible = true;
                Button3.Visible = false;
            }
        }
        private void visibilidade(int idPost)
        {
            String connStr = ConfigurationManager.ConnectionStrings["YourPELcs"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT * FROM POST WHERE ID_POST = " + idPost, conn);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            string x = dt.Rows[0][5].ToString();
            Boolean y = Convert.ToBoolean(x);

            if (y == true)
            {
                Button4.Visible = false;
                Button5.Visible = true;
            }
            else
            {
                Button4.Visible = true;
                Button5.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["ID_POST"];
            idPost = Convert.ToInt32(post);
            string txt = idTbResponder.Text;
            string encodedText = Server.HtmlEncode(txt);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());


            var format = "yyyy-MM-dd";
            var strDate = DateTime.Now.ToString(format);
            conn.Open();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO RESPOSTA VALUES ('" +
                txt + "','" +
                strDate + "','" +
                //Saber quem respondeu, alterar isto:
                "1','" +
                idPost + "')", conn);

            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/admin/Forum.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["ID_POST"];
            idPost = Convert.ToInt32(post);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE POST SET ATIVO = 'false' WHERE ID_POST = " + idPost, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            visibilidade(idPost);
            Response.Redirect("~/admin/Forum.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["ID_POST"];
            idPost = Convert.ToInt32(post);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE POST SET ATIVO = 'true' WHERE ID_POST = " + idPost, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            visibilidade(idPost);
            Response.Redirect("~/admin/Forum.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["ID_POST"];
            idPost = Convert.ToInt32(post);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE POST SET FECHADO = 'true' WHERE ID_POST = " + idPost, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            ativado(idPost);
            Response.Redirect("~/admin/Forum.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            post = Request.QueryString["ID_POST"];
            idPost = Convert.ToInt32(post);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE POST SET FECHADO = 'false' WHERE ID_POST = " + idPost, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            ativado(idPost);
            Response.Redirect("~/admin/Forum.aspx");
        }
    }
}