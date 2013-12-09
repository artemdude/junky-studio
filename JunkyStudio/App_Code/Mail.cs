using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Net.Mail;


/// <summary>
/// Send mails
/// </summary>
public class Mail
{
    public static void Send(string subject, string body, string sender, IEnumerable<string> recipients, Attachment attachment)
    {
        MailMessage message = new MailMessage();

        foreach (string recipient in recipients)
        {
            message.To.Add(recipient);
        }

        message.From = new MailAddress(sender);
        message.Subject = subject;
        message.IsBodyHtml = true;
        message.Body = body;

        if (attachment != null)
        {
            message.Attachments.Add(attachment);
        }

        // Configure SMTP client
        SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["SMTPHost"]);

        if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["SMTPHost"]))
        {
            client.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
        }


        if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["SMTPPort"]))
        {
            client.Port = int.Parse(ConfigurationManager.AppSettings["SMTPPort"]);
        }

        if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["SMTPUsername"]))
        {
            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["SMTPUsername"], ConfigurationManager.AppSettings["SMTPPassword"]);
        }

        client.Send(message);
    }

    public static string ExtractAddressLocalPart(string emailAddress)
    {
        string result = String.Empty;

        int atIndex = emailAddress.IndexOf('@');

        if (atIndex > 0)
        {
            result = emailAddress.Substring(0, atIndex);
        }

        return result;
    }
}
