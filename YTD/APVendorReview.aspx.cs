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
    public partial class APVendorReview : System.Web.UI.Page
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
            NP_Cls.sqlSelect = "SELECT     VENDORID, SHORTNAME, IDGRP, CASE WHEN SWACTV = 1 THEN 'Active' ELSE 'Inactive' END AS SWACTV, CONVERT(nvarchar, CAST(CASE WHEN ISDATE(CAST(DATEINAC AS VARCHAR)) = 0 THEN NULL ELSE CAST(DATEINAC AS VARCHAR)                       END AS datetime), 106) AS DATEINAC, Convert(nvarchar,CAST(CASE WHEN ISDATE(CAST(DATESTART AS VARCHAR)) = 0 THEN NULL ELSE CAST(DATESTART AS VARCHAR)                       END AS datetime),106) AS DATESTART , VENDNAME, TEXTSTRE1, TEXTSTRE2, TEXTSTRE3, TEXTSTRE4, NAMECITY, CODESTTE, CODEPSTL,                    CODECTRY, NAMECTAC, TEXTPHON1, TEXTPHON2, IDACCTSET, CURNCODE, TERMSCODE, EMAIL1, EMAIL2, WEBSITE,  AMTCRLIMT FROM         APVEN ORDER BY VENDORID";
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
            this.rgPOGDS.ExportSettings.FileName = "APVendorReview_" + DateTime.Now.ToString("ddMMMyy");
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgPOGDS.MasterTableView.ExportToExcel();
        }
        protected void rgPOGDS_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
    }
}