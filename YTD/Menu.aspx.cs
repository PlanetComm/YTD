using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Security;
using Telerik.Web.UI;
using System.Security.Cryptography;
using System.Text;

namespace YTD
{
    public partial class Menu : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["N"] == null)
            {
                Response.Redirect("http://pca-erp");
            }
            else
            {
                this.PanelCost.Visible = false;
                this.PanelPur.Visible = false;
                this.PanelLog.Visible = false;
                this.PanelVendor.Visible = false;
                this.PanelINVCost.Visible = false;

                this.PanelExp.Visible = false;

                string deN = NP.DeText(Request.QueryString["N"].ToString());

                switch (deN.Trim())
                {
                    case "016":
                    case "039":
                    case "203":
                    case "001":
                    case "002":
                        this.PanelCost.Visible = true;
                        this.PanelPur.Visible = true;
                        this.PanelLog.Visible = true;
                        this.PanelVendor.Visible = true;
                        this.PanelINVCost.Visible = true;
                        this.PanelExp.Visible = true;
                        break;

                    case "200":
                    case "237":
                    case "003":
                    case "008":
                    case "175":
                    case "046":
                    case "278":
                        this.PanelCost.Visible = false;
                        this.PanelPur.Visible = true;
                        this.PanelLog.Visible = false;
                        this.PanelVendor.Visible = true;
                        this.PanelINVCost.Visible = false;
                        
                        break;

                    case "066":
                        this.PanelCost.Visible = false;
                        this.PanelPur.Visible = true;
                        this.PanelLog.Visible = true;
                        this.PanelVendor.Visible = true;
                        this.PanelINVCost.Visible = true;
                        this.PanelExp.Visible = true;
                        break;

                    case "075":
                    case "248":
                        this.PanelCost.Visible = true;
                        this.PanelPur.Visible = false;
                        this.PanelLog.Visible = false;
                        this.PanelVendor.Visible = false;
                        this.PanelINVCost.Visible = false;
                        this.PanelExp.Visible = true;
                        break;

                    case "063":
                        this.PanelCost.Visible = false;
                        this.PanelPur.Visible = false;
                        this.PanelLog.Visible = false;
                        this.PanelVendor.Visible = true;
                        this.PanelINVCost.Visible = false;
                        break;

                    case "213":
                        this.PanelCost.Visible = true;
                        this.PanelPur.Visible = true;
                        this.PanelLog.Visible = false;
                        this.PanelVendor.Visible = true;
                        this.PanelINVCost.Visible = true;
                        break;
                    case "136":
                        this.PanelVendor.Visible = true;
                        break;
                    case "271":
                    case "233":
                        this.PanelCost.Visible = false;
                        this.PanelPur.Visible = true;
                        this.PanelLog.Visible = false;
                        this.PanelVendor.Visible = true;
                        this.PanelINVCost.Visible = true;
                        break;
                    case "244":
                    case "135":
                        this.PanelExp.Visible = true;
                        break;
                    default:
                        this.PanelCost.Visible = false;
                        this.PanelPur.Visible = false;
                        this.PanelLog.Visible = false;
                        this.PanelVendor.Visible = false;
                        this.PanelINVCost.Visible = false;
                        break;
                }
            }
        }
        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
        // Verify a hash against a string.
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            // Hash the input.
            string hashOfInput = GetMd5Hash(md5Hash, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public string getUser()
        {
            if (Session["MM_Employeeid"] != null)
            {
                return Session["MM_Employeeid"].ToString();
            }
            else
            {
                return string.Empty;
            }
        }
    }
}