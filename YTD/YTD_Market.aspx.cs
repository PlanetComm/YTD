using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Globalization;
using System.Configuration;
using System.Net;
using System.IO;

namespace YTD
{
    public partial class YTD_Market : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); private double dSumTmp = 0.00;
        
        private string sUpdateDATA = ConfigurationSettings.AppSettings["UpdateDATA"].ToString();
        private string sLastUpdateDATA = ConfigurationSettings.AppSettings["LastUpdateDATA"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            string clientMachineName;
                       
            try
            {
                clientMachineName = (Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName);
            }
            catch
            {
                clientMachineName = Request.ServerVariables["remote_addr"];
            }

            //clientMachineName = (Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName);
            this.lblUser.Text = "Current User : " + clientMachineName.ToString();
            if (clientMachineName.Trim().ToUpper().Contains("ANEAK") ||
                    clientMachineName.Trim().ToUpper().Contains("THANNAPAN") ||
                    clientMachineName.Trim().ToUpper().Contains("73.117"))
            {
                this.btnUpdate.Visible = true;
            }
            else
            {
                this.btnUpdate.Visible = false;
            }

            if (!IsPostBack)
            {

                this.lblLastUpdate.Text = "<b>Last Updated</b> :: " + sLastUpdateDATA.ToString();
                DGV();
                DGVGroup();
                DGVWaiting();

                NP_Cls.iCurrentMonthNumber = int.Parse(NP.Execute("SELECT MONTH(GETDATE())", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString());

                for (int i = 0; i < this.rgSG.Items.Count; i++)
                {
                    rgSG.MasterTableView.Items[i].Expanded = true;
                    for (int ii = 0; ii < (this.rgSG.MasterTableView.Items[i].ChildItem.FindControl("rgSale") as RadGrid).Items.Count; ii++)
                    {
                        (this.rgSG.MasterTableView.Items[i].ChildItem.FindControl("rgSale") as RadGrid).Items[ii].Expanded = true;
                    }
                }

                // Intial YTD
                NP_Cls.sqlSelect = "SELECT     '' AS MONTHLY, 0.00 AS [SOMonth], 0.00 AS [SOForecast], '' AS [SOAchieve], 0.00 AS [SOYTD], 0.00 AS [ForecastYTD], '' AS [YTDAchieve]";
                DataSet dsYTD = new DataSet();
                dsYTD = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                if (dsYTD.Tables[0].Rows.Count > 0) { dsYTD.Tables[0].Rows.Clear(); }

                DataRow drY; double dMonthlyForecast = NP_Cls.dYearForecast / 12;

                double ForcastYTD = 0.0; // Thannapan 2013 Edited 

                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "JANUARY"; //Monthly
                drY[1] = dSumJan; //SO-Month
                dMonthlyForecast = 67000000;  // Thannapan for 2013 Edited ==> Jun

                drY[2] = dMonthlyForecast; //dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumJan * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumJan; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumJan * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "FEBRUARY"; //Monthly
                drY[1] = dSumFeb; //SO-Month
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumFeb * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast);//Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "MARCH"; //Monthly
                drY[1] = dSumMar; //SO-Month
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumMar * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "APRIL"; //Monthly
                drY[1] = dSumApr; //SO-Month
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumApr * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "MAY"; //Monthly
                drY[1] = dSumMay; //SO-Month
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumMay * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "JUNE"; //Monthly
                drY[1] = dSumJun; //SO-Month
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumJun * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "JULY"; //Monthly
                drY[1] = dSumJul; //SO-Month
                dMonthlyForecast = 77000000;  // Thannapan for 2013 Edited ==> July
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumJul * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul + dSumAug;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "AUGUST"; //Monthly
                drY[1] = dSumAug; //SO-Month
                dMonthlyForecast = 75500000;  // Thannapan for 2013 Edited ==> Aug
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumAug * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul + dSumAug + dSumSep;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "SEPTEMBER"; //Monthly
                drY[1] = dSumSep; //SO-Month
                //dMonthlyForecast = 91800000;  // Thannapan for 2013 Edited ==> Sep
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumSep * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul + dSumAug + dSumSep + dSumOct;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "OCTOBER"; //Monthly
                drY[1] = dSumOct; //SO-Month
                dMonthlyForecast = 87600000;  // Thannapan for 2013 Edited ==> Oct
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumOct * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul + dSumAug + dSumSep + dSumOct + dSumNov;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "NOVEMBER"; //Monthly
                drY[1] = dSumNov; //SO-Month
                dMonthlyForecast = 90600000;  // Thannapan for 2013 Edited ==> Nov
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumNov * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul + dSumAug + dSumSep + dSumOct + dSumNov + dSumDec;
                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "DECEMBER"; //Monthly
                drY[1] = dSumDec; //SO-Month
                dMonthlyForecast = 91800000;  // Thannapan for 2013 Edited ==> Dec
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumDec * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                dsYTD.AcceptChanges();
                this.rgSummary.DataSource = dsYTD.Tables[0];
                this.rgSummary.DataBind();

                // End of Update ..
                Configuration myConfiguration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                if (myConfiguration.AppSettings.Settings["UpdateDATA"].Value.ToString() == "1")
                {
                    myConfiguration.AppSettings.Settings["UpdateDATA"].Value = "0";
                    myConfiguration.AppSettings.Settings["LastUpdateDATA"].Value = DateTime.Now.ToString("dd MMM yyyy hh:mm:ss tt");
                    myConfiguration.Save();

                    sUpdateDATA = "0";

                    this.sLastUpdateDATA = DateTime.Now.ToString("dd MMM yyyy h:m:s tt");
                    this.lblLastUpdate.Text = "<b>Last Updated</b> :: " + sLastUpdateDATA.ToString();
                }

            }
        }

        private void DGVWaiting()
        { 
            DataSet dsWait = new DataSet();
            NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT vw_YTD_SO_Market_Waiting.ORDNUMBER, DATENAME(month, CAST(vw_YTD_SO_Market_Waiting.TRANDATE AS varchar)) AS Month,                        vw_YTD_SO_Market_Waiting.SALEPERSON, vw_YTD_SO_Market_Waiting.SG, vw_YTD_SO_Market_Waiting.SGDESC,                        vw_YTD_SO_Market_Waiting.NET * OEORDH.ORRATE - ISNULL(DisDeposit.DisNet, 0) AS NET, vw_YTD_SO_Market_Waiting.CUSTOMER,                        vw_YTD_SO_Market_Waiting.NAMECUST, LEFT(vw_YTD_SO_Market_Waiting.TRANDATE, 6) AS ORDDATE FROM         vw_YTD_SO_Market_Waiting INNER JOIN                       OEORDH ON vw_YTD_SO_Market_Waiting.ORDNUMBER = OEORDH.ORDNUMBER LEFT OUTER JOIN                           (SELECT     SUM(OEORDD.EXTINVMISC) AS DisNet, OEORDH_1.ORDNUMBER                             FROM          OEORDD INNER JOIN                                                    OEORDH AS OEORDH_1 ON OEORDD.ORDUNIQ = OEORDH_1.ORDUNIQ                             WHERE      (RTRIM(OEORDD.ITEM) = '')                             GROUP BY OEORDH_1.ORDNUMBER) AS DisDeposit ON vw_YTD_SO_Market_Waiting.ORDNUMBER = DisDeposit.ORDNUMBER ORDER BY ORDDATE, vw_YTD_SO_Market_Waiting.ORDNUMBER";
            if (sUpdateDATA == "1")
            {
                dsWait = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                this.rgWait.DataSource = dsWait.Tables[0];
                this.rgWait.DataBind();
                dsWait.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\WaitingSch.xml");
                dsWait.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Waiting.xml");
            }
            else
            {
                dsWait.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\WaitingSch.xml");
                dsWait.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Waiting.xml");
                this.rgWait.DataSource = dsWait.Tables[0];
                this.rgWait.DataBind();
            }
        }
        private void DGVGroup()
        {
            DataSet dsGroup = new DataSet();
            if (sUpdateDATA == "1")
            {
                NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT ISNULL(SUM(vw_YTD_FOR_Market_ALL_S.NET), 0) AS NET, IT.dbo.APW_SalesGroupForecast.Forecast / 12 * CAST(MONTH(GETDATE()) AS int)                        AS ForecastYTD, IT.dbo.APW_SalesGroupForecast.Forecast, IT.dbo.APW_SaleseGroup.SalesGroupCode AS SG,                        IT.dbo.APW_SaleseGroup.SalesGroupName AS SGDESC FROM         IT.dbo.APW_SaleseGroup INNER JOIN                       IT.dbo.APW_SalesGroupForecast ON IT.dbo.APW_SaleseGroup.SalesGroupUNQ = IT.dbo.APW_SalesGroupForecast.SalesGroupUNQ LEFT OUTER JOIN                       vw_YTD_FOR_Market_ALL_S ON IT.dbo.APW_SaleseGroup.SalesGroupCode = vw_YTD_FOR_Market_ALL_S.SG WHERE     (vw_YTD_FOR_Market_ALL_S.STATUS <> '1') AND (IT.dbo.APW_SalesGroupForecast.TranYear = YEAR(GETDATE()))  GROUP BY IT.dbo.APW_SalesGroupForecast.Forecast / 12 * CAST(MONTH(GETDATE()) AS int), IT.dbo.APW_SalesGroupForecast.Forecast,                        IT.dbo.APW_SaleseGroup.SalesGroupCode, IT.dbo.APW_SaleseGroup.SalesGroupName ORDER BY SGDESC";
                dsGroup = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                this.rgSG.DataSource = dsGroup.Tables[0];
                this.rgSG.DataBind();
                dsGroup.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\GroupSch.xml");
                dsGroup.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Group.xml");
            }
            else
            {
                dsGroup.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\GroupSch.xml");
                dsGroup.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Group.xml");
             
                this.rgSG.DataSource = dsGroup.Tables[0];
                this.rgSG.DataBind();
            }
        }
        private void DGV()
        {  
            DataSet dsDGV = new DataSet();
            if (sUpdateDATA == "1")
            {
                NP_Cls.sqlSelect = "SELECT     ORDNUMBER, MonthN AS Month, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_ AS ORDDATE, SUM(NET)                       AS NET FROM         vw_YTD_FOR_Market_ALL_S GROUP BY ORDNUMBER, MonthN, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_";
              
                dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                this.RadNested.DataSource = dsDGV.Tables[0];
                this.RadNested.DataBind();
                dsDGV.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGVSch.xml");
                dsDGV.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGV.xml");
            }
            else
            {
                dsDGV.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGVSch.xml");
                dsDGV.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGV.xml");
                this.RadNested.DataSource = dsDGV.Tables[0];
                this.RadNested.DataBind();
            }
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
    
        private double dSumJan = 0; private double dSumFeb = 0; private double dSumMar = 0; private double dSumApr = 0; private double dSumMay = 0;
        private double dSumJun = 0; private double dSumJul = 0; private double dSumAug = 0; private double dSumSep = 0; private double dSumOct = 0;
        private double dSumNov = 0; private double dSumDec = 0; private double dSumAll = 0;
        protected void RadNested_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                if (this.RadNested.Items.Count > 0)
                {
                    switch (dataItem["clnSO"].Text.Trim().Substring(4, 2))
                    {
                        case "JANUARY":
                        case "01":
                            if (dataItem.ItemIndex == 1) { dSumJan = double.Parse(this.RadNested.Items[dataItem.ItemIndex - 1]["clnAmount"].Text.Trim()); }
                            dSumJan += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "FEBRUARY":
                        case "02":
                            dSumFeb += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "MARCH":
                        case "03":
                            dSumMar += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "APRIL":
                        case "04":
                            dSumApr += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "MAY":
                        case "05":
                            dSumMay += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "JUNE":
                        case "06":
                            dSumJun += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "JULY":
                        case "07":
                            dSumJul += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "AUGUST":
                        case "08":
                            dSumAug += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "SEPTEMBER":
                        case "09":
                            dSumSep += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "OCTOBER":
                        case "10":
                            dSumOct += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "NOVEMBER":
                        case "11":
                            dSumNov += double.Parse(dataItem["clnAmount"].Text.Trim());
                            break;
                        case "DECEMBER":
                        case "12":
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
        }

        protected void rgSG_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridNestedViewItem)
            {
                RadGrid rgSale = ((RadGrid)e.Item.FindControl("rgSale"));  
                DataSet dsSale = new DataSet();
                if (sUpdateDATA == "1")
                {
                    NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT IT.dbo.APW_SalesPerson.SalesPersonForecast / 12 * CAST(MONTH(GETDATE()) AS int) AS ForecastYTD,                        IT.dbo.APW_SalesPerson.SalesPersonForecast AS Forecast, IT.dbo.APW_SalesPerson.IsHeadOfSector, SUM(ISNULL(vw_YTD_FOR_Market_ALL_S.NET,                        0)) AS NET, IT.dbo.APW_SalesPerson.SalesPersonFirstName AS SALEPERSON, IT.dbo.APW_SaleseGroup.SalesGroupCode AS SG,                        IT.dbo.APW_SaleseGroup.SalesGroupName AS SGDESC FROM         IT.dbo.APW_SalesPersonForecast RIGHT OUTER JOIN                       IT.dbo.APW_SalesPerson ON IT.dbo.APW_SalesPersonForecast.SalesPersonUNQ = IT.dbo.APW_SalesPerson.SalesPersonUNQ LEFT OUTER JOIN                       IT.dbo.APW_SaleseGroup ON IT.dbo.APW_SalesPerson.SalesGroupUNQ = IT.dbo.APW_SaleseGroup.SalesGroupUNQ LEFT OUTER JOIN                       vw_YTD_FOR_Market_ALL_S ON IT.dbo.APW_SalesPerson.SalesPersonFirstNameOld = vw_YTD_FOR_Market_ALL_S.SALEPERSON WHERE     (ISNULL(vw_YTD_FOR_Market_ALL_S.STATUS, 0) <> '1') AND (RIGHT(vw_YTD_FOR_Market_ALL_S.EFFECTIVEDATE, 4) = YEAR(GETDATE())) OR                       (ISNULL(vw_YTD_FOR_Market_ALL_S.STATUS, 0) <> '1') AND (vw_YTD_FOR_Market_ALL_S.EFFECTIVEDATE IS NULL) GROUP BY IT.dbo.APW_SalesPerson.SalesPersonForecast / 12 * CAST(MONTH(GETDATE()) AS int), IT.dbo.APW_SalesPerson.SalesPersonForecast,                        IT.dbo.APW_SalesPerson.IsHeadOfSector, IT.dbo.APW_SalesPerson.SalesPersonFirstName, IT.dbo.APW_SaleseGroup.SalesGroupCode,                        IT.dbo.APW_SaleseGroup.SalesGroupName HAVING      (NOT (IT.dbo.APW_SalesPerson.SalesPersonFirstName IS NULL)) AND (IT.dbo.APW_SaleseGroup.SalesGroupCode = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + "')  OR                       (NOT (IT.dbo.APW_SalesPerson.SalesPersonFirstName IS NULL)) AND (IT.dbo.APW_SaleseGroup.SalesGroupCode = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + "')    ORDER BY SG, IT.dbo.APW_SalesPerson.IsHeadOfSector DESC ";
                    dsSale = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);

                    DataSet dsH = new DataSet();
                    dsH = NP.Execute("SELECT     SalesGroupCode, SalesPersonFirstName, NET FROM  vw_YTD_HEAD_NET WHERE     (SalesGroupCode = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + "')", ref NP_Cls.strErr);
                    if (dsH.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < dsSale.Tables[0].Rows.Count ; i++)
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
                else
                {
                    dsSale.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\SaleSch.xml");
                    dsSale.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Sale_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SG"].ToString() + ".xml");
                    rgSale.DataSource = dsSale.Tables[0];
                    rgSale.DataBind();
                }
            }
        }
        protected void rgSale_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridNestedViewItem)
            {
                RadGrid rgMonth = ((RadGrid)e.Item.FindControl("rgMonth"));
                //NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT DATENAME(month, CAST(OEORDH.ORDDATE AS varchar)) AS Month, vw_YTD_SO_Market_Step2.SALEPERSON,                       CASE ISNULL(GetHeaderNET.HeaderNET, 0) WHEN 0 THEN SUM(vw_YTD_SO_Market_Step2.NET * OEORDH.ORRATE) ELSE ISNULL(GetHeaderNET.HeaderNET, 0)                       END AS NET, LEFT(OEORDH.ORDDATE, 6) AS ORDDATE, IT.dbo.APW_SalesPersonForecast.Forecast / 12 AS Forecast FROM         vw_YTD_SO_Market_Step2 INNER JOIN                       OEORDH ON vw_YTD_SO_Market_Step2.ORDNUMBER = OEORDH.ORDNUMBER INNER JOIN                       IT.dbo.APW_SalesPerson ON vw_YTD_SO_Market_Step2.SALEPERSON = IT.dbo.APW_SalesPerson.SalesPersonFirstNameOld INNER JOIN                       IT.dbo.APW_SalesPersonForecast ON IT.dbo.APW_SalesPerson.SalesPersonUNQ = IT.dbo.APW_SalesPersonForecast.SalesPersonUNQ LEFT OUTER JOIN                           (SELECT     TOP (100) PERCENT DATENAME(month, CAST(OEORDH_1.ORDDATE AS varchar)) AS HeaderMonth,                                                    SUM(vw_YTD_SO_Market_Step2_1.NET * OEORDH_1.ORRATE) AS HeaderNET, vw_YTD_SO_Market_Step2_1.SG,                                                    GetHeader.SalesPersonFirstNameOld                            FROM          vw_YTD_SO_Market_Step2 AS vw_YTD_SO_Market_Step2_1 INNER JOIN                                                   OEORDH AS OEORDH_1 ON vw_YTD_SO_Market_Step2_1.ORDNUMBER = OEORDH_1.ORDNUMBER INNER JOIN                                                       (SELECT     TOP (100) PERCENT IT.dbo.APW_SaleseGroup.SalesGroupCode, APW_SalesPerson_1.SalesPersonFirstNameOld                                                          FROM          IT.dbo.APW_SalesPerson AS APW_SalesPerson_1 INNER JOIN                                                                                IT.dbo.APW_SaleseGroup ON APW_SalesPerson_1.SalesGroupUNQ = IT.dbo.APW_SaleseGroup.SalesGroupUNQ                                                         WHERE      (APW_SalesPerson_1.IsHeadOfSector = N'1')                                                         ORDER BY IT.dbo.APW_SaleseGroup.SalesGroupCode) AS GetHeader ON vw_YTD_SO_Market_Step2_1.SG = GetHeader.SalesGroupCode                            WHERE      (NOT (vw_YTD_SO_Market_Step2_1.SALEPERSON IS NULL))                            GROUP BY DATENAME(month, CAST(OEORDH_1.ORDDATE AS varchar)), vw_YTD_SO_Market_Step2_1.SG, LEFT(OEORDH_1.ORDDATE, 6),                                                    GetHeader.SalesPersonFirstNameOld                            ORDER BY vw_YTD_SO_Market_Step2_1.SG, LEFT(OEORDH_1.ORDDATE, 6)) AS GetHeaderNET ON DATENAME(month, CAST(OEORDH.ORDDATE AS varchar))                       = GetHeaderNET.HeaderMonth AND vw_YTD_SO_Market_Step2.SALEPERSON = GetHeaderNET.SalesPersonFirstNameOld WHERE     (NOT (vw_YTD_SO_Market_Step2.SALEPERSON IS NULL)) AND (vw_YTD_SO_Market_Step2.SALEPERSON = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + "') GROUP BY DATENAME(month, CAST(OEORDH.ORDDATE AS varchar)), vw_YTD_SO_Market_Step2.SALEPERSON, LEFT(OEORDH.ORDDATE, 6),                       IT.dbo.APW_SalesPersonForecast.Forecast, GetHeaderNET.HeaderNET ORDER BY vw_YTD_SO_Market_Step2.SALEPERSON, ORDDATE ";
                DataSet dsT = new DataSet();
                if (sUpdateDATA == "1")
                {
                    //NP_Cls.sqlSelect = "SELECT     TOP (100) PERCENT IT.dbo.APW_SalesPersonForecast.Forecast / 12 * CAST(MONTH(GETDATE()) AS int) AS ForecastYTD,                        IT.dbo.APW_SalesPersonForecast.Forecast / 12 AS Forecast, IT.dbo.APW_SalesPerson.IsHeadOfSector, ISNULL(vw_YTD_FOR_Market_ALL.Month,DATENAME(month,GETDATE())) AS Month,                       ISNULL(LEFT(vw_YTD_FOR_Market_ALL.ORDDATE_, 6), CONVERT(nvarchar,GETDATE(),112)) AS ORDDATE, SUM(ISNULL(vw_YTD_FOR_Market_ALL.NET, 0)) AS NET,                        IT.dbo.APW_SalesPerson.SalesPersonFirstName AS SALEPERSON, IT.dbo.APW_SaleseGroup.SalesGroupCode AS SG,                        IT.dbo.APW_SaleseGroup.SalesGroupName AS SGDESC FROM         IT.dbo.APW_SalesPersonForecast INNER JOIN                       IT.dbo.APW_SalesPerson ON IT.dbo.APW_SalesPersonForecast.SalesPersonUNQ = IT.dbo.APW_SalesPerson.SalesPersonUNQ INNER JOIN                       IT.dbo.APW_SaleseGroup ON IT.dbo.APW_SalesPerson.SalesGroupUNQ = IT.dbo.APW_SaleseGroup.SalesGroupUNQ LEFT OUTER JOIN                       vw_YTD_FOR_Market_ALL ON IT.dbo.APW_SalesPerson.SalesPersonFirstName = vw_YTD_FOR_Market_ALL.SALEPERSON GROUP BY IT.dbo.APW_SalesPersonForecast.Forecast / 12 * CAST(MONTH(GETDATE()) AS int), IT.dbo.APW_SalesPersonForecast.Forecast / 12,                        IT.dbo.APW_SalesPerson.IsHeadOfSector, vw_YTD_FOR_Market_ALL.Month, LEFT(vw_YTD_FOR_Market_ALL.ORDDATE_, 6),                        IT.dbo.APW_SalesPerson.SalesPersonFirstName, IT.dbo.APW_SaleseGroup.SalesGroupCode, IT.dbo.APW_SaleseGroup.SalesGroupName HAVING      (IT.dbo.APW_SalesPerson.SalesPersonFirstName = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + "')  AND (LEFT(ISNULL(LEFT(vw_YTD_FOR_Market_ALL.ORDDATE_, 6), CONVERT(nvarchar, GETDATE(),112)),4) = YEAR(GETDATE())) ORDER BY SGDESC, ORDDATE";

                    NP_Cls.sqlSelect = "SELECT  ForecastYTD, Forecast, IsHeadOfSector, Month, ORDDATE, SUM(NET) AS NET, SALEPERSON, SG, SGDESC FROM         vw_SO_YTD_SO_Market_SaleByMonth GROUP BY ForecastYTD, Forecast, IsHeadOfSector, Month, ORDDATE, SALEPERSON, SG, SGDESC HAVING (SALEPERSON = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + "') ORDER BY ORDDATE";

                    DataSet dsMonth = new DataSet(); DataSet dsTmp = new DataSet();
                    string strTmp = string.Empty; string strTmpFill = string.Empty;

                    dsMonth = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                    if (dsMonth.Tables[0].Rows.Count == 0)
                    {
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
                                        dsMonth.Tables[0].Rows[fr]["Forecast"] = dsMonth.Tables[0].Rows[fr]["ForecastYTD"];
                                        break;
                                    default:
                                        dsMonth.Tables[0].Rows[fr]["ForecastYTD"] = "0";
                                        dsMonth.Tables[0].Rows[fr]["Forecast"] = "0";
                                        break;
                                }
                            }
                        }
                        if (File.Exists(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml"))
                        {
                            dsT.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml");
                            dsT.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Month_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + ".xml");
                            rgMonth.DataSource = dsT.Tables[0];
                            rgMonth.DataBind();
                            return;
                        }
                    }
               
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
                        dsH = NP.Execute("SELECT     TOP (100) PERCENT SUM(vw_YTD_FOR_Market_ALL_S.NET) AS NET, vw_YTD_FOR_Market_ALL_S.MonthN AS [Month], vw_YTD_FOR_Market_ALL_S.SG,                        GetHEAD.SalesPersonFirstName AS Head FROM         vw_YTD_FOR_Market_ALL_S INNER JOIN                           (SELECT     IT.dbo.APW_SaleseGroup.SalesGroupCode, IT.dbo.APW_SalesPerson.SalesPersonFirstName                             FROM          IT.dbo.APW_SaleseGroup INNER JOIN                                                    IT.dbo.APW_SalesPerson ON IT.dbo.APW_SaleseGroup.SalesGroupUNQ = IT.dbo.APW_SalesPerson.SalesGroupUNQ                             WHERE      (IT.dbo.APW_SalesPerson.IsHeadOfSector = N'1')) AS GetHEAD ON vw_YTD_FOR_Market_ALL_S.SG = GetHEAD.SalesGroupCode WHERE     (vw_YTD_FOR_Market_ALL_S.MonthN = N'" + dsMonth.Tables[0].Rows[mm]["Month"].ToString() + "') AND (GetHEAD.SalesPersonFirstName = N'" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + "') AND (LEFT(ISNULL(LEFT(vw_YTD_FOR_Market_ALL_S.ORDDATE_, 6), CONVERT(nvarchar,GETDATE(),112)),4) = YEAR(GETDATE())) GROUP BY vw_YTD_FOR_Market_ALL_S.MonthN, LEFT(vw_YTD_FOR_Market_ALL_S.ORDDATE_, 6), vw_YTD_FOR_Market_ALL_S.SG, GetHEAD.SalesPersonFirstName ORDER BY LEFT(vw_YTD_FOR_Market_ALL_S.ORDDATE_, 6)", ref NP_Cls.strErr);
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


                    DataView dv = new DataView();
                    dv.Table = dsMonth.Tables[0];
                    dv.Sort = "SALEPERSON, ORDDATE";
                    rgMonth.DataSource = dv.ToTable();
                    rgMonth.DataBind();
                   
                    dsT.Tables.Add(dv.ToTable());
                    dsT.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml");
                    dsT.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Month_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + ".xml");
                }
                else
                {
                    dsT.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\MonthSch.xml");
                    dsT.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\Month_" + e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["SALEPERSON"].ToString() + ".xml");
                    rgMonth.DataSource = dsT.Tables[0];  
                    rgMonth.DataBind();
                }
            }
        }
     
        protected void rgSG_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridFooterItem)
            {
                GridFooterItem footerItem = e.Item as GridFooterItem;
                footerItem["clnArchive"].Text =((double.Parse(footerItem["clnAmount"].Text.Trim()) * 100) / double.Parse(footerItem["clnForecast"].Text.Trim())).ToString("###,##0.00") + "%";
                footerItem["clnAchieveYear"].Text = ((double.Parse(footerItem["clnAmount"].Text.Trim()) * 100) / double.Parse(footerItem["clnForecastYear"].Text.Trim())).ToString("###,##0.00") + "%";
            }  
        }
        protected void rgSummary_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                if (dataItem["clnMonth"].Text.Trim() == NP_Cls.sCurrentMonthName.ToUpper())
                {
                    e.Item.BackColor = System.Drawing.Color.BlanchedAlmond;
                    e.Item.ForeColor = System.Drawing.Color.Brown;
                    e.Item.Font.Bold = true;
                }
            }
        }
        protected void RadNested_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (sUpdateDATA == "1")
            {
                this.RadNested.DataSource = NP.Execute("SELECT     ORDNUMBER, Month, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_ AS ORDDATE, SUM(NET)                       AS NET FROM         vw_YTD_FOR_Market_ALL_S GROUP BY ORDNUMBER, Month, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_", ref NP_Cls.strErr).Tables[0];
            }
            else
            {
                DataSet dsNeed = new DataSet();
                dsNeed.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGVSch.xml");
                dsNeed.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGV.xml");
                this.RadNested.DataSource = dsNeed.Tables[0];
            }
        }

        protected void rgSale_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                if (dataItem["clnHeader"].Text.Trim() == "1")
                {
                    dataItem.BackColor = System.Drawing.Color.BlanchedAlmond;
                    dataItem.ForeColor = System.Drawing.Color.Brown;
                    dataItem.Font.Bold = true;
                }
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Configuration myConfiguration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            myConfiguration.AppSettings.Settings["UpdateDATA"].Value = "1";
            myConfiguration.AppSettings.Settings["LastUpdateDATA"].Value = DateTime.Now.ToString("dd MMM yyyy hh:mm:ss tt");
            myConfiguration.Save();

            Response.AddHeader("Refresh", "0");
        }

    }
}