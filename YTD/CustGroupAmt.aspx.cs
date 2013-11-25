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
    public partial class CustGroupAmt : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); double dAmt = 0.00;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV(1);
                DGVSum(1);
                this.dtpFrom.Clear(); this.dtpTo.Clear();
                this.dtpFrom.Focus();
            }
        }
        
        void DGV(byte type)
        {
            //if (string.IsNullOrEmpty(this.dtpFrom.Text.Trim())) { return; }
            DataSet dsMain = new DataSet();

            NP_Cls.sqlSelect = "SELECT     CustGroupCode, CustGroupDesc, CustCode, CustName, SUM(CostAmount) AS CostAmount, SUM(Amount) AS Amount, "+
            "CASE WHEN SUM(CostAmount) < 1 THEN 100 ELSE ((SUM(Amount) - SUM(CostAmount)) / SUM(CostAmount) * 100) END AS Margin  FROM vw_CustGroupCost  WHERE   (1=1) ";
            if ((this.dtpFrom.SelectedDate == null) && (this.dtpTo.SelectedDate == null))
            {
                NP_Cls.sqlSelect += " AND (1=0) ";
            }
            else
            {
                NP_Cls.sqlSelect += " AND  (Cond BETWEEN '" + this.dtpFrom.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + "' AND '" + this.dtpTo.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + "') ";
            }

            NP_Cls.sqlSelect += " GROUP BY CustGroupCode, CustGroupDesc, CustCode, CustName";
            dsMain = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (dsMain.Tables[0].Rows.Count == 0) { return; }

            this.RadGrid1.DataSource = dsMain.Tables[0];
            if (type == 1) { this.RadGrid1.DataBind(); }
        }
        void DGVSum(byte type)
        {
            //if (string.IsNullOrEmpty(this.dtpFrom.Text.Trim())) { return; }
            DataSet dsMainSum = new DataSet();

            NP_Cls.sqlSelect = "SELECT     CustGroupCode, CustGroupDesc, SUM(CostAmount) AS CostAmount, SUM(Amount) AS Amount, " +
            "CASE WHEN SUM(CostAmount) < 1 THEN 100 ELSE ((SUM(Amount) - SUM(CostAmount)) / SUM(CostAmount) * 100) END AS Margin  FROM vw_CustGroupCost  WHERE   (1=1) ";
            if ((this.dtpFrom.SelectedDate == null) && (this.dtpTo.SelectedDate == null))
            {
                NP_Cls.sqlSelect += " AND (1=0) ";
            }
            else
            {
                NP_Cls.sqlSelect += " AND  (Cond BETWEEN '" + this.dtpFrom.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + "' AND '" + this.dtpTo.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + "') ";
            }

            NP_Cls.sqlSelect += " GROUP BY CustGroupCode, CustGroupDesc ORDER BY CustGroupCode";
            dsMainSum = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (dsMainSum.Tables[0].Rows.Count == 0) { return; }

            this.RadGridSum.DataSource = dsMainSum.Tables[0];
            if (type == 1) { this.RadGridSum.DataBind(); }

            
            //for (int i = 0; i < this.RadGridSum.Items.Count; i++)
            //{
            //    dAmt += double.Parse(this.RadGridSum.Items[i]["clnAmt"].Text.Trim());
            //}

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DGV(1); 
            DGVSum(1);
        }
        private void ConfigureExport()
        {
            this.RadGrid1.ExportSettings.ExportOnlyData = true;
            this.RadGrid1.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.RadGrid1.ExportSettings.IgnorePaging = true;
            this.RadGrid1.ExportSettings.FileName = "SalesByCustGrp_Period_" + this.dtpFrom.SelectedDate.Value.ToString("ddMMMyy", NP_Cls.cul) + "-" + this.dtpTo.SelectedDate.Value.ToString("ddMMMyy", NP_Cls.cul);

            //RadGridExporter exporter = new RadGridExporter();
            //exporter.FileName = "Scheduling_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul) + ".xls";
            //exporter.Export(RadGrid1);
        }
        bool isExport = false;
        protected void btnExport_Click(object sender, EventArgs e)
        {
            if (this.RadGrid1.Items.Count == 0) { this.NotifyWarn.Text = "Data Not Found to Export !!"; this.NotifyWarn.Show(); return; }
            isExport = true;
            ConfigureExport();
            this.RadGrid1.MasterTableView.ExportToExcel();
        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            //if (e.Item is GridDataItem)
            //{
            //    GridDataItem item = e.Item as GridDataItem;
            //    try
            //    {
            //        item["clnUnitPrice"].Text = double.Parse(item["clnUnitPrice"].Text.Trim()).ToString("#,0.00");
            //    }
            //    catch
            //    {
            //        item["clnUnitPrice"].Text = "0";
            //    }
            //}

            //if (e.Item is GridFooterItem)
            //{
            //    GridFooterItem footerItem = e.Item as GridFooterItem;
            //    try
            //    {
            //        footerItem["clnMargin"].Text = double.Parse((((double.Parse(footerItem["clnAMT"].Text.Trim()) - double.Parse(footerItem["clnCost"].Text.Trim())) / double.Parse(footerItem["clnCost"].Text.Trim())) * 100).ToString()).ToString("#,0.00");
            //    }
            //    catch
            //    {
            //        footerItem["clnMargin"].Text = "0";
            //    }
            //}
        }

        protected void RadGridSum_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGVSum(0);
        }
        protected void RadGridSum_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridFooterItem)
            {
                GridFooterItem footerItem = e.Item as GridFooterItem;
                try
                {
                    footerItem["clnMargin"].Text = double.Parse((((double.Parse(footerItem["clnAmt"].Text.Trim()) - double.Parse(footerItem["clnCostAmt"].Text.Trim())) / double.Parse(footerItem["clnCostAmt"].Text.Trim())) * 100).ToString()).ToString("#,0.00");
                    //footerItem["clnAmt"].Text = dAmt.ToString("#,0.00");
                }
                catch
                {
                    //footerItem["clnAmt"].Text = "0";
                    footerItem["clnMargin"].Text = "0";
                }
            }
        }

        protected void btnExportSum_Click(object sender, EventArgs e)
        {
            if (this.RadGrid1.Items.Count == 0) { this.NotifyWarn.Text = "Data Not Found to Export !!"; this.NotifyWarn.Show(); return; }           
            this.RadGridSum.ExportSettings.ExportOnlyData = true;
            this.RadGridSum.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.RadGridSum.ExportSettings.IgnorePaging = true;
            this.RadGridSum.ExportSettings.FileName = "SummaryByCustGrp_Period_" + this.dtpFrom.SelectedDate.Value.ToString("ddMMMyy", NP_Cls.cul) + "-" + this.dtpTo.SelectedDate.Value.ToString("ddMMMyy", NP_Cls.cul);
            this.RadGridSum.MasterTableView.ExportToExcel();
        }

    }
}