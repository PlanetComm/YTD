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
    public partial class PORunning : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); DataSet dsDGV = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.txtPO.Focus();
                //DGV(1);
            }
        }
        private void DGV(byte sType)
        {
            NP_Cls.sqlSelect = "SELECT  PO_Number, PO_Date, Month_Name, VendorCode, VendorName, RQNNUMBER, COMMENT, VDESC, DESCRIPTIO, CURR FROM    vw_PO_Running WHERE (PO_Number LIKE '" + this.txtPO.Text.Trim() + "%') ";

            if (string.IsNullOrEmpty(this.txtPO.Text.Trim()))
            {
                NP_Cls.sqlSelect += " AND (1=0) ";
            }
            NP_Cls.sqlSelect += " ORDER BY PO_Number";
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
            this.rgPOGDS.ExportSettings.FileName = "PORun_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                DGV(1);
            }
        }
    }
}