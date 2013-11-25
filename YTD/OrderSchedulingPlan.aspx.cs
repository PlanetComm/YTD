using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Web.UI.HtmlControls;
using System.Drawing;
using Telerik.Web.UI.GridExcelBuilder;

namespace YTD
{
    public partial class OrderSchedulingPlan : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.txtSO.Text = string.Empty;
                this.txtSO.Focus();
            }
        }

        void DGV(byte type)
        {
            if (string.IsNullOrEmpty(this.txtSO.Text.Trim())) { return; }
            DataSet dsMain = new DataSet();
            dsMain = NP.Execute("SELECT   ORDNUMBER, CUST, VDNAME, PONUMBER, ITEMNO, ITEMDESC, EXPDATE, EXPARRIVAL, REQDATE, EXPDATE_, EXPARRIVAL_,  REQDATE_, A, B, C FROM vw_OrderSchedulingPlan  WHERE     (ORDNUMBER LIKE '" + this.txtSO.Text.Trim() + "%')", ref NP_Cls.strErr);
            this.lblC.Text = dsMain.Tables[0].Rows.Count.ToString("#,0");
            if (dsMain.Tables[0].Rows.Count == 0) { return; }

            
            //Add Column
            dsMain.Tables[0].Columns.Add(new DataColumn("JAN", typeof(System.String))); dsMain.Tables[0].Columns.Add(new DataColumn("FEB", typeof(System.String)));
            dsMain.Tables[0].Columns.Add(new DataColumn("MAR", typeof(System.String))); dsMain.Tables[0].Columns.Add(new DataColumn("APR", typeof(System.String)));
            dsMain.Tables[0].Columns.Add(new DataColumn("MAY", typeof(System.String))); dsMain.Tables[0].Columns.Add(new DataColumn("JUN", typeof(System.String)));
            dsMain.Tables[0].Columns.Add(new DataColumn("JUL", typeof(System.String))); dsMain.Tables[0].Columns.Add(new DataColumn("AUG", typeof(System.String)));
            dsMain.Tables[0].Columns.Add(new DataColumn("SEP", typeof(System.String))); dsMain.Tables[0].Columns.Add(new DataColumn("OCT", typeof(System.String)));
            dsMain.Tables[0].Columns.Add(new DataColumn("NOV", typeof(System.String))); dsMain.Tables[0].Columns.Add(new DataColumn("DEC", typeof(System.String))); 

            for (int i = 0; i < dsMain.Tables[0].Rows.Count; i++)
            {
                switch (dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[0].ToString())
                {
                    case "1":
                        dsMain.Tables[0].Rows[i]["JAN"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "2":
                        dsMain.Tables[0].Rows[i]["FEB"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "3":
                        dsMain.Tables[0].Rows[i]["MAR"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "4":
                        dsMain.Tables[0].Rows[i]["APR"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "5":
                        dsMain.Tables[0].Rows[i]["MAY"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "6":
                        dsMain.Tables[0].Rows[i]["JUN"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "7":
                        dsMain.Tables[0].Rows[i]["JUL"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "8":
                        dsMain.Tables[0].Rows[i]["AUG"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "9":
                        dsMain.Tables[0].Rows[i]["SEP"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();; //"<img alt=\"Exp ship date\" src=\"img/flag_yellow.png\" />";
                        break;
                    case "10":
                        dsMain.Tables[0].Rows[i]["OCT"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "11":
                        dsMain.Tables[0].Rows[i]["NOV"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "12":
                        dsMain.Tables[0].Rows[i]["DEC"] = "A" + dsMain.Tables[0].Rows[i]["A"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    default:
                        break;
                }

                switch (dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[0].ToString())
                {
                    case "1":
                        dsMain.Tables[0].Rows[i]["JAN"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "2":
                        dsMain.Tables[0].Rows[i]["FEB"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "3":
                        dsMain.Tables[0].Rows[i]["MAR"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "4":
                        dsMain.Tables[0].Rows[i]["APR"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "5":
                        dsMain.Tables[0].Rows[i]["MAY"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "6":
                        dsMain.Tables[0].Rows[i]["JUN"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "7":
                        dsMain.Tables[0].Rows[i]["JUL"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "8":
                        dsMain.Tables[0].Rows[i]["AUG"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "9":
                        dsMain.Tables[0].Rows[i]["SEP"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString(); ; //"<img alt=\"Exp ship date\" src=\"img/flag_yellow.png\" />";
                        break;
                    case "10":
                        dsMain.Tables[0].Rows[i]["OCT"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "11":
                        dsMain.Tables[0].Rows[i]["NOV"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "12":
                        dsMain.Tables[0].Rows[i]["DEC"] += "B" + dsMain.Tables[0].Rows[i]["B"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    default:
                        break;
                }

                switch (dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[0].ToString())
                {
                    case "1":
                        dsMain.Tables[0].Rows[i]["JAN"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "2":
                        dsMain.Tables[0].Rows[i]["FEB"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "3":
                        dsMain.Tables[0].Rows[i]["MAR"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "4":
                        dsMain.Tables[0].Rows[i]["APR"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "5":
                        dsMain.Tables[0].Rows[i]["MAY"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "6":
                        dsMain.Tables[0].Rows[i]["JUN"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "7":
                        dsMain.Tables[0].Rows[i]["JUL"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "8":
                        dsMain.Tables[0].Rows[i]["AUG"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "9":
                        dsMain.Tables[0].Rows[i]["SEP"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString(); ; //"<img alt=\"Exp ship date\" src=\"img/flag_yellow.png\" />";
                        break;
                    case "10":
                        dsMain.Tables[0].Rows[i]["OCT"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "11":
                        dsMain.Tables[0].Rows[i]["NOV"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    case "12":
                        dsMain.Tables[0].Rows[i]["DEC"] += "C" + dsMain.Tables[0].Rows[i]["C"].ToString().Trim().Split(':')[1].ToString();
                        break;
                    default:
                        break;
                }
            }          

            this.RadGrid1.DataSource = dsMain.Tables[0];
            //string mm = DateTime.Now.ToString("MM", NP_Cls.cul);
            //for (int i = 0; i < this.RadGrid1.Columns.Count; i++)
            //{
            //    for (int j = 1; j < int.Parse(mm) - 1; j++)
            //    {
            //        DateTime dtDate = new DateTime(2000, j, 1);
            //        if (this.RadGrid1.Columns[i].HeaderText.ToUpper() == dtDate.ToString("MMM", NP_Cls.cul).ToUpper())
            //        {
            //            this.RadGrid1.Columns[i].Display = false;
            //        }
            //    }
            //}
            if (type == 1) { this.RadGrid1.DataBind(); }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtSO.Text.Trim()))
            {
                this.NotifyWarn.Text = "Please entry Sales Order No. !!!"; this.NotifyWarn.Show(); return;
            }
            DGV(1);
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

                // Exp ------------------------------------------------------------------------------------------------------------
                Label lblJan = (Label)item["clnJan"].FindControl("lblJan");
                switch ((string.IsNullOrEmpty(lblJan.Text.Trim()) ? string.Empty : lblJan.Text.Trim().Substring(lblJan.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Sep1 = (HtmlTableCell)item["clnJan"].FindControl("tdJan1");
                        Sep1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Sep2 = (HtmlTableCell)item["clnJan"].FindControl("tdJan2");
                        Sep2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Sep3 = (HtmlTableCell)item["clnJan"].FindControl("tdJan3");
                        Sep3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Sep4 = (HtmlTableCell)item["clnJan"].FindControl("tdJan4");
                        Sep4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblFeb = (Label)item["clnFeb"].FindControl("lblFeb");
                switch ((string.IsNullOrEmpty(lblFeb.Text.Trim()) ? string.Empty : lblFeb.Text.Trim().Substring(lblFeb.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Feb1 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb1");
                        Feb1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Feb2 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb2");
                        Feb2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Feb3 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb3");
                        Feb3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Feb4 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb4");
                        Feb4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblMar = (Label)item["clnMar"].FindControl("lblMar");
                switch ((string.IsNullOrEmpty(lblMar.Text.Trim()) ? string.Empty : lblMar.Text.Trim().Substring(lblMar.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Mar1 = (HtmlTableCell)item["clnMar"].FindControl("tdMar1");
                        Mar1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Mar2 = (HtmlTableCell)item["clnMar"].FindControl("tdMar2");
                        Mar2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Mar3 = (HtmlTableCell)item["clnMar"].FindControl("tdMar3");
                        Mar3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Mar4 = (HtmlTableCell)item["clnMar"].FindControl("tdMar4");
                        Mar4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblApr = (Label)item["clnApr"].FindControl("lblApr");
                switch ((string.IsNullOrEmpty(lblApr.Text.Trim()) ? string.Empty : lblApr.Text.Trim().Substring(lblApr.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Apr1 = (HtmlTableCell)item["clnApr"].FindControl("tdApr1");
                        Apr1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Apr2 = (HtmlTableCell)item["clnApr"].FindControl("tdApr2");
                        Apr2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Apr3 = (HtmlTableCell)item["clnApr"].FindControl("tdApr3");
                        Apr3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Apr4 = (HtmlTableCell)item["clnApr"].FindControl("tdApr4");
                        Apr4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblMay = (Label)item["clnMay"].FindControl("lblMay");
                switch ((string.IsNullOrEmpty(lblMay.Text.Trim()) ? string.Empty : lblMay.Text.Trim().Substring(lblMay.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell May1 = (HtmlTableCell)item["clnMay"].FindControl("tdMay1");
                        May1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell May2 = (HtmlTableCell)item["clnMay"].FindControl("tdMay2");
                        May2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell May3 = (HtmlTableCell)item["clnMay"].FindControl("tdMay3");
                        May3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell May4 = (HtmlTableCell)item["clnMay"].FindControl("tdMay4");
                        May4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblJun = (Label)item["clnJun"].FindControl("lblJun");
                switch ((string.IsNullOrEmpty(lblJun.Text.Trim()) ? string.Empty : lblJun.Text.Trim().Substring(lblJun.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Jun1 = (HtmlTableCell)item["clnJun"].FindControl("tdJun1");
                        Jun1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Jun2 = (HtmlTableCell)item["clnJun"].FindControl("tdJun2");
                        Jun2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Jun3 = (HtmlTableCell)item["clnJun"].FindControl("tdJun3");
                        Jun3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Jun4 = (HtmlTableCell)item["clnJun"].FindControl("tdJun4");
                        Jun4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblJul = (Label)item["clnJul"].FindControl("lblJul");
                switch ((string.IsNullOrEmpty(lblJul.Text.Trim()) ? string.Empty : lblJul.Text.Trim().Substring(lblJul.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Jul1 = (HtmlTableCell)item["clnJul"].FindControl("tdJul1");
                        Jul1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Jul2 = (HtmlTableCell)item["clnJul"].FindControl("tdJul2");
                        Jul2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Jul3 = (HtmlTableCell)item["clnJul"].FindControl("tdJul3");
                        Jul3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Jul4 = (HtmlTableCell)item["clnJul"].FindControl("tdJul4");
                        Jul4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblAug = (Label)item["clnAug"].FindControl("lblAug");
                switch ((string.IsNullOrEmpty(lblAug.Text.Trim()) ? string.Empty : lblAug.Text.Trim().Substring(lblAug.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Aug1 = (HtmlTableCell)item["clnAug"].FindControl("tdAug1");
                        Aug1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Aug2 = (HtmlTableCell)item["clnAug"].FindControl("tdAug2");
                        Aug2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Aug3 = (HtmlTableCell)item["clnAug"].FindControl("tdAug3");
                        Aug3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Aug4 = (HtmlTableCell)item["clnAug"].FindControl("tdAug4");
                        Aug4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblSep = (Label)item["clnSep"].FindControl("lblSep");
                switch ((string.IsNullOrEmpty(lblSep.Text.Trim()) ? string.Empty : lblSep.Text.Trim().Substring(lblSep.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Sep1 = (HtmlTableCell)item["clnSep"].FindControl("tdSep1");
                        Sep1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Sep2 = (HtmlTableCell)item["clnSep"].FindControl("tdSep2");
                        Sep2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        
                        break;
                    case "3":
                        HtmlTableCell Sep3 = (HtmlTableCell)item["clnSep"].FindControl("tdSep3");
                        Sep3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Sep4 = (HtmlTableCell)item["clnSep"].FindControl("tdSep4");
                        Sep4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblOct = (Label)item["clnOct"].FindControl("lblOct");
                switch ((string.IsNullOrEmpty(lblOct.Text.Trim()) ? string.Empty : lblOct.Text.Trim().Substring(lblOct.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Oct1 = (HtmlTableCell)item["clnOct"].FindControl("tdOct1");
                        Oct1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Oct2 = (HtmlTableCell)item["clnOct"].FindControl("tdOct2");
                        Oct2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Oct3 = (HtmlTableCell)item["clnOct"].FindControl("tdOct3");
                        Oct3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Oct4 = (HtmlTableCell)item["clnOct"].FindControl("tdOct4");
                        Oct4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblNov = (Label)item["clnNov"].FindControl("lblNov");
                switch ((string.IsNullOrEmpty(lblNov.Text.Trim()) ? string.Empty : lblNov.Text.Trim().Substring(lblNov.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Nov1 = (HtmlTableCell)item["clnNov"].FindControl("tdNov1");
                        Nov1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Nov2 = (HtmlTableCell)item["clnNov"].FindControl("tdNov2");
                        Nov2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Nov3 = (HtmlTableCell)item["clnNov"].FindControl("tdNov3");
                        Nov3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Nov4 = (HtmlTableCell)item["clnNov"].FindControl("tdNov4");
                        Nov4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }

                Label lblDec = (Label)item["clnDec"].FindControl("lblDec");
                switch ((string.IsNullOrEmpty(lblDec.Text.Trim()) ? string.Empty : lblDec.Text.Trim().Substring(lblDec.Text.Trim().IndexOf("A") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Dec1 = (HtmlTableCell)item["clnDec"].FindControl("tdDec1");
                        Dec1.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Dec2 = (HtmlTableCell)item["clnDec"].FindControl("tdDec2");
                        Dec2.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Dec3 = (HtmlTableCell)item["clnDec"].FindControl("tdDec3");
                        Dec3.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Dec4 = (HtmlTableCell)item["clnDec"].FindControl("tdDec4");
                        Dec4.InnerHtml = "<img alt=\"Exp ship date\" src=\"http://192.168.73.39\\SchImg\\flag_yellow.png\" />";
                        break;
                }


                // PO ETA --------------------------------------------------------------------------------------------------
                switch ((string.IsNullOrEmpty(lblJan.Text.Trim()) ? string.Empty : lblJan.Text.Trim().Substring(lblJan.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Sep1 = (HtmlTableCell)item["clnJan"].FindControl("tdJan1");
                        Sep1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Sep2 = (HtmlTableCell)item["clnJan"].FindControl("tdJan2");
                        Sep2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Sep3 = (HtmlTableCell)item["clnJan"].FindControl("tdJan3");
                        Sep3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Sep4 = (HtmlTableCell)item["clnJan"].FindControl("tdJan4");
                        Sep4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblFeb.Text.Trim()) ? string.Empty : lblFeb.Text.Trim().Substring(lblFeb.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Feb1 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb1");
                        Feb1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Feb2 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb2");
                        Feb2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Feb3 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb3");
                        Feb3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Feb4 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb4");
                        Feb4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblMar.Text.Trim()) ? string.Empty : lblMar.Text.Trim().Substring(lblMar.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Mar1 = (HtmlTableCell)item["clnMar"].FindControl("tdMar1");
                        Mar1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Mar2 = (HtmlTableCell)item["clnMar"].FindControl("tdMar2");
                        Mar2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Mar3 = (HtmlTableCell)item["clnMar"].FindControl("tdMar3");
                        Mar3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Mar4 = (HtmlTableCell)item["clnMar"].FindControl("tdMar4");
                        Mar4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblApr.Text.Trim()) ? string.Empty : lblApr.Text.Trim().Substring(lblApr.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Apr1 = (HtmlTableCell)item["clnApr"].FindControl("tdApr1");
                        Apr1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Apr2 = (HtmlTableCell)item["clnApr"].FindControl("tdApr2");
                        Apr2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Apr3 = (HtmlTableCell)item["clnApr"].FindControl("tdApr3");
                        Apr3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Apr4 = (HtmlTableCell)item["clnApr"].FindControl("tdApr4");
                        Apr4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblMay.Text.Trim()) ? string.Empty : lblMay.Text.Trim().Substring(lblMay.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell May1 = (HtmlTableCell)item["clnMay"].FindControl("tdMay1");
                        May1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell May2 = (HtmlTableCell)item["clnMay"].FindControl("tdMay2");
                        May2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell May3 = (HtmlTableCell)item["clnMay"].FindControl("tdMay3");
                        May3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell May4 = (HtmlTableCell)item["clnMay"].FindControl("tdMay4");
                        May4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblJun.Text.Trim()) ? string.Empty : lblJun.Text.Trim().Substring(lblJun.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Jun1 = (HtmlTableCell)item["clnJun"].FindControl("tdJun1");
                        Jun1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Jun2 = (HtmlTableCell)item["clnJun"].FindControl("tdJun2");
                        Jun2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Jun3 = (HtmlTableCell)item["clnJun"].FindControl("tdJun3");
                        Jun3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Jun4 = (HtmlTableCell)item["clnJun"].FindControl("tdJun4");
                        Jun4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblJul.Text.Trim()) ? string.Empty : lblJul.Text.Trim().Substring(lblJul.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Jul1 = (HtmlTableCell)item["clnJul"].FindControl("tdJul1");
                        Jul1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Jul2 = (HtmlTableCell)item["clnJul"].FindControl("tdJul2");
                        Jul2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Jul3 = (HtmlTableCell)item["clnJul"].FindControl("tdJul3");
                        Jul3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Jul4 = (HtmlTableCell)item["clnJul"].FindControl("tdJul4");
                        Jul4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblAug.Text.Trim()) ? string.Empty : lblAug.Text.Trim().Substring(lblAug.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Aug1 = (HtmlTableCell)item["clnAug"].FindControl("tdAug1");
                        Aug1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Aug2 = (HtmlTableCell)item["clnAug"].FindControl("tdAug2");
                        Aug2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Aug3 = (HtmlTableCell)item["clnAug"].FindControl("tdAug3");
                        Aug3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Aug4 = (HtmlTableCell)item["clnAug"].FindControl("tdAug4");
                        Aug4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblSep.Text.Trim()) ? string.Empty : lblSep.Text.Trim().Substring(lblSep.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Sep1 = (HtmlTableCell)item["clnSep"].FindControl("tdSep1");
                        Sep1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Sep2 = (HtmlTableCell)item["clnSep"].FindControl("tdSep2");
                        Sep2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Sep3 = (HtmlTableCell)item["clnSep"].FindControl("tdSep3");
                        Sep3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Sep4 = (HtmlTableCell)item["clnSep"].FindControl("tdSep4");
                        Sep4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblOct.Text.Trim()) ? string.Empty : lblOct.Text.Trim().Substring(lblOct.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Oct1 = (HtmlTableCell)item["clnOct"].FindControl("tdOct1");
                        Oct1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Oct2 = (HtmlTableCell)item["clnOct"].FindControl("tdOct2");
                        Oct2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Oct3 = (HtmlTableCell)item["clnOct"].FindControl("tdOct3");
                        Oct3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Oct4 = (HtmlTableCell)item["clnOct"].FindControl("tdOct4");
                        Oct4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblNov.Text.Trim()) ? string.Empty : lblNov.Text.Trim().Substring(lblNov.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Nov1 = (HtmlTableCell)item["clnNov"].FindControl("tdNov1");
                        Nov1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Nov2 = (HtmlTableCell)item["clnNov"].FindControl("tdNov2");
                        Nov2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Nov3 = (HtmlTableCell)item["clnNov"].FindControl("tdNov3");
                        Nov3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Nov4 = (HtmlTableCell)item["clnNov"].FindControl("tdNov4");
                        Nov4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblDec.Text.Trim()) ? string.Empty : lblDec.Text.Trim().Substring(lblDec.Text.Trim().IndexOf("B") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Dec1 = (HtmlTableCell)item["clnDec"].FindControl("tdDec1");
                        Dec1.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Dec2 = (HtmlTableCell)item["clnDec"].FindControl("tdDec2");
                        Dec2.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Dec3 = (HtmlTableCell)item["clnDec"].FindControl("tdDec3");
                        Dec3.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Dec4 = (HtmlTableCell)item["clnDec"].FindControl("tdDec4");
                        Dec4.InnerHtml += "<img alt=\"PO ETA\" src=\"http://192.168.73.39\\SchImg\\flag_green.png\" />";
                        break;
                }


                // Contract Date --------------------------------------------------------------------------------------------------
                switch ((string.IsNullOrEmpty(lblJan.Text.Trim()) ? string.Empty : lblJan.Text.Trim().Substring(lblJan.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Sep1 = (HtmlTableCell)item["clnJan"].FindControl("tdJan1");
                        Sep1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Sep2 = (HtmlTableCell)item["clnJan"].FindControl("tdJan2");
                        Sep2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Sep3 = (HtmlTableCell)item["clnJan"].FindControl("tdJan3");
                        Sep3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Sep4 = (HtmlTableCell)item["clnJan"].FindControl("tdJan4");
                        Sep4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblFeb.Text.Trim()) ? string.Empty : lblFeb.Text.Trim().Substring(lblFeb.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Feb1 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb1");
                        Feb1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Feb2 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb2");
                        Feb2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Feb3 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb3");
                        Feb3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Feb4 = (HtmlTableCell)item["clnFeb"].FindControl("tdFeb4");
                        Feb4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblMar.Text.Trim()) ? string.Empty : lblMar.Text.Trim().Substring(lblMar.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Mar1 = (HtmlTableCell)item["clnMar"].FindControl("tdMar1");
                        Mar1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Mar2 = (HtmlTableCell)item["clnMar"].FindControl("tdMar2");
                        Mar2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Mar3 = (HtmlTableCell)item["clnMar"].FindControl("tdMar3");
                        Mar3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Mar4 = (HtmlTableCell)item["clnMar"].FindControl("tdMar4");
                        Mar4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblApr.Text.Trim()) ? string.Empty : lblApr.Text.Trim().Substring(lblApr.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Apr1 = (HtmlTableCell)item["clnApr"].FindControl("tdApr1");
                        Apr1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Apr2 = (HtmlTableCell)item["clnApr"].FindControl("tdApr2");
                        Apr2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Apr3 = (HtmlTableCell)item["clnApr"].FindControl("tdApr3");
                        Apr3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Apr4 = (HtmlTableCell)item["clnApr"].FindControl("tdApr4");
                        Apr4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblMay.Text.Trim()) ? string.Empty : lblMay.Text.Trim().Substring(lblMay.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell May1 = (HtmlTableCell)item["clnMay"].FindControl("tdMay1");
                        May1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell May2 = (HtmlTableCell)item["clnMay"].FindControl("tdMay2");
                        May2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell May3 = (HtmlTableCell)item["clnMay"].FindControl("tdMay3");
                        May3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell May4 = (HtmlTableCell)item["clnMay"].FindControl("tdMay4");
                        May4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblJun.Text.Trim()) ? string.Empty : lblJun.Text.Trim().Substring(lblJun.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Jun1 = (HtmlTableCell)item["clnJun"].FindControl("tdJun1");
                        Jun1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Jun2 = (HtmlTableCell)item["clnJun"].FindControl("tdJun2");
                        Jun2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Jun3 = (HtmlTableCell)item["clnJun"].FindControl("tdJun3");
                        Jun3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Jun4 = (HtmlTableCell)item["clnJun"].FindControl("tdJun4");
                        Jun4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblJul.Text.Trim()) ? string.Empty : lblJul.Text.Trim().Substring(lblJul.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Jul1 = (HtmlTableCell)item["clnJul"].FindControl("tdJul1");
                        Jul1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Jul2 = (HtmlTableCell)item["clnJul"].FindControl("tdJul2");
                        Jul2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Jul3 = (HtmlTableCell)item["clnJul"].FindControl("tdJul3");
                        Jul3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Jul4 = (HtmlTableCell)item["clnJul"].FindControl("tdJul4");
                        Jul4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblAug.Text.Trim()) ? string.Empty : lblAug.Text.Trim().Substring(lblAug.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Aug1 = (HtmlTableCell)item["clnAug"].FindControl("tdAug1");
                        Aug1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Aug2 = (HtmlTableCell)item["clnAug"].FindControl("tdAug2");
                        Aug2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Aug3 = (HtmlTableCell)item["clnAug"].FindControl("tdAug3");
                        Aug3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Aug4 = (HtmlTableCell)item["clnAug"].FindControl("tdAug4");
                        Aug4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblSep.Text.Trim()) ? string.Empty : lblSep.Text.Trim().Substring(lblSep.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Sep1 = (HtmlTableCell)item["clnSep"].FindControl("tdSep1");
                        Sep1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Sep2 = (HtmlTableCell)item["clnSep"].FindControl("tdSep2");
                        Sep2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Sep3 = (HtmlTableCell)item["clnSep"].FindControl("tdSep3");
                        Sep3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Sep4 = (HtmlTableCell)item["clnSep"].FindControl("tdSep4");
                        Sep4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblOct.Text.Trim()) ? string.Empty : lblOct.Text.Trim().Substring(lblOct.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Oct1 = (HtmlTableCell)item["clnOct"].FindControl("tdOct1");
                        Oct1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Oct2 = (HtmlTableCell)item["clnOct"].FindControl("tdOct2");
                        Oct2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Oct3 = (HtmlTableCell)item["clnOct"].FindControl("tdOct3");
                        Oct3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Oct4 = (HtmlTableCell)item["clnOct"].FindControl("tdOct4");
                        Oct4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblNov.Text.Trim()) ? string.Empty : lblNov.Text.Trim().Substring(lblNov.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Nov1 = (HtmlTableCell)item["clnNov"].FindControl("tdNov1");
                        Nov1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Nov2 = (HtmlTableCell)item["clnNov"].FindControl("tdNov2");
                        Nov2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Nov3 = (HtmlTableCell)item["clnNov"].FindControl("tdNov3");
                        Nov3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Nov4 = (HtmlTableCell)item["clnNov"].FindControl("tdNov4");
                        Nov4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

                switch ((string.IsNullOrEmpty(lblDec.Text.Trim()) ? string.Empty : lblDec.Text.Trim().Substring(lblDec.Text.Trim().IndexOf("C") + 1, 1)))
                {
                    case "1":
                        HtmlTableCell Dec1 = (HtmlTableCell)item["clnDec"].FindControl("tdDec1");
                        Dec1.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "2":
                        HtmlTableCell Dec2 = (HtmlTableCell)item["clnDec"].FindControl("tdDec2");
                        Dec2.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "3":
                        HtmlTableCell Dec3 = (HtmlTableCell)item["clnDec"].FindControl("tdDec3");
                        Dec3.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                    case "4":
                        HtmlTableCell Dec4 = (HtmlTableCell)item["clnDec"].FindControl("tdDec4");
                        Dec4.InnerHtml += "<img alt=\"Contract Date\" src=\"http://192.168.73.39\\SchImg\\flag_red.png\" />";
                        break;
                }

            }
        }
        private void ConfigureExport()
        {
            this.RadGrid1.ExportSettings.ExportOnlyData = false;
            this.RadGrid1.ExportSettings.Excel.Format = GridExcelExportFormat.Html;
            this.RadGrid1.ExportSettings.IgnorePaging = true;
            this.RadGrid1.ExportSettings.FileName = "Scheduling_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul);

            //RadGridExporter exporter = new RadGridExporter();
            //exporter.FileName = "Scheduling_" + DateTime.Now.ToString("ddMMMyy", NP_Cls.cul) + ".xls";
            //exporter.Export(RadGrid1);
        }
        bool isExport = false;
        protected void btnExport_Click(object sender, EventArgs e)
        {
            if (this.RadGrid1.Items.Count == 0) { this.NotifyWarn.Text = "Data Not Found to Export !!"; this.NotifyWarn.Show(); return; }
            isExport = true;
            ConfigureExport();
            this.RadGrid1.MasterTableView.ExportToExcel();
        }

  
    }
}