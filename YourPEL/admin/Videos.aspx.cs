using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YourPEL.admin;

namespace AdminYourPEL
{
    public partial class Videos : System.Web.UI.Page
    {

        private readonly object[] idArtigo;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable GridViewEditar_GetData()
        {
            YourPELcs db = new YourPELcs();
            var query = db.ARTIGOes;
            return query;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        /*public void GridViewEditar_UpdateItem(int id)
        {
            //Editar
            using (YourPELEntities db = new YourPELEntities())
            {
                ARTIGO item = null;
                item = db.ARTIGOes.Find(idArtigo);


                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("O item com id {0} não foi encontrado", idArtigo));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
        }*/

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewEditar_DeleteItem(int id)
        {
            //Apagar
            using (YourPELcs db = new YourPELcs())
            {
                ARTIGO item = null;
                item = db.ARTIGOes.Find(idArtigo);

                if (item != null)
                {
                    db.Entry(item).State = System.Data.Entity.EntityState.Deleted;
                    try
                    {
                        db.SaveChanges();
                    }
                    catch (DBConcurrencyException)
                    {
                        ModelState.AddModelError(
                            "", String.Format("O item com o id {0} não existe", idArtigo));
                    }

                }
            }
        }

        protected void GridViewEditar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvVids.Rows[index];
                String id = row.Cells[0].Text;
                Response.Redirect("~/admin/EditarVideo.aspx?idArtigo=" + id);
            }
        }
    }
}