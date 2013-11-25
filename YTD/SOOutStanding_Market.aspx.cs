using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Drawing;
using Telerik.Web.UI.GridExcelBuilder;

namespace YTD
{
    public partial class SOOutStanding_Market : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        private double dSumSG1 = 0; private double dSumSG21 = 0; private double dSumSG22 = 0;
        private double dSumSG23 = 0; private double dSumSG3 = 0; private double dSumSG4 = 0; private double dSumSG5 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.rgSO.DataSource = NP.Execute(getSOOutStandingQuery(), ref NP_Cls.strErr).Tables[0];
                this.rgSO.DataBind();

                   //Hide
                switch (NP_Cls.iCurrentMonthNumber)
                {
                    case 2:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false;
                        break;
                    case 3:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false;
                        break;
                    case 4:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        break;
                    case 5:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false;
                        break;
                    case 6:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false;
                        break;
                    case 7:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false; this.rgSO.Columns.FindByUniqueName("clnJun").Display = false;

                        break;
                    case 8:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false; this.rgSO.Columns.FindByUniqueName("clnJun").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnJul").Display = false;
                        break;
                    case 9:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false; this.rgSO.Columns.FindByUniqueName("clnJun").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnJul").Display = false; this.rgSO.Columns.FindByUniqueName("clnAug").Display = false;
                        break;
                    case 10:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false; this.rgSO.Columns.FindByUniqueName("clnJun").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnJul").Display = false; this.rgSO.Columns.FindByUniqueName("clnAug").Display = false; this.rgSO.Columns.FindByUniqueName("clnSep").Display = false;
                        break;
                    case 11:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false; this.rgSO.Columns.FindByUniqueName("clnJun").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnJul").Display = false; this.rgSO.Columns.FindByUniqueName("clnAug").Display = false; this.rgSO.Columns.FindByUniqueName("clnSep").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnOct").Display = false;
                        break;
                    case 12:
                        this.rgSO.Columns.FindByUniqueName("clnJan").Display = false; this.rgSO.Columns.FindByUniqueName("clnFeb").Display = false; this.rgSO.Columns.FindByUniqueName("clnMar").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnApr").Display = false; this.rgSO.Columns.FindByUniqueName("clnMay").Display = false; this.rgSO.Columns.FindByUniqueName("clnJun").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnJul").Display = false; this.rgSO.Columns.FindByUniqueName("clnAug").Display = false; this.rgSO.Columns.FindByUniqueName("clnSep").Display = false;
                        this.rgSO.Columns.FindByUniqueName("clnOct").Display = false; this.rgSO.Columns.FindByUniqueName("clnNov").Display = false;
                        break;

                    default:
                        break;
                }


            }
        }
        protected void rgSO_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            this.rgSO.DataSource = NP.Execute(this.getSOOutStandingQuery(), ref NP_Cls.strErr).Tables[0];
        }
        private string getSOOutStandingQuery()
        {
            return "SELECT     TOP (100) PERCENT dbo.OEORDH.ORDNUMBER AS SO, GetSOTYPE.VDESC AS SOTYPE, dbo.OEORDH.LASTINVNUM AS INV,                        CASE WHEN dbo.ARCUS.NAMECUST = '' THEN dbo.ARCUS.TEXTSNAM ELSE dbo.ARCUS.NAMECUST END AS CUSTOMER, dbo.OEORDH.REFERENCE,                        dbo.OEORDH.TBASE1 * OEORDH.ORRATE AS Amount, ISNULL(CAST(GetEC01.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Jan, ISNULL(CAST(GetEC02.Value AS Decimal(15,                        7)), 0) * dbo.OEORDH.ORRATE AS Feb, ISNULL(CAST(GetEC03.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Mar,                        ISNULL(CAST(GetEC04.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Apr, ISNULL(CAST(GetEC05.Value AS Decimal(15, 7)), 0)                        * dbo.OEORDH.ORRATE AS May, ISNULL(CAST(GetEC06.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Jun, ISNULL(CAST(GetEC07.Value AS Decimal(15, 7)),                        0) * dbo.OEORDH.ORRATE AS Jul, ISNULL(CAST(GetEC08.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Aug, ISNULL(CAST(GetEC09.Value AS Decimal(15,                        7)), 0) * dbo.OEORDH.ORRATE AS Sep, ISNULL(CAST(GetEC10.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Oct,                        ISNULL(CAST(GetEC11.Value AS Decimal(15, 7)), 0) * dbo.OEORDH.ORRATE AS Nov, ISNULL(CAST(GetEC12.Value AS Decimal(15, 7)), 0)                        * dbo.OEORDH.ORRATE AS Dec, 0 AS Balance, UPPER(CAST(IT.dbo.APW_SalesPerson.SalesPersonFirstName AS VARCHAR)) AS SALEPERSON,                        IT.dbo.APW_SaleseGroup.SalesGroupCode AS SALESGROUP, CONVERT(nvarchar, CAST(CASE WHEN ISDATE(CAST(GetEFFDate.Value AS VARCHAR)) = 0 THEN NULL                        ELSE CAST(GetEFFDate.Value AS VARCHAR) END AS DATETIME), 106) AS EFFDATE, dbo.OEORDH.COMMENT FROM         IT.dbo.APW_SalesPerson INNER JOIN                       dbo.OEORDH INNER JOIN                           (SELECT     VALUE, ORDUNIQ                             FROM          dbo.OEORDHO                             WHERE      (OPTFIELD = 'PREPAREBY')) AS GetSALES ON dbo.OEORDH.ORDUNIQ = GetSALES.ORDUNIQ INNER JOIN                           (SELECT     OEORDHO_13.ORDUNIQ, dbo.CSOPTFD.VDESC                             FROM          dbo.OEORDHO AS OEORDHO_13 INNER JOIN                                                    dbo.CSOPTFD ON OEORDHO_13.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND OEORDHO_13.VALUE = dbo.CSOPTFD.VALUE                             WHERE      (OEORDHO_13.OPTFIELD = 'SOTYPE')) AS GetSOTYPE ON dbo.OEORDH.ORDUNIQ = GetSOTYPE.ORDUNIQ ON                        IT.dbo.APW_SalesPerson.SalesPersonFirstNameOld = GetSALES.VALUE INNER JOIN                       IT.dbo.APW_SaleseGroup ON IT.dbo.APW_SalesPerson.SalesGroupUNQ = IT.dbo.APW_SaleseGroup.SalesGroupUNQ INNER JOIN                       dbo.ARCUS ON dbo.OEORDH.CUSTOMER = dbo.ARCUS.IDCUST LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_13                             WHERE      (OPTFIELD = 'EFFECTDATE')) AS GetEFFDate ON dbo.OEORDH.ORDUNIQ = GetEFFDate.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_01                             WHERE      (OPTFIELD = 'EI01')) AS GetEC01 ON dbo.OEORDH.ORDUNIQ = GetEC01.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_02                             WHERE      (OPTFIELD = 'EI02')) AS GetEC02 ON dbo.OEORDH.ORDUNIQ = GetEC02.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_03                             WHERE      (OPTFIELD = 'EI03')) AS GetEC03 ON dbo.OEORDH.ORDUNIQ = GetEC03.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_04                             WHERE      (OPTFIELD = 'EI04')) AS GetEC04 ON dbo.OEORDH.ORDUNIQ = GetEC04.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_05                             WHERE      (OPTFIELD = 'EI05')) AS GetEC05 ON dbo.OEORDH.ORDUNIQ = GetEC05.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_06                             WHERE      (OPTFIELD = 'EI06')) AS GetEC06 ON dbo.OEORDH.ORDUNIQ = GetEC06.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_07                             WHERE      (OPTFIELD = 'EI07')) AS GetEC07 ON dbo.OEORDH.ORDUNIQ = GetEC07.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_08                             WHERE      (OPTFIELD = 'EI08')) AS GetEC08 ON dbo.OEORDH.ORDUNIQ = GetEC08.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_09                             WHERE      (OPTFIELD = 'EI09')) AS GetEC09 ON dbo.OEORDH.ORDUNIQ = GetEC09.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_10                             WHERE      (OPTFIELD = 'EI10')) AS GetEC10 ON dbo.OEORDH.ORDUNIQ = GetEC10.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_11                             WHERE      (OPTFIELD = 'EI11')) AS GetEC11 ON dbo.OEORDH.ORDUNIQ = GetEC11.ORDUNIQ LEFT OUTER JOIN                           (SELECT     ORDUNIQ, ISNULL(VALUE, 0) AS Value                             FROM          dbo.OEORDHO AS OEORDHO_12                             WHERE      (OPTFIELD = 'EI12')) AS GetEC12 ON dbo.OEORDH.ORDUNIQ = GetEC12.ORDUNIQ WHERE     (dbo.OEORDH.TYPE = 1) AND (dbo.OEORDH.COMPLETE = 1 OR                       dbo.OEORDH.COMPLETE = 2) ORDER BY SO";
        }

        protected void rgSO_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
        
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;

                NP_Cls.iCurrentMonthNumber = int.Parse(NP.Execute("SELECT MONTH(GETDATE())", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString());
                switch (NP_Cls.iCurrentMonthNumber)
                {
                    case 2:
                        dataItem["clnJan"].Text = "-";
                        break;
                    case 3:
                        dataItem["clnJan"].Text = "-";
                        dataItem["clnFeb"].Text = "-";
                        break;
                    case 4:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-";
                        break;
                    case 5:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-";
                        break;
                    case 6:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-";
                        break;
                    case 7:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-"; dataItem["clnJun"].Text = "-";
                        break;
                    case 8:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-"; dataItem["clnJun"].Text = "-";
                        dataItem["clnJul"].Text = "-";
                        break;
                    case 9:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-"; dataItem["clnJun"].Text = "-";
                        dataItem["clnJul"].Text = "-"; dataItem["clnAug"].Text = "-";
                        break;
                    case 10:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-"; dataItem["clnJun"].Text = "-";
                        dataItem["clnJul"].Text = "-"; dataItem["clnAug"].Text = "-"; dataItem["clnSep"].Text = "-";
                        break;
                    case 11:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-"; dataItem["clnJun"].Text = "-";
                        dataItem["clnJul"].Text = "-"; dataItem["clnAug"].Text = "-"; dataItem["clnSep"].Text = "-"; dataItem["clnOct"].Text = "-";
                        break;
                    case 12:
                        dataItem["clnJan"].Text = "-"; dataItem["clnFeb"].Text = "-"; dataItem["clnMar"].Text = "-"; dataItem["clnApr"].Text = "-"; dataItem["clnMay"].Text = "-"; dataItem["clnJun"].Text = "-";
                        dataItem["clnJul"].Text = "-"; dataItem["clnAug"].Text = "-"; dataItem["clnSep"].Text = "-"; dataItem["clnOct"].Text = "-"; dataItem["clnNov"].Text = "-";
                        break;
                    default:
                        break;
                }

                if (dataItem["clnJan"].Text.Trim() == "0.00")
                {
                    dataItem["clnJan"].Text = "-";
                }
                if (dataItem["clnFeb"].Text.Trim() == "0.00")
                {
                    dataItem["clnFeb"].Text = "-";
                }
                if (dataItem["clnMar"].Text.Trim() == "0.00")
                {
                    dataItem["clnMar"].Text = "-";
                }
                if (dataItem["clnApr"].Text.Trim() == "0.00")
                {
                    dataItem["clnApr"].Text = "-";
                }
                if (dataItem["clnMay"].Text.Trim() == "0.00")
                {
                    dataItem["clnMay"].Text = "-";
                }
                if (dataItem["clnJun"].Text.Trim() == "0.00")
                {
                    dataItem["clnJun"].Text = "-";
                }
                if (dataItem["clnJul"].Text.Trim() == "0.00")
                {
                    dataItem["clnJul"].Text = "-";
                }
                if (dataItem["clnAug"].Text.Trim() == "0.00")
                {
                    dataItem["clnAug"].Text = "-";
                }
                if (dataItem["clnSep"].Text.Trim() == "0.00")
                {
                    dataItem["clnSep"].Text = "-";
                }
                if (dataItem["clnOct"].Text.Trim() == "0.00")
                {
                    dataItem["clnOct"].Text = "-";
                }
                if (dataItem["clnNov"].Text.Trim() == "0.00")
                {
                    dataItem["clnNov"].Text = "-";
                }
                if (dataItem["clnDec"].Text.Trim() == "0.00")
                {
                    dataItem["clnDec"].Text = "-";
                }

                if (dataItem["clnSOType"].Text.Trim() == "Installation, In Stock")
                {
                    dataItem["clnSOType"].ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0066");
                    dataItem["clnSOType"].Font.Bold = true;
                    dataItem["clnAmount"].ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0066");
                    dataItem["clnAmount"].Font.Bold = true;
                }
                else if (dataItem["clnSOType"].Text.Trim() == "No Installation, In Stock")
                {
                    dataItem["clnSOType"].ForeColor = System.Drawing.ColorTranslator.FromHtml("#925E00");
                    dataItem["clnSOType"].Font.Bold = true;
                    dataItem["clnAmount"].ForeColor = System.Drawing.ColorTranslator.FromHtml("#925E00");
                    dataItem["clnAmount"].Font.Bold = true;
                }

                switch (dataItem["clnSalesGroup"].Text.Trim().ToUpper())
                {
                    case "SG1-ENT":
                        dataItem["clnSG1ENT"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG1 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "SG2-PB1":
                        dataItem["clnSG2PB1"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG21 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "SG2-PB2":
                        dataItem["clnSG2PB2"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG22 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "SG2-PB3":
                        dataItem["clnSG2PB3"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG23 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "SG3-SPV":
                        dataItem["clnSG3SPV"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG3 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "SG4-BCT":
                        dataItem["clnSG4BCT"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG4 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    case "SG5-INT":
                        dataItem["clnSG5INT"].Text = dataItem["clnAmount"].Text.Trim();
                        dSumSG5 += double.Parse(dataItem["clnAmount"].Text.Trim());
                        break;
                    default:
                        break;
                }

             
            }

            if (e.Item is GridFooterItem)
            {
                GridFooterItem FootItem = e.Item as GridFooterItem;
                FootItem["clnSG1ENT"].Text = dSumSG1.ToString("###,##0.00");
                FootItem["clnSG2PB1"].Text = dSumSG21.ToString("###,##0.00");
                FootItem["clnSG2PB2"].Text = dSumSG22.ToString("###,##0.00");
                FootItem["clnSG2PB3"].Text = dSumSG23.ToString("###,##0.00");
                FootItem["clnSG3SPV"].Text = dSumSG3.ToString("###,##0.00");
                FootItem["clnSG4BCT"].Text = dSumSG4.ToString("###,##0.00");
                FootItem["clnSG5INT"].Text = dSumSG5.ToString("###,##0.00");

                NP_Cls.iCurrentMonthNumber = int.Parse(NP.Execute("SELECT MONTH(GETDATE())", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString());
                switch (NP_Cls.iCurrentMonthNumber)
                {
                    case 2:
                        FootItem["clnJan"].Text = "-";
                        break;
                    case 3:
                        FootItem["clnJan"].Text = "-";
                        FootItem["clnFeb"].Text = "-";
                        break;
                    case 4:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-";
                        break;
                    case 5:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-";
                        break;
                    case 6:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-";
                        break;
                    case 7:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-"; FootItem["clnJun"].Text = "-";
                        break;
                    case 8:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-"; FootItem["clnJun"].Text = "-";
                        FootItem["clnJul"].Text = "-";
                        break;
                    case 9:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-"; FootItem["clnJun"].Text = "-";
                        FootItem["clnJul"].Text = "-"; FootItem["clnAug"].Text = "-";
                        break;
                    case 10:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-"; FootItem["clnJun"].Text = "-";
                        FootItem["clnJul"].Text = "-"; FootItem["clnAug"].Text = "-"; FootItem["clnSep"].Text = "-";
                        break;
                    case 11:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-"; FootItem["clnJun"].Text = "-";
                        FootItem["clnJul"].Text = "-"; FootItem["clnAug"].Text = "-"; FootItem["clnSep"].Text = "-"; FootItem["clnOct"].Text = "-";
                        break;
                    case 12:
                        FootItem["clnJan"].Text = "-"; FootItem["clnFeb"].Text = "-"; FootItem["clnMar"].Text = "-"; FootItem["clnApr"].Text = "-"; FootItem["clnMay"].Text = "-"; FootItem["clnJun"].Text = "-";
                        FootItem["clnJul"].Text = "-"; FootItem["clnAug"].Text = "-"; FootItem["clnSep"].Text = "-"; FootItem["clnOct"].Text = "-"; FootItem["clnNov"].Text = "-";
                        break;
                    default:
                        break;
                }
            }
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgSO.MasterTableView.ExportToExcel();
        }
        private void ConfigureExport()
        {
            //this.rgSO.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgSO.ExportSettings.ExportOnlyData = true;
            this.rgSO.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgSO.ExportSettings.IgnorePaging = true;

        }

        protected void rgSO_ExcelMLExportRowCreated(object sender, Telerik.Web.UI.GridExcelBuilder.GridExportExcelMLRowCreatedArgs e)
        {
            if (e.Worksheet.Table.Rows.Count == rgSO.Items.Count + 1)
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