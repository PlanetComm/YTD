using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

namespace YTD
{
    public partial class APVendor : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); DataSet dsDGV = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV(1);
            }
        }

        private void DGV(byte sType)
        {
            NP_Cls.sqlSelect = "SELECT [CUSTOMER NUMBER] AS CusNo ,[NAME] AS CusName ,[SHORT NAME] AS CusSh ,[ADDRESS] ,'''' + [PHONE] AS PHONE ,'''' + [FAX] AS FAX ,[CONTACT] ,'''' +[CONTACT PHONE] AS [CONTACTPHONE] ,'''' +[CONTACT FAX] AS [CONTACTFAX] ,[CONTACT EMAIL] AS Email ,[ACTIVE] ,[INACTIVE ON] AS InOn,[LAST MAINTAINED] AS LastMA ,[GROUP CODE] AS GRP,[START DATE] AS STRDATE,[TERRITORY] ,[ACCOUNT TYPE] AS ACCTY ,[ACCOUNT SET] AS AccSET,[BILLING CYCLE] AS Bill ,[PAYMENT CODE] AS PayCode,[TERMS CODE] AS Term,[CREDIT LIMITED] AS Cr ,'''' + [CUSTAXID] AS [CUSTAXID] FROM [PCASIA].[dbo].[vw_AR_Customer] ";
            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.rgPOGDS.DataSource = dsDGV.Tables[0];
            if (sType == 1)
            {
                this.rgPOGDS.DataBind();
            }
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgPOGDS.ExportSettings.ExportOnlyData = true;
            this.rgPOGDS.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgPOGDS.ExportSettings.IgnorePaging = true;
            this.rgPOGDS.ExportSettings.FileName = "ARCustomerReview_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgPOGDS.MasterTableView.ExportToExcel();
        }
        protected void rgPOGDS_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
    }
}