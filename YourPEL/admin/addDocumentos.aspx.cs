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
    public partial class addDocumentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFeedback.Text = "";
            HttpPostedFile docAFazerUpload = FileUpload1.PostedFile;
            if (docAFazerUpload != null)
            {
                if (
                    Path.GetExtension(docAFazerUpload.FileName).ToLower() == ".pdf" ||
                    Path.GetExtension(docAFazerUpload.FileName).ToLower() == ".doc" ||
                    Path.GetExtension(docAFazerUpload.FileName).ToLower() == ".ppt" ||
                    Path.GetExtension(docAFazerUpload.FileName).ToLower() == ".docx"
                    )
                    //DONE
                {
                    //Inicialização do id do documento escolhido
                    int idDocAInserir = inserirDoc(
                        txtNomeDocumento.Text, txtDescricaoDocumento.Text, ".", listTemaDocumento.SelectedItem.Text); //falta url porque não pode ser null



                    //criar novo Documento
                    DOCUMENTO novoDoc = new DOCUMENTO();

                    //guardar ficheiro uploaded para um determinado caminho
                    novoDoc.idDocumento = idDocAInserir;
                    novoDoc.nome = txtNomeDocumento.Text;
                    novoDoc.descricao = txtDescricaoDocumento.Text;

                    string path = Server.MapPath(".") + "\\Docs\\" + "id" + novoDoc.idDocumento + "_" + novoDoc.nome + Path.GetExtension(docAFazerUpload.FileName).ToLower();
                    docAFazerUpload.SaveAs(path);
                    novoDoc.url = "admin//Docs//" + "id" + novoDoc.idDocumento + "_" + novoDoc.nome + Path.GetExtension(docAFazerUpload.FileName).ToLower();

                    UpdateDocUrl(novoDoc.idDocumento, novoDoc.url); //correção do "." deixado como placeholder na tabela DOCUMENTO                   

                }
                else
                {
                    lblFeedback.Text = "Só é possível ler ficheiros em formato PDF e Documentos Word!";
                }
                Response.Redirect("~/admin/Documentos.aspx");
            }
        }
        public static void UpdateDocUrl(int id, string novoUrl)
        {
            // Format and execute SQL statement
            string sql = "Update DOCUMENTO Set url = " +
               $"'{novoUrl}' Where idDocumento = '{id}'";

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }
        private int inserirDoc(string nome, string descricao, string url, string tema)
        {
            int idDoDoc = 0; //id a devolver do row inserido, 0 se não foi devolvido nenhum

            // Format and execute SQL statement
            string sql = "Insert Into DOCUMENTO" +
                $"(nome, descricao, url, tema) " +
                $"Values ('{nome}','{descricao}','{url}','{tema}');" +
                $"SELECT SCOPE_IDENTITY();";

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    idDoDoc = Convert.ToInt32(command.ExecuteScalar());
                    //idDoDoc = command.ExecuteNonQuery();

                }
            }
            return idDoDoc;
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Documentos.aspx");
        }
    }
}