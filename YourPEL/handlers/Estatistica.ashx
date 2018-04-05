<%@ WebHandler Language="C#" Class="Estatistica" %>

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication2.api.handler
{
    /// <summary>
    /// Handler que recebe 
    /// </summary>
    public class handlerEstatistica : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            switch (context.Request["type"].ToString())
            {
                case "1":
                    context.Response.ContentType = "json";
                    carregaDados(context);
                    break;
                default:
                    Console.WriteLine("caso default");
                    break;
            }
        }

        private void carregaDados(HttpContext context)
        {
            string tipo = context.Request["tipo"];
            long idCookie = Convert.ToInt64(context.Request["id"]);
            string dispositivo = context.Request["dispositivo"];
            string sql = "";

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["YourPELcs"].ToString();
                connection.Open();             

                if (tipo == "visita")
                {
                    sql = "Insert into VISITAS(idCookie, dispositivo) values ('" + idCookie + "', '" + dispositivo + "');";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.ExecuteNonQuery();
                } 
                else if(tipo == "tema")
                {
                    string tema = context.Request["tema"];
                    int idClique;

                    if(tema == "alimentacao")
                    {
                        idClique = 20001;
                    }
                    else if (tema == "sexualidade")
                    {
                        idClique = 20002;
                    }
                    else
                    {
                        idClique = 20003;
                    }

                    sql = "Insert into CLIQUES(idClique, idCookie, dispositivo, tipoClique) values ('" + idClique + "', '" + idCookie + "', '" + dispositivo + "', 'tema');";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.ExecuteNonQuery();
                }
                else
                {
                    string idArtigo = context.Request["artigo"];

                    if(idArtigo.Length <2)
                    {
                        idArtigo = "3000" + idArtigo;
                    }
                    else if (idArtigo.Length < 3)
                    {
                        idArtigo = "300" + idArtigo;
                    }
                    else if (idArtigo.Length < 4)
                    {
                        idArtigo = "30" + idArtigo;
                    }
                    else
                    {
                        idArtigo = "3" + idArtigo;
                    }

                    sql = "Insert into CLIQUES(idClique, idCookie, dispositivo, tipoClique) values ('" + idArtigo + "', '" + idCookie + "', '" + dispositivo + "', 'artigo');";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.ExecuteNonQuery();
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}