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
    public partial class SalesHistory : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.dtpFrom.Clear(); this.dtpTo.Clear();
                this.dtpFrom.Focus();
            }
        }

        void DGV(byte type)
        {
            //if (string.IsNullOrEmpty(this.dtpFrom.Text.Trim())) { return; }
            DataSet dsMain = new DataSet();

            NP_Cls.sqlSelect = "SELECT  ORDNUMBER,  TRANDATE, CONVERT(nvarchar, CAST(CAST(TRANDATE AS varchar) AS datetime), 103) AS TRANDATE_, TRANNUM, CUSTOMER, NAMECUST, SALPER, SG, FMTITEMNO, [DESC], CATEGORY, QTYSOLD, UnitPrice, FAMTSALES, FCSTSALES,  Margin FROM vw_SalesHistory  WHERE   (1=1) ";
            if ((this.dtpFrom.SelectedDate == null) && (this.dtpTo.SelectedDate == null))
            {
                NP_Cls.sqlSelect += " AND (1=0) ";
            }
            else
            {
                NP_Cls.sqlSelect += " AND  (TRANDATE BETWEEN '" + this.dtpFrom.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + "' AND '" + this.dtpTo.SelectedDate.Value.ToString("yyyyMMdd", NP_Cls.cul) + "') ";
            }

            if (this.rdMarket.Checked)
            {
                NP_Cls.sqlSelect += " ORDER BY SG";
            }
            else if (this.rdProduct.Checked)
            {
                NP_Cls.sqlSelect += " ORDER BY CATEGORY";
            }
            else
            {
                NP_Cls.sqlSelect += " ORDER BY TRANDATE";
            }
            
            dsMain = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (dsMain.Tables[0].Rows.Count == 0) { return; }

            this.RadGrid1.DataSource = dsMain.Tables[0];
            //string mm = DateTime.Now.ToString("MM", NP_Cls.cul);
            //for (int i = 0; i < this.RadGrid1.Columns.Count; i++)
            //{
            //    for (int j = 1; j < int.Parse(mm) - 1; j++)
            //    {
            //        DateTime dtDate = new DateTime(2000, j, 1);
            //        if (this.RadGrid1.Columns[i].HeaderText.ToUpper() == dtDate.ToString("MMM", NP_Cls.cul).ToUpper())
            //        {
            //            this.RadGrid1.Columns[i].Display = false;
            //        }
            //    }
            //}
            if (type == 1) { this.RadGrid1.DataBind(); }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //if (string.IsNullOrEmpty(this.txtSO.Text.Trim()))
            //{
            //    this.NotifyWarn.Text = "Please entry Sales Order No. !!!"; this.NotifyWarn.Show(); return;
            //}
            DGV(1);
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        private void ConfigureExport()
        {
            this.RadGrid1.ExportSettings.ExportOnlyData = true;
            this.RadGrid1.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.RadGrid1.ExportSettings.IgnorePaging = true;
            this.RadGrid1.ExportSettings.FileName = "SalesHistory" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);

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

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                try
                {
                    item["clnUnitPrice"].Text = double.Parse(item["clnUnitPrice"].Text.Trim()).ToString("#,0.00");
                }
                catch
                {
                    item["clnUnitPrice"].Text = "0";
                }
            }

            if (e.Item is GridFooterItem)
            {
                GridFooterItem footerItem = e.Item as GridFooterItem;
                try
                {
                    footerItem["clnMargin"].Text = double.Parse((((double.Parse(footerItem["clnAMT"].Text.Trim()) - double.Parse(footerItem["clnCost"].Text.Trim())) / double.Parse(footerItem["clnCost"].Text.Trim())) * 100).ToString()).ToString("#,0.00");
                }
                catch 
                {
                    footerItem["clnMargin"].Text = "0";
                }
            }
        }
    
    }
}