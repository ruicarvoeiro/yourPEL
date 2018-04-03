using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using YourPEL.admin;

namespace AdminYourPEL
{
    public partial class Documentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddDocumento_Click(object sender, EventArgs e)
        {
            lblFeedback2.Text = "";
        }

       

        

        // O tipo de retorno pode ser alterado para IEnumerable, no entanto, para dar suporte à paginação de
        // e classificação, os seguintes parâmetros devem ser adicionados:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<DOCUMENTO> docsGridView_GetData()
        {
            YourPELcs db = new YourPELcs();
            var query = db.DOCUMENTOes;
            return query;
        }



        // O nome do parâmetro id deve corresponder ao valor DataKeyNames definido no controle
        public void docsGridView_DeleteItem(DOCUMENTO item)
        {
            using (YourPELcs ctx = new YourPELcs())
            {
                DOCUMENTO doc = ctx.DOCUMENTOes.Find(item.idDocumento);
                // Carregue o item aqui, por exemplo item = MyDataLayer.Find(id);
                if (doc == null)
                {
                    // O item não foi encontrado
                    ModelState.AddModelError("", String.Format("O item com id {0} não foi encontrado", item.idDocumento));
                    return;
                }
                ctx.DOCUMENTOes.Remove(doc);
                TryUpdateModel(doc);
                if (ModelState.IsValid)
                {
                    // Salve alterações aqui, por exemplo MyDataLayer.SaveChanges();
                    ctx.SaveChanges();
                }
            }
        }

        static Boolean SaveDocAsXmlFormat(DOCUMENTO obj, string fileName)
        {
            // Save object to a file named something.xml in XML format.
            XmlSerializer xmlFormat = new XmlSerializer(typeof(DOCUMENTO));
            using (Stream fStream = new FileStream(fileName,
            FileMode.Create, FileAccess.Write, FileShare.None))
            {
                try
                {
                    xmlFormat.Serialize(fStream, obj);
                    return true; //ficheiro xml criado com sucesso
                }
                catch
                {
                    return false; //não foi possível criar o ficheiro xml
                }
            }
        }

        protected void docsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void docsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // O nome do parâmetro id deve corresponder ao valor DataKeyNames definido no controle
        public void docsGridView_UpdateItem(DOCUMENTO item)
        {
            using (YourPELcs ctx = new YourPELcs())
            {
                DOCUMENTO doc = ctx.DOCUMENTOes.Find(item.idDocumento);
                // Carregue o item aqui, por exemplo item = MyDataLayer.Find(id);
                if (doc == null)
                {
                    // O item não foi encontrado
                    ModelState.AddModelError("", String.Format("O item com id {0} não foi encontrado", item.idDocumento));
                    return;
                }
                TryUpdateModel(doc);



                if (ModelState.IsValid)
                {
                    if ((doc.tema.ToString() != "Alimentação") &&
                    (doc.tema.ToString() != "Consumos Nocivos") &&
                    (doc.tema.ToString() != "Sexualidade"))
                    {
                        lblFeedback2.Text = "Campo 'Tema' inválido! ('Alimentação', 'Consumos Nocivos' ou 'Sexualidade')";
                    }
                    else
                    {
                        // Salve alterações aqui, por exemplo MyDataLayer.SaveChanges();
                        ctx.SaveChanges();
                    }
                }
            }

        }
    }
}