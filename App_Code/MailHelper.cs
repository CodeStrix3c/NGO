///Author 	:: Isfan Habib
///Created On	:: 29 December 2009

using System;
using System.Collections.Generic;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Configuration;

/// <summary>
/// Summary description for MailHelper
/// </summary>
public class MailHelper
{
    /// <summary>
    /// Sends an mail message
    /// </summary>
    /// <param name="FromDisplayName">From Display Name</param>
    /// <param name="ToDisplayName">To Display Name</param>
    /// <param name="from">Sender address</param>
    /// <param name="to">Recepient address</param>
    /// <param name="bcc">Bcc recepient</param>
    /// <param name="cc">Cc recepient</param>
    /// <param name="subject">Subject of mail message</param>
    /// <param name="body">Body of mail message</param>
    
    public static bool SendMailMessage(string FromDisplayName, string ToDisplayName, string from, string to, string bcc, string cc, string subject, string body)
    {
        bool varResult = false;

        try
        {
            // Instantiate a new instance of MailMessage
            MailMessage mMailMessage = new MailMessage();
            // Set the sender address of the mail message
            mMailMessage.From = new MailAddress(from, FromDisplayName);
            // Set the recepient address of the mail message
            mMailMessage.To.Add(new MailAddress(to, ToDisplayName));

            // Check if the bcc value is null or an empty string
            if ((bcc != null) && (bcc != string.Empty))
            {
                // Set the Bcc address of the mail message
                mMailMessage.Bcc.Add(new MailAddress(bcc));
            }
            // Check if the cc value is null or an empty value
            if ((cc != null) && (cc != string.Empty))
            {
                // Set the CC address of the mail message
                mMailMessage.CC.Add(new MailAddress(cc));
            }       // Set the subject of the mail message
            mMailMessage.Subject = subject;
            // Set the body of the mail message
            mMailMessage.Body = body;

            // Set the format of the mail message body as HTML
            mMailMessage.IsBodyHtml = true;
            // Set the priority of the mail message to normal
            mMailMessage.Priority = MailPriority.Normal;

            // Instantiate a new instance of SmtpClient
            SmtpClient mSmtpClient = new SmtpClient();

            //--------------------
            //SmtpClient client = new SmtpClient(host, port); //  Create an instance of SmtpClient with your smtp host and port
            //client.Credentials = new NetworkCredential(account, pswd); //  Assign your username and password to connect to gmail

            mSmtpClient.Host = ConfigurationManager.AppSettings["host"];
            mSmtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["port"]);

            // Un-comment below 3 lines during the Testing through GMail
            mSmtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["account"], ConfigurationManager.AppSettings["pswd"]);
            mSmtpClient.EnableSsl = true;
            mMailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

            //--------------------

            // Send the mail message
            mSmtpClient.Send(mMailMessage);

            varResult = true;

        }
        catch (Exception ex)
        {

            varResult = false;
        }

        return varResult;
    }


    public MailHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}
