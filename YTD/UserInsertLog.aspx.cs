using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace YTD
{
    public partial class UserInsertLog : System.Web.UI.Page
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
                try
                {
                    string EID = Request.QueryString["EID"].ToString();
                    DataSet ds = new DataSet();
                    ds = NP.Execute("SELECT     EmployeeID, Dept, Sect FROM  IT.dbo.Employee WHERE    (EmployeeID = '" + EID + "')", ref NP_Cls.strErr);
                    
                    NP_Cls.sqlInsert = "INSERT INTO IT.dbo.APW_Log  (LogUserID) VALUES ('" + EID + "')";
                    NP.SQLCommand(NP_Cls.sqlInsert, ref NP_Cls.strErr);

                    Configuration myConfiguration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                    myConfiguration.AppSettings.Settings["CurrentMonthName"].Value = (NP.Execute("SELECT DATENAME(month,GETDATE())", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString()).ToUpper();
                    myConfiguration.AppSettings.Settings["CurrentMonthNum"].Value = (NP.Execute("SELECT DATEPART(mm,GETDATE())", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString());
                    myConfiguration.Save();



                    Response.Redirect("Menu.aspx?N=" + NP.EnText(EID) + "&S=" + ds.Tables[0].Rows[0]["Sect"].ToString());
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}