using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;

namespace YTD
{
    public partial class ProdCateIntensive : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); DataSet dsDGV = new DataSet();
        private double dYTD = 0; private string strCmp = string.Empty;
        private double dFore = 0; private double dAch = 0; private double dAchYTD = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV(1);
            }
        }
        private void DGV(byte sType)
        {
            NP_Cls.sqlSelect = "SELECT 0 AS ItemNo, MKT_NM, MONTH_NM, AMT, FORECAST FROM vw_CTG_SUM_ALL_GROUP ORDER BY MKT_ID, MONTH_ID";
            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (dsDGV.Tables[0].Rows.Count > 0)
            {

                ////DataSet dsNewFore = new DataSet();
                //for (int i = 0; i < dsDGV.Tables[0].Rows.Count; i++)
                //{
                //    //dsNewFore.Clear();
                //    // Vee
                //    if (dsDGV.Tables[0].Rows[i]["MKT_NM"].ToString().Trim().Contains("Veerasak/Thitsuda"))
                //    {
                //        switch (dsDGV.Tables[0].Rows[i]["Month_NM"].ToString().Trim().ToUpper().Substring(0, 3))
                //        {
                //            case "JAN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "FEB":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "MAR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "APR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "MAY":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "JUN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "JUL":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18994000";
                //                break;
                //            case "AUG":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18994000";
                //                break;
                //            case "SEP":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18994000";
                //                break;
                //            case "OCT":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18994000";
                //                break;
                //            case "NOV":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;
                //            case "DEC":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "18993000";
                //                break;

                //            default:
                //                break;
                //        }
                //    }
                //    //***********************************

                //    // Sittikorn
                //    if (dsDGV.Tables[0].Rows[i]["MKT_NM"].ToString().Trim().Contains("Sitthikorn"))
                //    {
                //        switch (dsDGV.Tables[0].Rows[i]["Month_NM"].ToString().Trim().ToUpper().Substring(0, 3))
                //        {
                //            case "JAN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "12000000";
                //                break;
                //            case "FEB":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "12000000";
                //                break;
                //            case "MAR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "12500000";
                //                break;
                //            case "APR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "12500000";
                //                break;
                //            case "MAY":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "13000000";
                //                break;
                //            case "JUN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "13000000";
                //                break;
                //            case "JUL":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "13500000";
                //                break;
                //            case "AUG":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "13500000";
                //                break;
                //            case "SEP":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "13500000";
                //                break;
                //            case "OCT":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14000000";
                //                break;
                //            case "NOV":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14000000";
                //                break;
                //            case "DEC":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14000000";
                //                break;

                //            default:
                //                break;
                //        }
                //    }
                //    //***********************************

                //    // Mon
                //    if (dsDGV.Tables[0].Rows[i]["MKT_NM"].ToString().Trim().Contains("Monthita"))
                //    {
                //        switch (dsDGV.Tables[0].Rows[i]["Month_NM"].ToString().Trim().ToUpper().Substring(0, 3))
                //        {
                //            case "JAN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14800000";
                //                break;
                //            case "FEB":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14800000";
                //                break;
                //            case "MAR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14800000";
                //                break;
                //            case "APR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14800000";
                //                break;
                //            case "MAY":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14800000";
                //                break;
                //            case "JUN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "14800000";
                //                break;
                //            case "JUL":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "20000000";
                //                break;
                //            case "AUG":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "20000000";
                //                break;
                //            case "SEP":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "20200000";
                //                break;
                //            case "OCT":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "17000000";
                //                break;
                //            case "NOV":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "17000000";
                //                break;
                //            case "DEC":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "17000000";
                //                break;

                //            default:
                //                break;
                //        }
                //    }
                //    //***********************************

                //    // Rat/Panaya
                //    if (dsDGV.Tables[0].Rows[i]["MKT_NM"].ToString().Trim().Contains("Ratchaneewon/Panaya"))
                //    {
                //        switch (dsDGV.Tables[0].Rows[i]["Month_NM"].ToString().Trim().ToUpper().Substring(0, 3))
                //        {
                //            case "JAN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "25000000";
                //                break;
                //            case "FEB":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "25000000";
                //                break;
                //            case "MAR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "25000000";
                //                break;
                //            case "APR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "25000000";
                //                break;
                //            case "MAY":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "25000000";
                //                break;
                //            case "JUN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "25000000";
                //                break;
                //            case "JUL":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "31000000";
                //                break;
                //            case "AUG":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "32000000";
                //                break;
                //            case "SEP":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "32000000";
                //                break;
                //            case "OCT":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "30000000";
                //                break;
                //            case "NOV":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "30000000";
                //                break;
                //            case "DEC":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "30000000";
                //                break;

                //            default:
                //                break;
                //        }
                //    }
                //    //***********************************

                //    // Konwika
                //    if (dsDGV.Tables[0].Rows[i]["MKT_NM"].ToString().Trim().Contains("Konwika"))
                //    {
                //        switch (dsDGV.Tables[0].Rows[i]["Month_NM"].ToString().Trim().ToUpper().Substring(0, 3))
                //        {
                //            case "JAN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "FEB":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "MAR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "APR":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "MAY":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "JUN":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "JUL":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "AUG":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "SEP":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "OCT":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "4000000";
                //                break;
                //            case "NOV":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "5000000";
                //                break;
                //            case "DEC":
                //                dsDGV.Tables[0].Rows[i]["FORECAST"] = "5000000";
                //                break;

                //            default:
                //                break;
                //        }
                //    }
                    //***********************************
                //}
            }
            
            for (int i = 0; i < dsDGV.Tables[0].Rows.Count; i++)
            {
                dsDGV.Tables[0].Rows[i][0] = i + 1;
            }

            this.rgProd.DataSource = dsDGV.Tables[0];
            if (sType == 1)
            {
                this.rgProd.DataBind();
            }
        }
        protected void rgCost_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }

        protected void rgProd_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                         
                if (strCmp != dataItem["clnMKT_NM"].Text.Trim())
                {
                    dYTD = 0; dFore = 0; dAch = 0; dAchYTD = 0;
                    dataItem.Font.Bold = true;
                }
                strCmp = dataItem["clnMKT_NM"].Text.Trim();
                //YTD
                Label lblYTD = e.Item.FindControl("lblYTD") as Label;
                dYTD += double.Parse(dataItem["clnAMT"].Text.Trim());
                lblYTD.Text = dYTD.ToString("#,##0.00");

                //ForeYTD
                Label lblForeYTD = e.Item.FindControl("lblForeYTD") as Label;
                dFore += double.Parse(dataItem["clnFORECAST"].Text.Trim());
                lblForeYTD.Text = dFore.ToString("#,##0.00");

                //lblAchieve
                Label lblAchieve = e.Item.FindControl("lblAchieve") as Label;
                dAch = (double.Parse(dataItem["clnAMT"].Text.Trim()) / double.Parse(dataItem["clnFORECAST"].Text.Trim()));
                lblAchieve.Text = dAch.ToString("#,##0.00%");

                //lblAchieveYTD
                Label lblAchieveYTD = e.Item.FindControl("lblAchieveYTD") as Label;
                dAchYTD = (double.Parse(lblYTD.Text.Trim()) / double.Parse(lblForeYTD.Text.Trim()));
                lblAchieveYTD.Text = dAchYTD.ToString("#,##0.00%");
            }
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgProd.ExportSettings.ExportOnlyData = true;
            this.rgProd.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgProd.ExportSettings.IgnorePaging = true;

        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgProd.MasterTableView.ExportToExcel();
        }
        protected void rgProd_ExcelMLExportRowCreated(object sender, Telerik.Web.UI.GridExcelBuilder.GridExportExcelMLRowCreatedArgs e)
        {
            if (e.Worksheet.Table.Rows.Count == rgProd.Items.Count + 1)
            {
                RowElement row = new RowElement();
                GridFooterItem footer = (sender as RadGrid).MasterTableView.GetItems(GridItemType.Footer)[0] as GridFooterItem;
                foreach (GridColumn column in (sender as RadGrid).MasterTableView.Columns)
                {
                    CellElement cell = new CellElement();
                    string cellText = footer[column.UniqueName].Text;
                    cell.Data.DataItem = cellText == "&nbsp;" ? "" : cellText;
                    row.Cells.Add(cell);
                }
                e.Worksheet.Table.Rows.Add(row);
            }
        }
    }
}