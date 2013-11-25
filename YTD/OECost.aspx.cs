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
    public partial class OECost : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DataSet dsBind = new DataSet(); dsBind = NP.Execute("SELECT     FMTCONTNO AS Code, CONVERT(nvarchar, CASE PMCONTS.STATUS WHEN 30 THEN 'Open' WHEN 10 THEN 'Estimate' WHEN 60 THEN 'Completed' END)                       + ' : ' + CONVERT(nvarchar, FMTCONTNO) + ' : ' + RTRIM([DESC]) AS [Desc], RTRIM([DESC]) AS Sort_ FROM         PMCONTS WHERE     (STATUS IN (30, 10, 60)) ORDER BY STATUS, Sort_", ref NP_Cls.strErr);
                //DataRow dr; dr = dsBind.Tables[0].NewRow();
                //dr[0] = "0"; dr[1] = "============ Select Condition ============";
                //dsBind.Tables[0].Rows.InsertAt(dr, 0);
                //dsBind.AcceptChanges();

                //this.cbCondition.DataSource = dsBind.Tables[0]; this.cbCondition.DataTextField = "Desc"; this.cbCondition.DataValueField = "Code"; this.cbCondition.DataBind();
                //this.cbCondition.SelectedIndex = -1;
                DGV(1);
                this.txtCondition.Focus();
            }
        }
        private void DGV(byte ty)
        {
            NP_Cls.sqlSelect = "SELECT     vw_OE_Cost.ItemNo, vw_OE_Cost.SO, vw_OE_Cost.ITEM, vw_OE_Cost.ITEMDESC, vw_OE_Cost.CATE, vw_OE_Cost.CATEDESC, vw_OE_Cost.QTY,                     CASE WHEN LEFT(vw_OE_Cost.ITEM, 8) = 'MISC-SUB' THEN ISNULL(POPORL.UNITCOST, 0) ELSE vw_OE_Cost.UNITCOST END AS UNITCOST,                       CASE WHEN LEFT(vw_OE_Cost.ITEM, 8) = 'MISC-SUB' THEN ISNULL(POPORL.UNITCOST, 0)                       ELSE vw_OE_Cost.UNITCOST END * vw_OE_Cost.QTY AS TOTALCOST, vw_OE_Cost.UNITPRICE, vw_OE_Cost.TOTALPRICE,                       vw_OE_Cost.MARGIN FROM         vw_OE_Cost LEFT OUTER JOIN                      POPORL ON vw_OE_Cost.SO = POPORL.OEONUMBER AND vw_OE_Cost.ITEM = POPORL.ITEMNO AND                       vw_OE_Cost.ITEMDESC = POPORL.ITEMDESC WHERE (1=1) ";
            if (!string.IsNullOrEmpty(this.txtCondition.Text.Trim()))
            {
                NP_Cls.sqlSelect += " AND (vw_OE_Cost.SO = '" + this.txtCondition.Text.Trim() + "') ";
            }
            else
            {
                NP_Cls.sqlSelect += " AND (1=0) ";
            }
            NP_Cls.sqlSelect += "  ORDER BY LINENUM  ";
            DataSet ds = new DataSet(); ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i][0] = i + 1;
                if (double.Parse(ds.Tables[0].Rows[i]["TOTALPRICE"].ToString()) > 0)
                {
                    ds.Tables[0].Rows[i]["MARGIN"] = (100 - ((decimal.Parse(ds.Tables[0].Rows[i]["TOTALCOST"].ToString()) / decimal.Parse(ds.Tables[0].Rows[i]["TOTALPRICE"].ToString())) * 100)).ToString();
                    //ds.Tables[0].Rows[i]["MARGIN"] = ((double.Parse(ds.Tables[0].Rows[i]["TOTALPRICE"].ToString()) - double.Parse(ds.Tables[0].Rows[i]["TOTALCOST"].ToString())) / double.Parse(ds.Tables[0].Rows[i]["TOTALCOST"].ToString())) * 100;
                }
            }
            this.rgCost.DataSource = ds.Tables[0];
            if (ty == 1)
            {
                this.rgCost.DataBind();
            }
            //  if (this.rgCost.Items.Count == 0) { this.btnExportExcel.Visible = false; } else { this.btnExportExcel.Visible = true; }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtCondition.Text.Trim()))
            {
                this.NotifyWarn.Text = "Please entry Condition !!";
                this.NotifyWarn.Show(); this.Panel1.Visible = false;
            }
            DGV(1);
        }

        protected void rgCost_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFooterItem)
            {
                try
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["clnMargin"].Text = (100 - ((decimal.Parse(footerItem["clnTotalCost"].Text.Trim()) / decimal.Parse(footerItem["clnTotalPrice"].Text.Trim())) * 100)).ToString("##.##") + "%";
                }
                catch
                {
                }

            }
        }
        protected void rgCost_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgCost.ExportSettings.ExportOnlyData = true;
            this.rgCost.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgCost.ExportSettings.IgnorePaging = true;
            this.rgCost.ExportSettings.FileName = "OECost" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            if (this.rgCost.Items.Count == 0)
            {
                this.NotifyWarn.Text = "Data Not Found to Export !!"; this.NotifyWarn.Show();
                return;
            }
            ConfigureExport();
            this.rgCost.MasterTableView.ExportToExcel();
        }
    }
}