<%@ WebHandler Language="C#" Class="FeedBack" %>

using System;
using System.Configuration;
using System.Threading;
using System.Web;

public class FeedBack : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        const string subject = "Feedback from JunkyStudio";
        var body = string.Format("{0}, <br /> <b>Phone</b>:{1}", context.Request["message"], context.Request["phone"]);
        var recipiens = new[] { ConfigurationManager.AppSettings["Mailbox"] };
        var sender = string.Format("{0} <{1}>", context.Request["name"],context.Request["mail"]);

        try
        {
            Mail.Send(subject,body,sender,recipiens,null);
            context.Response.Write("{\"Result\" : \"Success\"}");
        }
        catch(Exception ex)
        {
            context.Response.Write("{\"Result\" : \"" + ex.Message + "\"}");
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}