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
    public partial class PO_GoodsInTransit : System.Web.UI.Page
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
            NP_Cls.sqlSelect = "SELECT  0 AS No,   PORHSEQ, PONUMBER, DATE, VDCODE, VDNAME, HAMT, ITEMNO, ITEMDESC, PO_UNITCOST, UNITCOST, OrderQTY, INTRANSIT, LAMT, POAMT FROM         vw_PO_GoodsInTransit";
            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            for (int i = 0; i < dsDGV.Tables[0].Rows.Count; i++)
            {
                dsDGV.Tables[0].Rows[i][0] = i + 1;
            }

            this.rgPOGDS.DataSource = dsDGV.Tables[0];
            if (sType == 1)
            {
                this.rgPOGDS.DataBind();
            }
        }
        protected void rgPOGDS_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.rgPOGDS.ExportSettings.ExportOnlyData = true;
            this.rgPOGDS.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.rgPOGDS.ExportSettings.IgnorePaging = true;

        }
        protected void rgPOGDS_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.rgPOGDS.MasterTableView.ExportToExcel();
        }

    }
}