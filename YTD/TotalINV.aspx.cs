using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;

namespace YTD
{
    public partial class TotalINV : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();

        private double dSumJan = 0; private double dSumFeb = 0; private double dSumMar = 0; private double dSumApr = 0; private double dSumMay = 0;
        private double dSumJun = 0; private double dSumJul = 0; private double dSumAug = 0; private double dSumSep = 0; private double dSumOct = 0;
        private double dSumNov = 0; private double dSumDec = 0; private double dSumAll = 0;

        private double dSumTmp = 0.00;
        
        //private double dYearForecast = double.Parse(ConfigurationSettings.AppSettings["INVYearForecast"]);
        //private int iCurrentMonthNumber = int.Parse(ConfigurationSettings.AppSettings["CurrentMonthNum"]);
        //private string sCurrentMonthName = ConfigurationSettings.AppSettings["CurrentMonthName"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ReportDocument crystalReport = new ReportDocument();
                //crystalReport.Load(Server.MapPath("Rpt/GLTRLR1N.RPT"));


                DGV(1);

                // Intial YTD
                NP_Cls.sqlSelect = "SELECT     '' AS MONTHLY, 0.00 AS [INVMonth], 0.00 AS [INVForecast], '' AS [INVAchieve], 0.00 AS [INVYTD], 0.00 AS [ForecastYTD], '' AS [YTDAchieve]";
                DataSet dsYTD = new DataSet();
                dsYTD = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                if (dsYTD.Tables[0].Rows.Count > 0) { dsYTD.Tables[0].Rows.Clear(); }

                DataRow drY; double dMonthlyForecast = NP_Cls.dYearForecast / 12;

                double ForcastYTD = 0.0; // Thannapan 2013 Edited 

                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "JANUARY"; //Monthly

                //drY[1] = dSumJan; //SO-Month // RealTime
                dSumJan = 16089462.05;
                drY[1] = dSumJan; //SO-Month // RealTime

                dMonthlyForecast = 67000000;  // Thannapan for 2013 Edited ==> Jun

                drY[2] = dMonthlyForecast; //dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumJan * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumJan; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumJan * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);

                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "FEBRUARY"; //Monthly

