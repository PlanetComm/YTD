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
    public partial class ProjPrice : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet dsBind = new DataSet(); dsBind = NP.Execute("SELECT     FMTCONTNO AS Code, CONVERT(nvarchar, CASE PMCONTS.STATUS WHEN 30 THEN 'Open' WHEN 10 THEN 'Estimate' WHEN 60 THEN 'Completed' END)                       + ' : ' + CONVERT(nvarchar, FMTCONTNO) + ' : ' + RTRIM([DESC]) AS [Desc], RTRIM([DESC]) AS Sort_ FROM         PMCONTS WHERE     (STATUS IN (30, 10, 60)) ORDER BY STATUS, Sort_", ref NP_Cls.strErr);
                DataRow dr; dr = dsBind.Tables[0].NewRow();
                dr[0] = "0"; dr[1] = "============ Select Condition ============";
                dsBind.Tables[0].Rows.InsertAt(dr, 0);
                dsBind.AcceptChanges();
                this.cbCondition.DataSource = dsBind.Tables[0]; this.cbCondition.DataTextField = "Desc"; this.cbCondition.DataValueField = "Code"; this.cbCondition.DataBind();
                this.cbCondition.SelectedIndex = -1;
                DGV(1); DGVTotal(1);
                this.cbCondition.Focus();
            }
        }
        protected void cbCondition_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (this.cbCondition.SelectedIndex ==  0)
            {
                this.txtCondition.Text = string.Empty;
            }
            else
            {
                this.txtCondition.Text = this.cbCondition.SelectedValue.ToString();
            }
        }
        private void DGV(byte ty)
        {
            NP_Cls.sqlSelect = "SELECT     ItemNo, LEFT(SO,9) AS SO, PROJECT, ITEM, ITEMDESC, CATE, CATEDESC, QTY, UNITCOST, TOTALCOST, UNITPRICE, TOTALPRICE, MARGIN FROM    vw_Proj_Cost WHERE (1=1) ";
            if (!string.IsNullOrEmpty(this.txtCondition.Text.Trim()))
            {
                NP_Cls.sqlSelect += " AND (SO = '" + this.txtCondition.Text.Trim().Replace("-", string.Empty) + "') ";
            }
            else
            {
                NP_Cls.sqlSelect += " AND (1=0) ";
            }
            NP_Cls.sqlSelect += "  ORDER BY PROJECT, CLINENUM  "; 
            DataSet ds = new DataSet(); ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i][0] = i + 1;
                if (double.Parse(ds.Tables[0].Rows[i]["TOTALCOST"].ToString()) > 0)
                {
                    ds.Tables[0].Rows[i]["MARGIN"] = ((double.Parse(ds.Tables[0].Rows[i]["TOTALPRICE"].ToString()) - double.Parse(ds.Tables[0].Rows[i]["TOTALCOST"].ToString())) / double.Parse(ds.Tables[0].Rows[i]["TOTALCOST"].ToString())) * 100;
                }
            }
            this.rgCost.DataSource = ds.Tables[0];
            if (ty == 1)
            {
                this.rgCost.DataBind();
            }
        }
        private void DGVTotal(byte ty)
        {
            NP_Cls.sqlSelect = "SELECT     ORDNUMBER, PROJDESC, AMT_PJC, AMT_OE,AMT_PJC - AMT_OE DIFF FROM vw_OE_PJC_CMP WHERE     (1 = 1)  ORDER BY PROJDESC ";
            if (!string.IsNullOrEmpty(this.txtCondition.Text.Trim()))
            {
                //NP_Cls.sqlSelect += " AND (ORDNUMBER = '" + (this.txtCondition.Text.Trim().Replace("-", string.Empty)).Substring(0, 9) + "') ";
                this.rgCom.Visible = true;
            }
            else
            {
                //NP_Cls.sqlSelect += " AND (1=0) ";
                this.rgCom.Visible = false;
            }
           
            DataSet ds = new DataSet(); ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.rgCom.DataSource = ds.Tables[0];
            if (ty == 1)
            {
                this.rgCom.DataBind();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtCondition.Text.Trim()))
            {
                this.NotifyWarn.Text = "Please entry Condition !!";
                this.NotifyWarn.Show(); 
            }
            DGV(1);
            DGVTotal(1);
        }

        protected void rgCost_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFooterItem)
            {
                try
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["clnMargin"].Text = (((double.Parse(footerItem["clnTotalPrice"].Text.Trim()) - double.Parse(footerItem["clnTotalCost"].Text.Trim())) / double.Parse(footerItem["clnTotalCost"].Text.Trim())) * 100).ToString("##.##") + "%";
                }
                catch
                {
                }

            }
        }
        protected void rgCost_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }
        protected void rgCom_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DGVTotal(0);
        }
    
    }
}