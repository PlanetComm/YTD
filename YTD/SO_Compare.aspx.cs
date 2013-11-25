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
    public partial class SO_Compare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DGV(1);
            }
        }
        NP_Cls NP = new NP_Cls(); int iRow = 0;
        private void DGV(byte ty)
        {
            DataSet dsSales = new DataSet(); DataSet dsCate = new DataSet();
            dsSales = NP.Execute("SELECT     vw_Compare_SALES.SALES_SO, vw_Compare_SALES.SALES_AMT, vw_Compare_MKT.MKT_SO,     vw_Compare_MKT.MKT_AMT FROM         vw_Compare_MKT LEFT OUTER JOIN                      vw_Compare_SALES ON vw_Compare_MKT.MKT_SO = vw_Compare_SALES.SALES_SO ORDER BY vw_Compare_SALES.SALES_SO, vw_Compare_MKT.MKT_SO", ref NP_Cls.strErr); 
            if (dsSales.Tables[0].Rows.Count > 0)
            {

                this.RadGrid1.DataSource = dsSales.Tables[0];

                //dsCate = NP.Execute("SELECT * FROM vw_Compare_MKT", ref NP_Cls.strErr);
                //if (dsCate.Tables[0].Rows.Count > 0)
                //{
                //    dsSales.Tables[0].Columns.Add(new DataColumn("MKT_SO", typeof(System.String)));
                //    dsSales.Tables[0].Columns.Add(new DataColumn("MKT_CATE", typeof(System.String)));
                //    dsSales.Tables[0].Columns.Add(new DataColumn("MKT_AMT", typeof(System.Double)));

                //    for (int ss = 0; ss < dsSales.Tables[0].Rows.Count; ss++)
                //    {
                //        iRow = 0;
                //        for (int cc = 0; cc < dsCate.Tables[0].Rows.Count; cc++)
                //        {
                //            if (dsSales.Tables[0].Rows[ss]["SALES_SO"].ToString().Trim().Equals(dsCate.Tables[0].Rows[cc]["MKT_SO"].ToString().Trim()))
                //            {
                //                if (iRow == 0)
                //                {
                //                    dsSales.Tables[0].Rows[ss]["MKT_SO"] = dsCate.Tables[0].Rows[ss]["MKT_SO"].ToString();
                //                    dsSales.Tables[0].Rows[ss]["MKT_CATE"] = dsCate.Tables[0].Rows[ss]["MKT_CATE"].ToString();
                //                    dsSales.Tables[0].Rows[ss]["MKT_AMT"] = double.Parse(dsCate.Tables[0].Rows[ss]["MKT_AMT"].ToString());
                //                }
                //                else
                //                {
                //                    DataRow dr; dr = dsSales.Tables[0].NewRow();
                //                    dr["MKT_SO"] = dsCate.Tables[0].Rows[ss]["MKT_SO"].ToString();
                //                    dr["MKT_CATE"] = dsCate.Tables[0].Rows[ss]["MKT_CATE"].ToString();
                //                    dr["MKT_AMT"] = double.Parse(dsCate.Tables[0].Rows[ss]["MKT_AMT"].ToString());
                                  
                //                }
                //            }
                //            else
                //            {
                //                break;
                //            }
                //        }

                //    }
                //}

            }
            //this.RadGrid1.DataSource = .Tables[0];
            if (ty == 1)
                this.RadGrid1.DataBind();

            string tmpSO = string.Empty;
            for (int i = 0; i < this.RadGrid1.Items.Count; i++)
            {
                if (i == 0)
                {
                    tmpSO = this.RadGrid1.Items[i]["clnSALESSO"].Text.Trim();
                }
                else
                {
                    if (tmpSO.Equals(this.RadGrid1.Items[i]["clnSALESSO"].Text.Trim()))
                    {
                        this.RadGrid1.Items[i]["clnSALESSO"].Text = string.Empty;
                        this.RadGrid1.Items[i]["clnSALESAMT"].Text = string.Empty;
                    }
                    else
                    {
                        tmpSO = this.RadGrid1.Items[i]["clnSALESSO"].Text.Trim();
                    }
                }
            }

        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DGV(0);
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                if (!item["clnSALESAMT"].Text.Trim().Equals(item["clnMKTAMT"].Text.Trim()))
                {
                    item.BackColor = Color.Orchid;
                } 
            }
        }
    }
}