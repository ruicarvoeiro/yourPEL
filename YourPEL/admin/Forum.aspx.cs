using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class Forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/addPost.aspx");
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView3.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView4.Rows[index];
                String id = row.Cells[1].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView5.Rows[index];
                String id = row.Cells[1].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView6_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView6.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView7_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView7.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
        protected void GridView8_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView8.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/oTopico.aspx?ID_POST=" + id);
            }
        }
    }
}