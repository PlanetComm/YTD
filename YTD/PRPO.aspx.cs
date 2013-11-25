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
    public partial class PRPO : System.Web.UI.Page
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
            NP_Cls.sqlSelect = "SELECT     RQNNUMBER, PONUMBER, LOCATION, ITEMNO, ITEMDESC, COMMENT, OEONUMBER, EXPARRIVAL, ETA, PrepareBy, UID FROM         vw_PRPO  ORDER BY RQNNUMBER";
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
            this.rgPOGDS.ExportSettings.FileName = "PRPO_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);
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