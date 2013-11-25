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
    public partial class UserLog : System.Web.UI.Page
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
            NP_Cls.sqlSelect = "SELECT 0 AS ItemNo,    LogUserID, NAME, Dept, Sect, LogDateTime FROM    IT.dbo.vw_LogAccess ORDER BY LogDateTime DESC";
            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            for (int i = 0; i < dsDGV.Tables[0].Rows.Count; i++)
            {
                dsDGV.Tables[0].Rows[i][0] = i + 1;
            }

            this.rgPOGDS.DataSource = dsDGV.Tables[0];
            if (sType == 1)
            {
                this.rgPOGDS.DataBind();
            }
        }
        protected void rgPOGDS_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgPOGDS.ExportSettings.ExportOnlyData = true;
            this.rgPOGDS.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgPOGDS.ExportSettings.IgnorePaging = true;

        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgPOGDS.MasterTableView.ExportToExcel();
        }
    }
}