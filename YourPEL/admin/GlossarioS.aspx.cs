using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace AdminYourPEL
{
    public partial class GlossarioS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }
        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                TableCell titulo = e.Row.Cells[0]; //titulo
                titulo.Width = new Unit("20%");

                TableCell descricao = e.Row.Cells[1]; //descricao
                descricao.Width = new Unit("70%");

                TableCell editDelete = e.Row.Cells[2]; //edit e delete
                editDelete.Width = new Unit("10%");
            }


        }

        protected void btnAddEntradaGlossario_Click(object sender, EventArgs e)
        {
            lblFeedback.ForeColor = System.Drawing.Color.Red;
            lblFeedback.Text = "";
            lblFeedback2.Text = "";
            string novaEntrada = txtTituloEntradaGlossario.Text;

            if (novaEntrada != "" && novaEntrada != null
                && txtDescricaoEntradaGlossario.Text != null
                && txtDescricaoEntradaGlossario.Text != "")
            {
                string primeiraLetraDaNovaEntrada = novaEntrada[0].ToString();

                XDocument doc = XDocument.Load(Server.MapPath("~/glossarioS.xml"));
                XElement novaDefinicao = new XElement("definicao");
                XElement titulo = new XElement("titulo");
                XElement conteudo = new XElement("conteudo");

                titulo.Add(txtTituloEntradaGlossario.Text);
                conteudo.Add(txtDescricaoEntradaGlossario.Text);

                novaDefinicao.Add(new XElement(titulo));
                novaDefinicao.Add(new XElement(conteudo));

                XElement letraAlvo = doc.Root.Descendants("letra")
                      .FirstOrDefault(el => el.Attribute("id") != null &&
                              el.Attribute("id").Value == primeiraLetraDaNovaEntrada.ToLower());
                if (letraAlvo != null)
                {//primeira letra coincide com uma do glossário
                    //ordenação alfabética
                    letraAlvo.Add(novaDefinicao);
                    var elementosOrganizados = letraAlvo.Elements().OrderBy(el => (string)el.Element("titulo")).ToArray();
                    letraAlvo.RemoveNodes();
                    foreach (XElement el in elementosOrganizados)
                    {
                        letraAlvo.Add(el);
                    }

                    doc.Save(Server.MapPath("~/glossarioS.xml"));

                    this.DataBind(); //refresh dos XML sources
                    lblFeedback.ForeColor = System.Drawing.Color.Green;
                    lblFeedback.Text = "Entrada inserida com sucesso!";
                }
                else
                {//primeiro caracter inválido
                    lblFeedback.Text += "A palavra tem de começar com uma letra do alfabeto português!\n";
                }

            }
            else
            {//algum dos campos não foi preenchido
                lblFeedback.Text += "Os campos têm que ser devidamente preenchidos!";
            }

        }

        protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblFeedback.Text = "";
            e.Cancel = true; //evento para delete por defeito não é utilizado, é cancelado para não gerar conflito
            XmlDocument xd = new XmlDocument();
            xd.Load(Server.MapPath("~/glossarioS.xml"));

            string tituloAlvo = e.Keys["Título"].ToString();
            XmlNode titulo = xd.SelectSingleNode("//titulo[text()='" + tituloAlvo + "']");
            XmlNode definicaoARemover = titulo.ParentNode;

            xd.SelectSingleNode("//letra[@id='" + tituloAlvo[0].ToString().ToLower() + "']").RemoveChild(definicaoARemover);

            xd.Save(Server.MapPath("glossarioS.xml"));
            this.DataBind(); //refresh dos XML sources
            lblFeedback2.ForeColor = System.Drawing.Color.Green;
            lblFeedback2.Text = "Entrada apagada.";


        }

        protected void gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblFeedback.Text = "";
            e.Cancel = true; //evento para update por defeito não é utilizado, é cancelado para não gerar conflito
            XmlDocument xd = new XmlDocument();
            xd.Load(Server.MapPath("~/glossarioS.xml"));

            string tituloAlvo = e.Keys["Título"].ToString();
            XmlNode titulo = xd.SelectSingleNode("//titulo[text()='" + tituloAlvo + "']");
            XmlNode descricao = titulo.NextSibling;
            descricao.InnerText = e.NewValues["Descrição"].ToString();

            xd.Save(Server.MapPath("~/glossarioS.xml"));
            this.DataBind(); //refresh dos XML sources

            lblFeedback2.Text = "Entrada atualizada.";
        }

        protected void gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lblFeedback.Text = "";
            lblFeedback2.Text = "";
        }
    }
}