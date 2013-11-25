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
    public partial class QTExpire : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); DataSet dsDGV = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        private void DGV(byte sType)
        {
            if (this.dtpMY.SelectedDate != null)
                NP_Cls.sqlSelect = " SELECT     ORDNUMBER, CUSTOMER, BILNAME, CONVERT(nvarchar,CAST(CAST(QTEXPDATE AS VARCHAR) AS DATETIME),106) AS QTEXPDATE  FROM         OEORDH WHERE     (QTEXPDATE < '" + this.dtpMY.SelectedDate.Value.ToString("yyyyMM", NP_Cls.cul) + "32') AND (ORDNUMBER NOT IN                          (SELECT     QUONUMBER                            FROM          OEORDH1)) AND (LEFT(ORDNUMBER, 2) = 'QT') AND (QTEXPDATE > '" + this.dtpMY.SelectedDate.Value.ToString("yyyyMM", NP_Cls.cul) + "00')";
            else
                NP_Cls.sqlSelect = " SELECT     ORDNUMBER, CUSTOMER, BILNAME, QTEXPDATE FROM         OEORDH WHERE    (ORDNUMBER NOT IN                          (SELECT     QUONUMBER                            FROM          OEORDH1)) AND (LEFT(ORDNUMBER, 2) = 'QT') AND (1=0)";
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
            this.rgPOGDS.ExportSettings.FileName = "QTExpire_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (this.dtpMY.SelectedDate != null)
            {
                DGV(1);
            }
        }
    }
}