                //drY[1] = dSumFeb; //SO-Month
                dSumFeb = 16317837.61;
                drY[1] = dSumFeb; //SO-Month
                dSumTmp = dSumJan + dSumFeb;

                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumFeb * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast);//Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);


                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "MARCH"; //Monthly

                //drY[1] = dSumMar; //SO-Month
                dSumMar = 159531007.45;
                drY[1] = dSumMar; //SO-Month
                dSumTmp = dSumJan + dSumFeb + dSumMar;

                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumMar * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);


                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "APRIL"; //Monthly

                //drY[1] = dSumApr; //SO-Month
                dSumApr = 65362819.65;
                drY[1] = dSumApr; //SO-Month
                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr;

                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumApr * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);


                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "MAY"; //Monthly

                //drY[1] = dSumMay; //SO-Month
                dSumMay = 30855315.74;
                drY[1] = dSumMay; //SO-Month
                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay;

                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumMay * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);


                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "JUNE"; //Monthly

                //drY[1] = dSumJun; //SO-Month
                dSumJun = 100198717.91;
                drY[1] = dSumJun; //SO-Month
                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun;

                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumJun * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);


                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "JULY"; //Monthly

                //drY[1] = dSumJul; //SO-Month
                dSumJul = 52934740.46;
                drY[1] = dSumJul; //SO-Month
                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul;

                dMonthlyForecast = 77000000;  // Thannapan for 2013 Edited ==> July
                drY[2] = dMonthlyForecast; //SO-Forecast
                drY[3] = ((dSumJul * 100) / dMonthlyForecast).ToString("###,##0.00") + "%"; //SO-Achieve
                drY[4] = dSumTmp; //SO-YTD
                drY[5] = ForcastYTD = (ForcastYTD + dMonthlyForecast); //Forecast-YTD
                drY[6] = ((dSumTmp * 100) / ForcastYTD).ToString("###,##0.00") + "%"; //YTD-Achieve
                dsYTD.Tables[0].Rows.Add(drY);


                drY = dsYTD.Tables[0].NewRow();
                drY[0] = "AUGUST"; //Monthly

                //drY[1] = dSumAug; //SO-Month
                dSumAug = 20324440.90 - 137591.13;
                drY[1] = dSumAug; //SO-Month
                dSumTmp = dSumJan + dSumFeb + dSumMar + dSumApr + dSumMay + dSumJun + dSumJul + dSumAug;

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

                //dSumSep = 12883800.74 - 137591.13;
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
            }
        }
        private void DGV(byte type)
        {
            DataSet dsDGV = new DataSet();
          
          //  NP_Cls.sqlSelect = "SELECT     INVNUMBER, ORDNUMBER, INVDATE, Amount, CUSTOMER, NAMECUST, ORDBY, SG, SaleP FROM         vw_INV_OE_AR_USE_RV_S WHERE     (INVNUMBER NOT IN                           (SELECT     INVNUMBER                             FROM          PCA_ITAsset.dbo.INV_ACKDATA                             WHERE      (INVDATE IS NULL)))";
            NP_Cls.sqlSelect = "SELECT     vw_INV_OE_AR_USE_RV_S.INVNUMBER, vw_INV_OE_AR_USE_RV_S.ORDNUMBER, vw_INV_OE_AR_USE_RV_S.INVDATE,                       vw_INV_OE_AR_USE_RV_S.Amount, vw_INV_OE_AR_USE_RV_S.CUSTOMER, vw_INV_OE_AR_USE_RV_S.NAMECUST,                       vw_INV_OE_AR_USE_RV_S.ORDBY, vw_INV_OE_AR_USE_RV_S.SG, vw_INV_OE_AR_USE_RV_S.SaleP,                       IT.dbo.APW_SaleseGroup.SalesGroupName FROM         IT.dbo.APW_SaleseGroup INNER JOIN                       IT.dbo.APW_SalesPerson ON IT.dbo.APW_SaleseGroup.SalesGroupUNQ = IT.dbo.APW_SalesPerson.SalesGroupUNQ RIGHT OUTER JOIN                      vw_INV_OE_AR_USE_RV_S ON IT.dbo.APW_SalesPerson.SalesPersonFirstNameOld = vw_INV_OE_AR_USE_RV_S.SaleP WHERE     (vw_INV_OE_AR_USE_RV_S.INVNUMBER NOT IN                           (SELECT     INVNUMBER                             FROM          PCA_ITAsset.dbo.INV_ACKDATA                             WHERE      (INVDATE IS NULL))) ORDER BY vw_INV_OE_AR_USE_RV_S.SaleP, IT.dbo.APW_SaleseGroup.SalesGroupCode";

            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.RadNested.DataSource = dsDGV.Tables[0];
            if (type == 1)
            {
                this.RadNested.DataBind();
            }
        }
        protected void RadNested_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.RadNested.ExportSettings.ExportOnlyData = true;
            this.RadNested.ExportSettings.Excel.Format = GridExcelExportFormat.ExcelML;
            this.RadNested.ExportSettings.IgnorePaging = true;

        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.RadNested.MasterTableView.ExportToExcel();
        }

        protected void RadNested_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                switch ((dataItem["clnORDBY"].Text.Trim().Substring(0, 6)).Substring(4, 2))
                {
                    case "01":
                        dSumJan += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "02":
                        dSumFeb += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "03":
                        dSumMar += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "04":
                        dSumApr += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "05":
                        dSumMay += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "06":
                        dSumJun += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "07":
                        dSumJul += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "08":
                        dSumAug += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "09":
                        dSumSep += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "10":
                        dSumOct += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "11":
                        dSumNov += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "12":
                        dSumDec += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    default:
                        break;
                }
                dSumAll += double.Parse(dataItem["clnAmount"].Text.Trim());
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
    }
}