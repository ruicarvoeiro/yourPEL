using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminYourPEL
{
    public partial class Artigo : System.Web.UI.Page
    {
        private readonly object[] idArtigo;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/EditarArtigos.aspx?idArtigo=" + id);
            }
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/EditarArtigos.aspx?idArtigo=" + id);
            }
        }
        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView3.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/EditarArtigos.aspx?idArtigo=" + id);
            }
        }
    }
}