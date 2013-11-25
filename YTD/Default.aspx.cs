using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Data.SqlClient;

public partial class Default : System.Web.UI.Page 
{
    NP_Cls NP = new NP_Cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DGV(1);
            DGVGroup();

            for (int i = 0; i < this.rgSG.Items.Count; i++)
            {
                 rgSG.MasterTableView.Items[i].Expanded = true;
            }
           
        }
    }

    private void DGVGroup()
    {
        this.rgSG.DataSource = NP.Execute("SELECT     TOP (100) PERCENT IT.dbo.APW_Category.CategoryCodeNew AS CATEGORY,                        IT.dbo.APW_Category.CategoryCodeNew + N':' + IT.dbo.APW_Category.CategoryDesc AS CATEDESC, SUM(vw_OE_PJC_UNION_SH_CN.AMT) AS NET FROM         vw_OE_PJC_UNION_SH_CN INNER JOIN                       IT.dbo.APW_Category ON vw_OE_PJC_UNION_SH_CN.CATEGORY = IT.dbo.APW_Category.CategoryCodeOri GROUP BY IT.dbo.APW_Category.CategoryCodeNew, IT.dbo.APW_Category.CategoryCodeNew + N':' + IT.dbo.APW_Category.CategoryDesc ORDER BY CATEGORY", ref NP_Cls.strErr).Tables[0];
            this.rgSG.DataBind();       
    }
    private void DGV(byte ty)
    {
        //this.RadNested.DataSource = NP.Execute("SELECT  ORDNUMBER, CATEGORY, CATEDESC, CUSTOMER, NAMECUST, NET, DATENAME(month, CAST(ORDDATE AS varchar)) AS Month FROM    vw_YTD_SO_Category_Step3  ORDER BY  ORDNUMBER", ref NP_Cls.strErr).Tables[0];
        this.RadNested.DataSource = NP.Execute("SELECT     TOP (100) PERCENT vw_OE_PJC_UNION_SH_CN.ORDNUMBER, IT.dbo.APW_Category.CategoryCodeNew AS CATEGORY,                        IT.dbo.APW_Category.CategoryDesc AS CATEDESC, PCASIA.dbo.OEORDH.CUSTOMER, PCASIA.dbo.ARCUS.NAMECUST, vw_OE_PJC_UNION_SH_CN.AMT AS NET,                        DATENAME(month, CAST(vw_OE_PJC_UNION_SH_CN.TRANDATE AS varchar)) AS Month FROM         vw_OE_PJC_UNION_SH_CN INNER JOIN                       IT.dbo.APW_Category ON vw_OE_PJC_UNION_SH_CN.CATEGORY = IT.dbo.APW_Category.CategoryCodeOri INNER JOIN                       PCASIA.dbo.OEORDH ON vw_OE_PJC_UNION_SH_CN.ORDNUMBER = PCASIA.dbo.OEORDH.ORDNUMBER INNER JOIN                       PCASIA.dbo.ARCUS ON PCASIA.dbo.OEORDH.CUSTOMER = PCASIA.dbo.ARCUS.IDCUST ORDER BY vw_OE_PJC_UNION_SH_CN.ORDNUMBER", ref NP_Cls.strErr).Tables[0];
        if (ty == 1)
        {
            this.RadNested.DataBind();
        }
    }

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        //if (e.Item is GridNestedViewItem)
        //{
        //    RadGrid rgNest = ((RadGrid)e.Item.FindControl("RadNested"));
        //    NP_Cls.sqlSelect = "SELECT  ORDNUMBER, CATEGORY, CATEDESC, CUSTOMER, NAMECUST, NET, DATENAME(month, CAST(ORDDATE AS varchar)) AS Month FROM    vw_YTD_SO_Category_Step3  WHERE (DATENAME(month, CAST(ORDDATE AS varchar)) = '" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["Month"].ToString() + "') ORDER BY CATEGORY, ORDNUMBER";
        //    rgNest.DataSource = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr).Tables[0];
        //    rgNest.DataBind();
        //}
    }
    private void ConfigureExport()
    {
        this.RadNested.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
        RadNested.ExportSettings.ExportOnlyData = true;
        this.RadNested.ExportSettings.Excel.Format = GridExcelExportFormat.ExcelML;
        RadNested.ExportSettings.IgnorePaging = true;
  

    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        ConfigureExport();
        this.RadNested.MasterTableView.ExportToExcel();
    }

    protected void RadNested_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        DGV(0);
    }
    private double dSumJan = 0; private double dSumFeb = 0; private double dSumMar = 0; private double dSumApr = 0; private double dSumMay = 0;
    private double dSumJun = 0; private double dSumJul = 0; private double dSumAug = 0; private double dSumSep = 0; private double dSumOct = 0;
    private double dSumNov = 0; private double dSumDec = 0; private double dSumAll = 0;
    protected void RadNested_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            switch (dataItem["clnMonth"].Text.Trim().ToUpper())
            {
                case "JANUARY":
                    dSumJan += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "FEBRUARY":
                    dSumFeb += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "MARCH":
                    dSumMar += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "APRIL":
                    dSumApr += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "MAY":
                    dSumMay += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "JUNE":
                    dSumJun += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "JULY":
                    dSumJul += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "AUGUST":
                    dSumAug += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "SEPTEMBER":
                    dSumSep += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "OCTOBER":
                    dSumOct += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "NOVEMBER":
                    dSumNov += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                case "DECEMBER":
                    dSumDec += double.Parse(dataItem["clnAmount"].Text.Trim());
                    break;
                default:
                    break;
            }
            dSumAll += double.Parse(dataItem["clnAmount"].Text.Trim());
            this.lblYTDJan.Text = dSumJan.ToString("0,0.00"); this.lblYTDFeb.Text = dSumFeb.ToString("0,0.00"); this.lblYTDMar.Text = dSumMar.ToString("0,0.00"); this.lblYTDApr.Text = dSumApr.ToString("0,0.00");
            this.lblYTDMay.Text = dSumMay.ToString("0,0.00"); this.lblYTDJun.Text = dSumJun.ToString("0,0.00"); this.lblYTDJul.Text = dSumJul.ToString("0,0.00"); this.lblYTDAug.Text = dSumAug.ToString("0,0.00");
            this.lblYTDSep.Text = dSumSep.ToString("0,0.00"); this.lblYTDOct.Text = dSumOct.ToString("0,0.00"); this.lblYTDNov.Text = dSumNov.ToString("0,0.00"); this.lblYTDDec.Text = dSumDec.ToString("0,0.00");
            this.lblTotal.Text = dSumAll.ToString("0,0.00");
        }
    }

    protected void rgSG_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridNestedViewItem)
        {
            RadGrid rgSale = ((RadGrid)e.Item.FindControl("rgSale"));
            //NP_Cls.sqlSelect = "SELECT     DATENAME(month, CAST(ORDDATE AS varchar)) AS Month, CATEGORY, SUM(NET) AS NET, LEFT(ORDDATE, 6) AS ORDDATE FROM         vw_YTD_SO_Category_Step3 WHERE     (CATEGORY = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["CATEGORY"].ToString() + "') GROUP BY DATENAME(month, CAST(ORDDATE AS varchar)), CATEGORY, LEFT(ORDDATE, 6) ORDER BY CATEGORY, ORDDATE ";
            NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT IT.dbo.m_TranMonth.MonthName AS MONTH, IT.dbo.m_TranMonth.CategoryCodeNew AS CATEGORY,                        SUM(ISNULL(vw_OE_PJC_UNION_SH_CN.AMT, 0)) AS NET, LEFT(vw_OE_PJC_UNION_SH_CN.TRANDATE, 6) AS ORDDATE FROM         vw_OE_PJC_UNION_SH_CN INNER JOIN                       IT.dbo.APW_Category ON vw_OE_PJC_UNION_SH_CN.CATEGORY = IT.dbo.APW_Category.CategoryCodeOri INNER JOIN                       PCASIA.dbo.OEORDH ON vw_OE_PJC_UNION_SH_CN.ORDNUMBER = PCASIA.dbo.OEORDH.ORDNUMBER RIGHT OUTER JOIN                       IT.dbo.m_TranMonth ON IT.dbo.APW_Category.CategoryCodeNew = IT.dbo.m_TranMonth.CategoryCodeNew AND DATENAME(month,                        CAST(vw_OE_PJC_UNION_SH_CN.TRANDATE AS VARCHAR)) = IT.dbo.m_TranMonth.MonthName WHERE     (IT.dbo.m_TranMonth.CategoryCodeNew = '" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["CATEGORY"].ToString() + "') GROUP BY IT.dbo.m_TranMonth.MonthName, IT.dbo.m_TranMonth.SortOrder, LEFT(vw_OE_PJC_UNION_SH_CN.TRANDATE, 6), IT.dbo.m_TranMonth.CategoryCodeNew ORDER BY IT.dbo.m_TranMonth.SortOrder, CATEGORY, ORDDATE";
            rgSale.DataSource = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr).Tables[0];
            rgSale.DataBind();
        }
    }
    protected void btmShow_Click(object sender, EventArgs e)
    {
        this.RadAjaxPanel1.Visible = !this.RadAjaxPanel1.Visible;
        this.btnExportExcel.Visible = this.RadAjaxPanel1.Visible;
    }

}
