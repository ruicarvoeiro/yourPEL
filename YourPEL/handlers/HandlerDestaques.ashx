﻿<%@ WebHandler Language="C#" Class="HandlerDestaques" %>

using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

public class HandlerDestaques : IHttpHandler
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourPELcs"].ToString());

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getDestaques(context);
                break;
            case "2":
                getArtigoEmDestaque(context);
                break;
            case "3":
                getVideosDestaque(context);
                break;
        }
    } //ProcessRequest

    /////////////////////////DESTAQUES/////////////////////////
    public void getDestaques(HttpContext context)
    {
        String json = "";
        var listaDeDestaques = new List<String>();
        var serializer = new JavaScriptSerializer();
        var numeroArtigosRecebidos = Convert.ToInt32(context.Request.Form["numeroArtigosRecebidos"].ToString());
        var numeroDeArtigosPedidos = Convert.ToInt32(context.Request.Form["numeroDeArtigosPedidos"].ToString());
        var jafoi = 0;

        //fazer a query de forma air buscar um certo numero de artigos (excepto o primeiro) + sabias que + videos de todos os temas ordenados pela data (de forma decrescente)

        try
        {
            SqlCommand cmd = new SqlCommand("SELECT [idArtigo], [titulo], [descricao], [url], [subTema], [tema], [urlYoutube]" +
                                                    " FROM [YourPEL].[dbo].[ARTIGO] WHERE ([subTema] = 'Artigo' OR [subTema] = 'SabiasQue' OR [subTema] = 'Videos') AND [ativo] = 'True' ORDER BY [ordemRelevancia] DESC, [dataHora] DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            for (var i = numeroArtigosRecebidos; i < numeroArtigosRecebidos + numeroDeArtigosPedidos; i++)
            {
                if (dt.Rows.Count > i)
                {
                    if (dt.Rows[i]["subTema"].Equals("Artigo"))
                    {
                        jafoi++;
                    }
                    //NOTA: ver formato que vem da base de dados
                    //tipo frontend ARTIGO, SABIAS-QUE

                    if ((jafoi != 1 && dt.Rows[i]["subTema"].Equals("Artigo")) || dt.Rows[i]["subTema"].Equals("SabiasQue") || dt.Rows[i]["subTema"].Equals("Videos"))
                    {
                        var temaArtigos = "";
                        if (dt.Rows[i]["tema"].ToString() == "Consumos Nocivos")
                            temaArtigos = "CONSUMOS";
                        else if (dt.Rows[i]["tema"].ToString() == "Alimentação")
                            temaArtigos = "ALIMENTACAO";
                        else
                            temaArtigos = "SEXUALIDADE";

                        var qualTipo = "";
                        if (dt.Rows[i]["subTema"].Equals("SabiasQue"))
                        {
                            qualTipo = "SABIAS-QUE";
                        }
                        else  if (dt.Rows[i]["subTema"].Equals("Videos"))
                        {
                            qualTipo = "VIDEO";
                        }
                        else
                        {
                            qualTipo = dt.Rows[i]["subTema"].ToString().ToUpper();
                        }
                        listaDeDestaques.Add(
                            serializer.Serialize(
                                new
                                {
                                    tema = temaArtigos,
                                    tipo = qualTipo,
                                    imagem = dt.Rows[i]["url"],
                                    titulo = dt.Rows[i]["titulo"],
                                    texto = dt.Rows[i]["descricao"],
                                    link = dt.Rows[i]["urlYoutube"],
                                    url = dt.Rows[i]["idArtigo"]
                                }
                        ));
                    }

                }
                else
                {
                    listaDeDestaques.Add(
                    serializer.Serialize(null));
                }
                //json = serializer.Serialize(listaDeDestaques);
            }

            json = serializer.Serialize(listaDeDestaques);


            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {

        }
    } //getDestaques

    /////////////////////////ARTIGO EM DESTAQUE/////////////////////////
    public void getArtigoEmDestaque(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas
        try
        {
            SqlCommand cmd = new SqlCommand("select TOP(1) [idArtigo], [titulo], [descricao], [url], [tema] from [YourPEL].[dbo].[ARTIGO]" +
                " WHERE [subTema] = 'Artigo' AND [ativo] = 'True' ORDER BY [ordemRelevancia] DESC, [dataHora] DESC;", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);

            var temaArtigos = "";
            if (dt.Rows[0]["tema"].ToString() == "Consumos Nocivos")
                temaArtigos = "CONSUMOS";
            else if (dt.Rows[0]["tema"].ToString() == "Alimentação")
                temaArtigos = "ALIMENTACAO";
            else
                temaArtigos = "SEXUALIDADE";

            json =
                serializer.Serialize(
                    new
                    {
                        tema = temaArtigos,
                        imagem = dt.Rows[0]["url"],
                        titulo = dt.Rows[0]["titulo"],
                        texto = dt.Rows[0]["descricao"],
                        url = dt.Rows[0]["idArtigo"]
                    }
            );
            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message.ToString());
        }
    } //getArtigoEmDestaque

    /////////////////////////VIDEOS/////////////////////////
    public void getVideosDestaque(HttpContext context)
    {
        String json = "";
        var listaDeVideos = new List<String>();
        var serializer = new JavaScriptSerializer();
        var numeroVideosRecebidos = Convert.ToInt32(context.Request.Form["numeroVideosRecebidos"].ToString());
        var numeroDeVideosPedidos = Convert.ToInt32(context.Request.Form["numeroDeVideosPedidos"].ToString());

        try
        {
            //Fazer aqui a query à respetiva tabela, de forma a conseguir ter um certo número de videos de todos os temas
            SqlCommand cmd = new SqlCommand("select [tema], [urlYoutube], [titulo], [descricao]" +
                        "from [YourPEL].[dbo].[ARTIGO] " +
                        "WHERE [subTema] = 'Videos' AND [ativo] = 'True' ORDER BY [dataHora] DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            for (var i = numeroVideosRecebidos; i < numeroVideosRecebidos + numeroDeVideosPedidos; i++)
            {
                if (dt.Rows.Count > i)
                {
                    var temaArtigos = "";
                    if (dt.Rows[i]["tema"].ToString() == "Consumos Nocivos")
                        temaArtigos = "CONSUMOS";
                    else if (dt.Rows[i]["tema"].ToString() == "Alimentação")
                        temaArtigos = "ALIMENTACAO";
                    else
                        temaArtigos = "SEXUALIDADE";
                    listaDeVideos.Add(
                        serializer.Serialize(
                            new
                            {
                                tema = temaArtigos,
                                link = dt.Rows[i]["urlYoutube"],
                                titulo = dt.Rows[i]["titulo"],
                                texto = dt.Rows[i]["descricao"]
                            }
                    ));
                }
                else
                {
                    listaDeVideos.Add(
                        serializer.Serialize(null));
                }
            }
            json = serializer.Serialize(listaDeVideos);


            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message.ToString());
        }
    } //getVideosDestaque


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}