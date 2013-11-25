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
    public partial class SO_ReCheck : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.dtpFrom.Focus();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (dtpFrom.SelectedDate == null) { this.NotifyWarn.Text = "Please select From: Date !!"; this.NotifyWarn.Show(); return; }
            if (dtpTo.SelectedDate == null) { this.NotifyWarn.Text = "Please select To: Date !!"; this.NotifyWarn.Show(); return; }
            if (dtpFrom.SelectedDate.Value > dtpTo.SelectedDate.Value) { this.NotifyWarn.Text = "To: Date must more that From: Date !! "; this.NotifyWarn.Show(); return; }

            DGV(1);
        }
        private void DGV(byte type)
        {
            if (this.dtpFrom.SelectedDate != null)
            {
                NP_Cls.sqlSelect = "SELECT 0 AS ItemNo,CompleteDate, ORDNUMBER, ORDATE, CUSCODE, CUSNAME, FilterDate, QUONUMBER, QUODATE, SHINUMBER, SHIDATE, DONUM, INVNUMBER, INVDATE FROM         vw_SO_ReCheck WHERE   (FilterDate BETWEEN " + this.dtpFrom.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + " AND " + this.dtpTo.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + ") ORDER BY FilterDate ";
            }
            else
            {
                NP_Cls.sqlSelect = "SELECT  0 AS ItemNo, CompleteDate, ORDNUMBER, ORDATE, CUSCODE, CUSNAME,  FilterDate, QUONUMBER, QUODATE, SHINUMBER, SHIDATE, DONUM,INVNUMBER, INVDATE FROM         vw_SO_ReCheck WHERE   (1=0) ORDER BY FilterDate ";
            }
            //this.Label3.Text = NP_Cls.sqlSelect;
            DataSet ds = new DataSet(); ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i][0] = i + 1;
            }
            this.rgCost.DataSource = ds.Tables[0];
            if (type == 1)
            {
                this.rgCost.DataBind();
            }
        }
        protected void rgCost_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgCost.ExportSettings.ExportOnlyData = true;
            this.rgCost.ExportSettings.Excel.Format = GridExcelExportFormat.ExcelML;
            this.rgCost.ExportSettings.IgnorePaging = true;

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            if (this.rgCost.Items.Count == 0) { this.NotifyWarn.Text = "Data not found to Export !!"; this.NotifyWarn.Show(); return; }
            ConfigureExport();
            this.rgCost.MasterTableView.ExportToExcel();
        }
    }
}