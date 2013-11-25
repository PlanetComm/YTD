using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Drawing;

namespace YTD
{
    public partial class Payment : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); DataSet dsDGV = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV(1);
            }
        }

        private void DGV(byte sType)
        {
            NP_Cls.sqlSelect = "                     SELECT     PORCPH1.RCPHSEQ, PORCPH1.VDCODE AS VENCODE, APVEN.VENDNAME AS VENNAME, PORCPH1.RCPNUMBER AS RECNO,                        PORCPH1.PONUMBER AS PONO, PORCPH1.INVNUMBER AS INVNO, Convert(nvarchar, CAST(CAST(PORCPH1.DATE AS VARCHAR) AS DATETIME) ,106) AS RECDATE, PORCPH1.FISCYEAR AS WYEAR,                        PORCPH1.CURRENCY AS RECCUR, PORCPH1.RATE AS RECRATE, PORCPH1.TAXBASE1 AS RECBFAMT, PORCPH1.FCAMOUNT AS RECATAMT,                         Convert(nvarchar, CAST(CAST(PYTbl.PAYDATE AS VARCHAR) AS DATETIME) ,106) AS PAYDATE, PYTbl.PAYCURR, PYTbl.PAYRATE, PYTbl.PAYAMT, PYTbl.PAYINTHB, PORCPH1.FCAMOUNT - PYTbl.PAYINTHB AS GL FROM         PORCPH1 INNER JOIN                       APVEN ON PORCPH1.VDCODE = APVEN.VENDORID INNER JOIN                           (SELECT     TOP (100) PERCENT APPJD.POSTSEQNCE, APPJD.CNTBTCH, APPJD.CNTITEM, APPJD.CNTSEQENCE, APPJD.IDVEND,                                                     ISNULL(APPJD.IDINVC, APPJH.TEXTREF) AS REF, APPJH.FISCYR, APPJH.FISCPER, APPJD.DATEDUE AS PAYDATE,                                                     APPJD.CODECURN AS PAYCURR, APPJD.RATEEXCHHC AS PAYRATE, APPJD.AMTEXTNDTC AS PAYAMT,                                                     APPJD.AMTEXTNDHC AS PAYINTHB                             FROM          APPJD INNER JOIN                                                    APPJH ON APPJD.TYPEBTCH = APPJH.TYPEBTCH AND APPJD.POSTSEQNCE = APPJH.POSTSEQNCE AND                                                     APPJD.CNTBTCH = APPJH.CNTBTCH AND APPJD.CNTITEM = APPJH.CNTITEM                             WHERE      (APPJD.TRANSTYPE IN ('10', '11')) AND (APPJD.CODECURN <> 'THB')                             ORDER BY APPJD.CNTITEM, APPJD.CNTSEQENCE) AS PYTbl ON PORCPH1.INVNUMBER = PYTbl.REF WHERE     (PORCPH1.CURRENCY <> 'THB') AND (PORCPH1.FISCYEAR = YEAR(GETDATE())) ORDER BY PORCPH1.RCPHSEQ, PONO ";
            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.rgPOGDS.DataSource = dsDGV.Tables[0];
            if (sType == 1)
            {
                this.rgPOGDS.DataBind();
            }
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgPOGDS.ExportSettings.ExportOnlyData = true;
            this.rgPOGDS.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgPOGDS.ExportSettings.IgnorePaging = true;
            this.rgPOGDS.ExportSettings.FileName = "ARPayment_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgPOGDS.MasterTableView.ExportToExcel();
        }
        protected void rgPOGDS_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }

        protected void rgPOGDS_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                if (decimal.Parse(item["clnGL"].Text.Trim()) >= 0)
                {
                    item["clnGL"].BackColor = Color.GreenYellow;
                }
                else
                {
                    item["clnGL"].BackColor = Color.OrangeRed;
                }
            }
        }

    }
}