<%@ WebHandler Language="C#" Class="UploadImagens" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestYourPEL_CKEDITOR.Views.PublicarArtigo
{
    /// <summary>
    /// Descrição resumida de Handler1
    /// </summary>
    public class Upload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpPostedFile uploads = context.Request.Files["upload"];
            string CKEditorFuncNum = context.Request["CKEditorFuncNum"];
            string file = System.IO.Path.GetFileName(uploads.FileName);
            uploads.SaveAs(context.Server.MapPath(".") + "\\Imagens\\" + file);
            //provide direct URL here
            string url = "http://localhost/admin/Imagens/" + file;

            context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction("+", \"" + url + "\");</script>");
            context.Response.End();
        }

        public bool IsReusable {
        get { return false; }
}
    }
}