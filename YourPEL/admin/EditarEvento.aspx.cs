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
    public partial class EditarEvento1 : System.Web.UI.Page
    {
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
            var query = db.EVENTOes;
            return query;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewEditar_UpdateItem(int idEvento)
        {
            //Editar
            using (YourPELcs db = new YourPELcs())
            {
                EVENTO item = null;
                item = db.EVENTOes.Find(idEvento);


                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("O item com id {0} não foi encontrado", idEvento));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewEditar_DeleteItem(int idEvento)
        {
            //Apagar
            using (YourPELcs db = new YourPELcs())
            {
                EVENTO item = null;
                item = db.EVENTOes.Find(idEvento);

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
                            "", String.Format("O item com o id {0} não existe", idEvento));
                    }

                }
            }
        }

        protected void Voltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin/Evento.aspx", false);
        }
    }
}