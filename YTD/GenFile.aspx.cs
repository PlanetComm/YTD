using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.IO;
using System.Configuration;

namespace YTD
{
    public partial class GenFile : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV();
                DGVGroup();
                DGVWaiting();
                NP_Cls.iCurrentMonthNumber = int.Parse(NP.Execute("SELECT MONTH(GETDATE())", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString());

                Configuration myConfiguration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                myConfiguration.AppSettings.Settings["LastUpdateDATA"].Value = DateTime.Now.ToString("dd MMM yyyy hh:mm:ss tt");
                myConfiguration.Save();
            }
        }
        private void DGVGroup()
        {
            DataSet dsGroup = new DataSet();
            NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT ISNULL(SUM(vw_YTD_FOR_Market_ALL.NET), 0) AS NET, IT.dbo.APW_SalesGroupForecast.Forecast / 12 * CAST(MONTH(GETDATE()) AS int)                        AS ForecastYTD, IT.dbo.APW_SalesGroupForecast.Forecast, IT.dbo.APW_SaleseGroup.SalesGroupCode AS SG,                        IT.dbo.APW_SaleseGroup.SalesGroupName AS SGDESC FROM         IT.dbo.APW_SaleseGroup INNER JOIN                       IT.dbo.APW_SalesGroupForecast ON IT.dbo.APW_SaleseGroup.SalesGroupUNQ = IT.dbo.APW_SalesGroupForecast.SalesGroupUNQ LEFT OUTER JOIN                       vw_YTD_FOR_Market_ALL ON IT.dbo.APW_SaleseGroup.SalesGroupCode = vw_YTD_FOR_Market_ALL.SG WHERE     (vw_YTD_FOR_Market_ALL.STATUS <> '1') AND (IT.dbo.APW_SalesGroupForecast.TranYear = YEAR(GETDATE()))  GROUP BY IT.dbo.APW_SalesGroupForecast.Forecast / 12 * CAST(MONTH(GETDATE()) AS int), IT.dbo.APW_SalesGroupForecast.Forecast,                        IT.dbo.APW_SaleseGroup.SalesGroupCode, IT.dbo.APW_SaleseGroup.SalesGroupName ORDER BY SGDESC";
            dsGroup = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.rgSG.DataSource = dsGroup.Tables[0];
            this.rgSG.DataBind();
            dsGroup.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\GroupSch.xml");
            dsGroup.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Group.xml");
        }
        private void DGV()
        {
            DataSet dsDGV = new DataSet();
            NP_Cls.sqlSelect = "SELECT     ORDNUMBER, MonthN AS Month, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_ AS ORDDATE, SUM(NET)                       AS NET FROM         vw_YTD_FOR_Market_ALL GROUP BY ORDNUMBER, MonthN, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_";

            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            dsDGV.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGVSch.xml");
            dsDGV.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGV.xml");
        }
        private void DGVWaiting()
        {
            DataSet dsWait = new DataSet();
            NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT vw_YTD_SO_Market_Waiting.ORDNUMBER, DATENAME(month, CAST(vw_YTD_SO_Market_Waiting.TRANDATE AS varchar)) AS Month,                        vw_YTD_SO_Market_Waiting.SALEPERSON, vw_YTD_SO_Market_Waiting.SG, vw_YTD_SO_Market_Waiting.SGDESC,                        vw_YTD_SO_Market_Waiting.NET * OEORDH.ORRATE - ISNULL(DisDeposit.DisNet, 0) AS NET, vw_YTD_SO_Market_Waiting.CUSTOMER,                        vw_YTD_SO_Market_Waiting.NAMECUST, LEFT(vw_YTD_SO_Market_Waiting.TRANDATE, 6) AS ORDDATE FROM         vw_YTD_SO_Market_Waiting INNER JOIN                       OEORDH ON vw_YTD_SO_Market_Waiting.ORDNUMBER = OEORDH.ORDNUMBER LEFT OUTER JOIN                           (SELECT     SUM(OEORDD.EXTINVMISC) AS DisNet, OEORDH_1.ORDNUMBER                             FROM          OEORDD INNER JOIN                                                    OEORDH AS OEORDH_1 ON OEORDD.ORDUNIQ = OEORDH_1.ORDUNIQ                             WHERE      (RTRIM(OEORDD.ITEM) = '')                             GROUP BY OEORDH_1.ORDNUMBER) AS DisDeposit ON vw_YTD_SO_Market_Waiting.ORDNUMBER = DisDeposit.ORDNUMBER ORDER BY ORDDATE, vw_YTD_SO_Market_Waiting.ORDNUMBER";
                dsWait = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                dsWait.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\WaitingSch.xml");
                dsWait.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Waiting.xml");
        }
        protected void rgSale_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridNestedViewItem)
            {
                RadGrid rgMonth = ((RadGrid)e.Item.FindControl("rgMonth"));
                NP_Cls.sqlSelect = "SELECT  ForecastYTD, Forecast, IsHeadOfSector, Month, ORDDATE, SUM(NET) AS NET, SALEPERSON, SG, SGDESC FROM         vw_SO_YTD_SO_Market_SaleByMonth GROUP BY ForecastYTD, Forecast, IsHeadOfSector, Month, ORDDATE, SALEPERSON, SG, SGDESC HAVING (SALEPERSON = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + "') ORDER BY ORDDATE";
                DataSet dsT = new DataSet();
                DataSet dsMonth = new DataSet(); DataSet dsTmp = new DataSet();
                string strTmp = string.Empty; string strTmpFill = string.Empty;

                dsMonth = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                if (dsMonth.Tables[0].Rows.Count == 0)
                {                  
                    if (File.Exists(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml"))
                    {
                        dsT.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml");
                        dsT.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Month_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + ".xml");
                        rgMonth.DataSource = dsT.Tables[0];
                        rgMonth.DataBind();
                        return;
                    }
                }

                // Gen the month
                dsTmp = dsMonth.Copy();
                for (int m = 1; m <= 12; m++)
                {
                    strTmp = NP.RetMonthName(m);
                    for (int i = 0; i < dsTmp.Tables[0].Rows.Count; i++)
                    {
                        if ((strTmp.ToUpper() == dsTmp.Tables[0].Rows[i]["Month"].ToString().ToUpper()))
                        {
                            strTmpFill = string.Empty;
                            break;
                        }
                        else
                        {
                            strTmpFill = strTmp + ":" + m.ToString();
                        }
                    }

                    if (dsTmp.Tables[0].Rows.Count == 0)
                    {
                        strTmpFill = strTmp + ":" + m.ToString();
                    }

                    if (!string.IsNullOrEmpty(strTmpFill))
                    {
                        DataRow dr; dr = dsMonth.Tables[0].NewRow();
                        dr["Month"] = strTmpFill.Split(':')[0].ToString(); dr["SALEPERSON"] = dsMonth.Tables[0].Rows[0]["SALEPERSON"].ToString();
                        dr["NET"] = 0; dr["ORDDATE"] = int.Parse(DateTime.Now.Year.ToString(NP_Cls.cul) + (strTmpFill.Split(':')[1].ToString().Length < 2 ? "0" + strTmpFill.Split(':')[1].ToString() : strTmpFill.Split(':')[1].ToString()));
                        dr["Forecast"] = double.Parse(dsMonth.Tables[0].Rows[0]["Forecast"].ToString());
                        dsMonth.Tables[0].Rows.Add(dr);
                        dsMonth.AcceptChanges();
                    }
                }           

                DataSet dsH = new DataSet();
                for (int mm = 0; mm < dsMonth.Tables[0].Rows.Count; mm++)
                {
                    dsH = NP.Execute("SELECT     TOP (100) PERCENT SUM(vw_YTD_FOR_Market_ALL.NET) AS NET, vw_YTD_FOR_Market_ALL.MonthN AS [Month], vw_YTD_FOR_Market_ALL.SG,                        GetHEAD.SalesPersonFirstName AS Head FROM         vw_YTD_FOR_Market_ALL INNER JOIN                           (SELECT     IT.dbo.APW_SaleseGroup.SalesGroupCode, IT.dbo.APW_SalesPerson.SalesPersonFirstName                             FROM          IT.dbo.APW_SaleseGroup INNER JOIN                                                    IT.dbo.APW_SalesPerson ON IT.dbo.APW_SaleseGroup.SalesGroupUNQ = IT.dbo.APW_SalesPerson.SalesGroupUNQ                             WHERE      (IT.dbo.APW_SalesPerson.IsHeadOfSector = N'1')) AS GetHEAD ON vw_YTD_FOR_Market_ALL.SG = GetHEAD.SalesGroupCode WHERE     (vw_YTD_FOR_Market_ALL.MonthN = N'" + dsMonth.Tables[0].Rows[mm]["Month"].ToString() + "') AND (GetHEAD.SalesPersonFirstName = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + "') AND (LEFT(ISNULL(LEFT(vw_YTD_FOR_Market_ALL.ORDDATE_, 6), CONVERT(nvarchar,GETDATE(),112)),4) = YEAR(GETDATE())) GROUP BY vw_YTD_FOR_Market_ALL.MonthN, LEFT(vw_YTD_FOR_Market_ALL.ORDDATE_, 6), vw_YTD_FOR_Market_ALL.SG, GetHEAD.SalesPersonFirstName ORDER BY LEFT(vw_YTD_FOR_Market_ALL.ORDDATE_, 6)", ref NP_Cls.strErr);
                    if (dsH.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < dsH.Tables[0].Rows.Count; i++)
                        {
                            if ((dsMonth.Tables[0].Rows[mm]["SALEPERSON"].ToString() == dsH.Tables[0].Rows[i]["Head"].ToString()) && (dsMonth.Tables[0].Rows[mm]["Month"].ToString() == dsH.Tables[0].Rows[i]["Month"].ToString()))
                            {
                                dsMonth.Tables[0].Rows[mm]["NET"] = dsH.Tables[0].Rows[i]["NET"].ToString();
                            }
                        }
                    }
                }

                dsMonth.AcceptChanges();

                // **
                for (int fr = 0; fr < dsMonth.Tables[0].Rows.Count; fr++)
                {
                    if (dsMonth.Tables[0].Rows[fr]["SALEPERSON"].ToString().Trim().Contains("Phuwadol"))
                    {
                        switch (dsMonth.Tables[0].Rows[fr]["Month"].ToString().Trim().ToUpper())
                        {
                            case "OCTOBER":
                            case "NOVEMBER":
                            case "DECEMBER":
                                dsMonth.Tables[0].Rows[fr]["ForecastYTD"] = dsMonth.Tables[0].Rows[fr]["ForecastYTD"]; 
                                dsMonth.Tables[0].Rows[fr]["Forecast"] = "2866666";//(string.IsNullOrEmpty(dsMonth.Tables[0].Rows[fr]["Forecast"].ToString().Trim()) ? "2166666" : dsMonth.Tables[0].Rows[fr]["Forecast"]);
                                break;
                            default:
                                dsMonth.Tables[0].Rows[fr]["ForecastYTD"] = "1";
                                dsMonth.Tables[0].Rows[fr]["Forecast"] = "1";
                                break;
                        }
                    }
                }
                //***

                DataView dv = new DataView();
                dv.Table = dsMonth.Tables[0];
                dv.Sort = "SALEPERSON, ORDDATE";
                rgMonth.DataSource = dv.ToTable();
                rgMonth.DataBind();

                dsT.Tables.Add(dv.ToTable());
                dsT.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml");
                dsT.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Month_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + ".xml");

            }
        }
        protected void rgSG_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridNestedViewItem)
            {
                RadGrid rgSale = ((RadGrid)e.Item.FindControl("rgSale"));
                DataSet dsSale = new DataSet();
                NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT IT.dbo.APW_SalesPerson.SalesPersonForecast / 12 * CAST(MONTH(GETDATE()) AS int) AS ForecastYTD,                        IT.dbo.APW_SalesPerson.SalesPersonForecast AS Forecast, IT.dbo.APW_SalesPerson.IsHeadOfSector, SUM(ISNULL(vw_YTD_FOR_Market_ALL.NET,                        0)) AS NET, IT.dbo.APW_SalesPerson.SalesPersonFirstName AS SALEPERSON, IT.dbo.APW_SaleseGroup.SalesGroupCode AS SG,                        IT.dbo.APW_SaleseGroup.SalesGroupName AS SGDESC FROM         IT.dbo.APW_SalesPersonForecast RIGHT OUTER JOIN                       IT.dbo.APW_SalesPerson ON IT.dbo.APW_SalesPersonForecast.SalesPersonUNQ = IT.dbo.APW_SalesPerson.SalesPersonUNQ LEFT OUTER JOIN                       IT.dbo.APW_SaleseGroup ON IT.dbo.APW_SalesPerson.SalesGroupUNQ = IT.dbo.APW_SaleseGroup.SalesGroupUNQ LEFT OUTER JOIN                       vw_YTD_FOR_Market_ALL ON IT.dbo.APW_SalesPerson.SalesPersonFirstNameOld = vw_YTD_FOR_Market_ALL.SALEPERSON WHERE     (ISNULL(vw_YTD_FOR_Market_ALL.STATUS, 0) <> '1') AND (RIGHT(vw_YTD_FOR_Market_ALL.EFFECTIVEDATE, 4) = YEAR(GETDATE())) OR                       (ISNULL(vw_YTD_FOR_Market_ALL.STATUS, 0) <> '1') AND (vw_YTD_FOR_Market_ALL.EFFECTIVEDATE IS NULL) GROUP BY IT.dbo.APW_SalesPerson.SalesPersonForecast / 12 * CAST(MONTH(GETDATE()) AS int), IT.dbo.APW_SalesPerson.SalesPersonForecast,                        IT.dbo.APW_SalesPerson.IsHeadOfSector, IT.dbo.APW_SalesPerson.SalesPersonFirstName, IT.dbo.APW_SaleseGroup.SalesGroupCode,                        IT.dbo.APW_SaleseGroup.SalesGroupName HAVING      (NOT (IT.dbo.APW_SalesPerson.SalesPersonFirstName IS NULL)) AND (IT.dbo.APW_SaleseGroup.SalesGroupCode = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + "')  OR                       (NOT (IT.dbo.APW_SalesPerson.SalesPersonFirstName IS NULL)) AND (IT.dbo.APW_SaleseGroup.SalesGroupCode = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + "')    ORDER BY SG, IT.dbo.APW_SalesPerson.IsHeadOfSector DESC ";
                dsSale = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                for (int fr = 0; fr < dsSale.Tables[0].Rows.Count; fr++)
                {
                    if (dsSale.Tables[0].Rows[fr]["SALEPERSON"].ToString().Trim().Contains("Phuwadol"))
                    {
                        dsSale.Tables[0].Rows[fr]["ForecastYTD"] = "2866666";
                        dsSale.Tables[0].Rows[fr]["Forecast"] = "8600000";
                    }
                }
                DataSet dsH = new DataSet();
                dsH = NP.Execute("SELECT     SalesGroupCode, SalesPersonFirstName, NET FROM  vw_YTD_HEAD_NET WHERE     (SalesGroupCode = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + "')", ref NP_Cls.strErr);
                if (dsH.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < dsSale.Tables[0].Rows.Count; i++)
                    {
                        if (dsSale.Tables[0].Rows[i]["IsHeadOfSector"].ToString() == "1")
                        {
                            dsSale.Tables[0].Rows[i]["NET"] = dsH.Tables[0].Rows[0]["NET"].ToString();
                        }
                    }
                }
                dsSale.AcceptChanges();

                rgSale.DataSource = dsSale.Tables[0];
                rgSale.DataBind();
                dsSale.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\SaleSch.xml");
                dsSale.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Sale_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + ".xml");
            }
        }
    }
}