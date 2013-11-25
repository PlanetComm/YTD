using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace YTD._404
{
    public partial class _404 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.lblSent.Visible = false;
                this.txtSent.Focus();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    NetworkCredential loginInfo = new NetworkCredential();
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("NoReply@planetcomm.com");
                    msg.To.Add("thannapan@planetcomm.com");
                    msg.Subject = "Web Intranet has Occur problem";
                    msg.Body += "Page : " + Request.QueryString["aspxerrorpath"].ToString() + " could be Error / Warning Script !!<br>";
                    msg.Body += "From : " + this.txtSent.Text.Trim() + " -- DateTime : "+ DateTime.Now.ToString("dd MMM yyy hh:mm:ss tt") +"<br>";

                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;
                    SmtpClient client = new SmtpClient("pca-email.planetcomm.com");
                    client.Send(msg);

                    this.lblSent.Visible = true; this.txtSent.Text = string.Empty;
                }
                catch ( Exception ex)
                {
                    Response.Write("Ex : " + ex.Message); return;
                }
            }
        }
    }
}