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
    public partial class YTD_SOHistory : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV(1);
            }
        }
        private void DGV(byte type)
        {
            DataSet dsDGV = new DataSet();
            //if (sUpdateDATA == "1")
            //{
            NP_Cls.sqlSelect = "SELECT     ORDNUMBER, MonthN AS [Month], STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_ AS ORDDATE, SUM(NET)                       AS NET FROM         vw_YTD_FOR_Market_ALL GROUP BY ORDNUMBER, MonthN, STATUS, ORDERDATE, EFFECTIVEDATE, CUSTOMER, NAMECUST, SALEPERSON, SG, SGDESC, SOTYPE, ORDDATE_";

            dsDGV = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.RadNested.DataSource = dsDGV.Tables[0];
            if (type == 1)
            {
                this.RadNested.DataBind();
            }
            //dsDGV.WriteXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGVSch.xml");
            //dsDGV.WriteXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGV.xml");
            //}
            //else
            //{
            //    dsDGV.ReadXmlSchema(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGVSch.xml");
            //    dsDGV.ReadXml(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data") + @"\DATA\DGV.xml");
            //    this.RadNested.DataSource = dsDGV.Tables[0];
            //    this.RadNested.DataBind();
            //}
        }
        protected void RadNested_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            this.RadNested.MasterTableView.ExportToExcel();
        }
        private void ConfigureExport()
        {
            //this.rgProd.MasterTableView.HierarchyLoadMode = GridChildLoadMode.ServerBind;
            this.RadNested.ExportSettings.ExportOnlyData = true;
            this.RadNested.ExportSettings.Excel.Format = GridExcelExportFormat.ExcelML;
            this.RadNested.ExportSettings.IgnorePaging = true;

        }
    }
}