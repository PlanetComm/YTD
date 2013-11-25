using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Net;
using System.Drawing;

namespace YTD
{
    public partial class OrderManagement : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NP_Cls.sqlSelect = "SELECT     FMTCONTNO AS Code, CONVERT(nvarchar, CASE PMCONTS.STATUS WHEN 30 THEN 'Open' WHEN 10 THEN 'Estimate' WHEN 60 THEN 'Completed' END)                       + ' : ' + CONVERT(nvarchar, FMTCONTNO) + ' : ' + RTRIM([DESC]) AS [Desc], RTRIM([DESC]) AS Sort_ FROM         PMCONTS WHERE     (STATUS IN (30, 10, 60)) ORDER BY STATUS, Sort_";
                DataSet ds = new DataSet(); ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr); DataRow dr;
                dr = ds.Tables[0].NewRow(); dr[0] = "0"; dr[1] = "=========== Select PJC Contract ========="; ds.Tables[0].Rows.InsertAt(dr, 0);
                this.cbContract.DataSource = ds.Tables[0]; this.cbContract.DataTextField = "DESC";
                this.cbContract.DataValueField = "CODE"; this.cbContract.DataBind();

                //this.RadGrid1.DataSource = NP.Execute(getStrc(null), ref NP_Cls.strErr).Tables[0]; this.RadGrid1.DataBind();
                this.cbContract.Focus();

                if (Request.QueryString["CT"] != null)
                {
                    for (int i = 0; i < this.cbContract.Items.Count; i++)
                    {
                        if (this.cbContract.Items[i].Text.Trim().Contains(Request.QueryString["CT"].ToString()))
                        {
                            this.cbContract.SelectedIndex = i; break; ;
                        }
                    }
                    DGV(1);

                }

            }
        }
        void DGV(byte type)
        {
            DataSet dsMain = new DataSet();
            dsMain = NP.Execute("stp_PJC_get_Info_withOut_Site '" + this.cbContract.SelectedValue.ToString().Trim() + "'", ref NP_Cls.strErr);

            if (dsMain.Tables[0].Rows.Count == 0) { return; }

            //Add Column UNITPRC
            dsMain.Tables[0].Columns.Add("UNITPRC", typeof(System.Decimal)); dsMain.Tables[0].Columns.Add("TOTALPRC", typeof(System.Decimal)); dsMain.Tables[0].Columns.Add("TT", typeof(System.String));
            dsMain.Tables[0].Columns.Add("ItemNo", typeof(System.Int16)); dsMain.Tables[0].Columns.Add("PG", typeof(System.String));

            dsMain.Tables[0].Columns.Add("UID", typeof(System.String));

            DataSet dsCom = new DataSet();
            dsCom = NP.Execute("SELECT     PMRES.CONTRACT AS CONTR, ICCATG.CATEGORY, CAST(PMRESO.VALUE AS numeric(18, 3)) AS UNITPRC, PMRES.ORJQTY * PMRESO.VALUE AS NET,                       PMRES.RESOURCE AS ITEM, ICITEM.[DESC], ISNULL(OEORDH.ORRATE,1) AS ORRATE, PMRES.PLINENUM, PMRES.CLINENUM FROM         PMRES INNER JOIN                       PMRESO ON PMRES.CTUNIQ = PMRESO.CTUNIQ AND PMRES.PLINENUM = PMRESO.PLINENUM AND PMRES.CLINENUM = PMRESO.CLINENUM INNER JOIN                       ICITEM ON PMRES.ITEMNO = ICITEM.ITEMNO INNER JOIN                      ICCATG ON ICITEM.CATEGORY = ICCATG.CATEGORY LEFT OUTER JOIN                       OEORDH ON LEFT(PMRES.CONTRACT, 9) = OEORDH.ORDNUMBER WHERE      (PMRESO.OPTFIELD = 'SALES') AND (PMRES.CONTRACT = '" + this.cbContract.SelectedValue.ToString().Trim().Replace("-", string.Empty) + "')", ref NP_Cls.strErr);
            if (dsCom.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dsMain.Tables[0].Rows.Count; i++)
                {
                    for (int j = 0; j < dsCom.Tables[0].Rows.Count; j++)
                    {
                        if (dsMain.Tables[0].Rows[i]["Main_Item"].ToString().Trim().CompareTo(dsCom.Tables[0].Rows[j]["ITEM"].ToString().Trim()) == 0)
                        {
                            dsMain.Tables[0].Rows[i]["UNITPRC"] = double.Parse(dsCom.Tables[0].Rows[j]["UNITPRC"].ToString()) * double.Parse(dsCom.Tables[0].Rows[j]["ORRATE"].ToString());
                            dsMain.Tables[0].Rows[i]["TOTALPRC"] = double.Parse(dsMain.Tables[0].Rows[i]["UNITPRC"].ToString()) * double.Parse(dsMain.Tables[0].Rows[i]["QTY"].ToString());
                            dsMain.Tables[0].Rows[i]["PG"] = dsCom.Tables[0].Rows[j]["CATEGORY"].ToString();

                            dsMain.Tables[0].Rows[i]["UID"] = dsCom.Tables[0].Rows[j]["PLINENUM"].ToString() + ":" + dsCom.Tables[0].Rows[j]["CLINENUM"].ToString();
                        }
                    }


                    if (!string.IsNullOrEmpty(dsMain.Tables[0].Rows[i]["Allocate_Ref_No"].ToString().Trim()))
                    {
                        dsMain.Tables[0].Rows[i]["TT"] = "T";
                    }
                    else
                    {
                        if ((!string.IsNullOrEmpty(dsMain.Tables[0].Rows[i]["PO_Receipt_No"].ToString().Trim())) && (dsMain.Tables[0].Rows[i]["PO_Receipt_No"].ToString().Trim() != "-"))
                        {
                            dsMain.Tables[0].Rows[i]["TT"] = "R";
                        }
                        else
                        {                                            

                            if ((!string.IsNullOrEmpty(dsMain.Tables[0].Rows[i]["PO_Issue_No"].ToString().Trim())) && (dsMain.Tables[0].Rows[i]["PO_Issue_No"].ToString().Trim() != "-"))
                            {
                                //GET PO UNIT COST
                                DataSet dsPOU = new DataSet();
                                dsPOU = NP.Execute("SELECT     SUM(POPORL.UNITCOST) AS UC FROM         POPORH1 INNER JOIN                      POPORL ON POPORH1.PORHSEQ = POPORL.PORHSEQ WHERE     (POPORH1.PONUMBER = '" + dsMain.Tables[0].Rows[i]["PO_Issue_No"].ToString().Trim() + "') GROUP BY POPORH1.PONUMBER", ref NP_Cls.strErr);
                                if (dsPOU.Tables[0].Rows.Count > 0)
                                {
                                    if (double.Parse(dsPOU.Tables[0].Rows[0][0].ToString().Trim()) > 0)
                                    {
                                        dsMain.Tables[0].Rows[i]["TT"] = "P";
                                    }
                                    else
                                    {
                                        dsMain.Tables[0].Rows[i]["TT"] = "N";
                                        dsMain.Tables[0].Rows[i]["PO_Issue_No"] = "-"; 
                                    }
                                }
                                else
                                {
                                    dsMain.Tables[0].Rows[i]["TT"] = "P";
                                }
                            }
                            else
                            {
                                dsMain.Tables[0].Rows[i]["TT"] = "N";
                            }
                        }
                    }

                    dsMain.Tables[0].Rows[i]["PO_Issue_Req_Date"] = string.Empty;
                    dsMain.Tables[0].Rows[i]["PO_Issue_Qty"] = (string.IsNullOrEmpty(dsMain.Tables[0].Rows[i]["PO_Issue_Qty"].ToString()) ? 0 : int.Parse(dsMain.Tables[0].Rows[i]["PO_Issue_Qty"].ToString()));
                }
            }
            dsMain.AcceptChanges();
            dsMain.Tables[0].Columns.Remove("int_loop"); dsMain.Tables[0].Columns.Remove("Allocate_Ref_No"); dsMain.Tables[0].Columns.Remove("Allocate_Qty"); dsMain.Tables[0].Columns.Remove("Back_Qty");
            dsMain.Tables[0].Columns.Remove("PO_Issue_Date"); dsMain.Tables[0].Columns.Remove("PO_Receipt_No");
            dsMain.Tables[0].Columns.Remove("Stock_Ava"); dsMain.Tables[0].Columns.Remove("Stock_Out_No"); dsMain.Tables[0].Columns.Remove("Stock_Out_Date");
            dsMain.Tables[0].Columns.Remove("Stock_Out_Qty"); dsMain.Tables[0].Columns.Remove("Stock_Balance"); 
            
            /*dsMain.Tables[0].Columns.Remove("PJC_SITE"); dsMain.Tables[0].Columns.Remove("Orig_Qty");
            dsMain.Tables[0].Columns.Remove("Cur_Qty");*/
            //dsMain.Tables[0].Columns.Add("Act_Qty", typeof(System.Decimal)); 
            dsMain.Tables[0].Columns.Add("Site_Comment", typeof(System.String));
            dsMain.Tables[0].Columns.Add("SSort", typeof(System.String));
            dsMain.AcceptChanges();

            DataSet dsComm = new DataSet();
            for (int i = 0; i < dsMain.Tables[0].Rows.Count; i++)
            {
                NP_Cls.sqlSelect = "SELECT  CONTRACT, PROJECT, RESOURCE, ORJQTY, CURQTY, ACTQTY FROM  PMRES WHERE (CONTRACT = '" + this.cbContract.SelectedValue.Trim().Replace("-", string.Empty) + "') AND (RESOURCE = '" + dsMain.Tables[0].Rows[i]["Main_Item"].ToString() + "')";
                DataSet dsTmp = new DataSet();
                dsTmp = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                if (dsTmp.Tables[0].Rows.Count > 0)
                {
                    for (int j = 0; j < dsTmp.Tables[0].Rows.Count; j++)
                    {
                        dsMain.Tables[0].Rows[i]["Site_Comment"] += dsTmp.Tables[0].Rows[j]["PROJECT"].ToString().Trim() + "(" + decimal.Parse(dsTmp.Tables[0].Rows[j]["ORJQTY"].ToString()).ToString("#,##0") + "/" +
                            decimal.Parse(dsTmp.Tables[0].Rows[j]["CURQTY"].ToString()).ToString("#,##0") + "/" + decimal.Parse(dsTmp.Tables[0].Rows[j]["ACTQTY"].ToString()).ToString("#,##0") + ")<br>";
                        dsMain.Tables[0].Rows[i]["SSort"] = dsTmp.Tables[0].Rows[j]["PROJECT"].ToString().Trim().Substring(0,6);
                    }
                    //dsMain.Tables[0].Rows[i]["PJC_SITE"] = dsTmp.Tables[0].Rows[0]["PROJECT"].ToString();
                    //dsMain.Tables[0].Rows[i]["Orig_Qty"] = decimal.Parse(dsTmp.Tables[0].Rows[0][""].ToString());
                    //dsMain.Tables[0].Rows[i]["Act_Qty"] = decimal.Parse(dsTmp.Tables[0].Rows[0][""].ToString());
                    //dsMain.Tables[0].Rows[i]["Cur_Qty"] = decimal.Parse(dsTmp.Tables[0].Rows[0][""].ToString());
                }
            }

            dsMain.Tables[0].Columns.Add("Sorting", typeof(System.Decimal)); dsMain.Tables[0].Columns.Add("ITEMComment", typeof(System.String)); dsMain.Tables[0].Columns.Add("CreateDate", typeof(System.DateTime));
            ////for (int n = 0; n < dsMain.Tables[0].Rows.Count; n++)
            ////{
            ////    dsMain.Tables[0].Rows[n]["Sorting"] = 0;
            ////}
            //
            NP_Cls.sqlSelect = "SELECT PJCUniq, ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate, CreateDate FROM  PCA_ITAsset.dbo.bg_PJCSorting WHERE (ContractNo = N'" + this.cbContract.SelectedValue.ToString().Trim() + "')";
            dsComm = new DataSet();
            dsComm = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (dsComm.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dsMain.Tables[0].Rows.Count; i++)
                {
                    for (int j = 0; j < dsComm.Tables[0].Rows.Count; j++)
                    {
                        if (dsMain.Tables[0].Rows[i]["Main_Item"].ToString().Trim().CompareTo(dsComm.Tables[0].Rows[j]["ITEMNO"].ToString().Trim()) == 0)
                        {
                            dsMain.Tables[0].Rows[i]["ITEMComment"] = dsComm.Tables[0].Rows[j]["ITEMComment"].ToString();
                            dsMain.Tables[0].Rows[i]["Sorting"] = dsComm.Tables[0].Rows[j]["Sorting"].ToString();
                            dsMain.Tables[0].Rows[i]["CreateDate"] = DateTime.Parse(dsComm.Tables[0].Rows[j]["CreateDate"].ToString());
                            dsMain.Tables[0].Rows[i]["PO_Issue_Req_Date"] = (string.IsNullOrEmpty(dsComm.Tables[0].Rows[j]["ReqDate"].ToString()) ? string.Empty : DateTime.Parse(dsComm.Tables[0].Rows[j]["ReqDate"].ToString()).ToString("dd MMM yyyy", NP_Cls.cul));
                        }
                    }
                }
            }

            // GET PR
            dsComm = new DataSet();
            NP_Cls.sqlSelect = "SELECT     PORQNH1.RQNNUMBER, PORQNL.ITEMNO FROM  PORQNL INNER JOIN    PORQNH1 ON PORQNL.RQNHSEQ = PORQNH1.RQNHSEQ WHERE    (PORQNL.OEONUMBER = '" + this.cbContract.SelectedValue.ToString().Trim().Substring(0, 9) + "') ";
            dsComm = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (dsComm.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dsMain.Tables[0].Rows.Count; i++)
                {
                    for (int j = 0; j < dsComm.Tables[0].Rows.Count; j++)
                    {
                        if ((dsMain.Tables[0].Rows[i]["Main_Item"].ToString().Trim().CompareTo(dsComm.Tables[0].Rows[j]["ITEMNO"].ToString().Trim()) == 0) && (dsMain.Tables[0].Rows[i]["PR_No"].ToString().Trim() == "-"))
                        {
                            dsMain.Tables[0].Rows[i]["PR_No"] = dsComm.Tables[0].Rows[j]["RQNNUMBER"].ToString();
                        }
                    }
                }
            }

            //GET BOM
            for (int i = 0; i < dsMain.Tables[0].Rows.Count; i++)
            {
                dsComm = new DataSet();
                NP_Cls.sqlSelect = "SELECT     PCA_ITAsset.dbo.bg_BOM.VenCode, PCA_ITAsset.dbo.bg_BOM.BOMCode, PCA_ITAsset.dbo.bg_BOM.BOMName, PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO,                        PCA_ITAsset.dbo.bg_BOMDetail.FMITEMDESC, CAST(PCA_ITAsset.dbo.bg_BOMDetail.FMQTY AS numeric(18, 0)) AS FMQTY, bg_BOMDetail_1.FMITEMNO AS S_Code,                        bg_BOMDetail_1.FMITEMDESC AS S_Desc, CAST(bg_BOMDetail_1.FMQTY AS numeric(18,0)) AS S_Qty FROM         PCA_ITAsset.dbo.bg_BOMDetail AS bg_BOMDetail_1 INNER JOIN                       PCA_ITAsset.dbo.bg_BOM AS bg_BOM_1 ON bg_BOMDetail_1.BOMUniq = bg_BOM_1.BOMUniq RIGHT OUTER JOIN                       PCA_ITAsset.dbo.bg_BOM INNER JOIN                       PCA_ITAsset.dbo.bg_BOMDetail ON PCA_ITAsset.dbo.bg_BOM.BOMUniq = PCA_ITAsset.dbo.bg_BOMDetail.BOMUniq ON    bg_BOM_1.BOMCode = PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO WHERE (PCA_ITAsset.dbo.bg_BOM.BOMCode = N'" + dsMain.Tables[0].Rows[i]["Main_Item"].ToString().Trim() + "') ORDER BY PCA_ITAsset.dbo.bg_BOMDetail.LogDate";
                dsComm = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                if (dsComm.Tables[0].Rows.Count > 0)
                {
                    dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += "<hr><Font color:#000088;\">";
                    //First Step
                    for (int j = 0; j < dsComm.Tables[0].Rows.Count; j++)
                    {
                        dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += "-" + dsComm.Tables[0].Rows[j]["FMITEMNO"].ToString().Trim() + "(" + dsComm.Tables[0].Rows[j]["FMQTY"].ToString() + ")<BR>";

                        if (!string.IsNullOrEmpty(dsComm.Tables[0].Rows[j]["S_Code"].ToString().Trim()))
                        {
                            dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += ".." + dsComm.Tables[0].Rows[j]["S_Code"].ToString().Trim() + "(" + dsComm.Tables[0].Rows[j]["S_Qty"].ToString() + ")<BR> ";
                        }

                        ////Sec Step
                        //ds2 = new DataSet();
                        //NP_Cls.sqlSelect = "SELECT     PCA_ITAsset.dbo.bg_BOM.VenCode, PCA_ITAsset.dbo.bg_BOM.BOMCode, PCA_ITAsset.dbo.bg_BOM.BOMName, PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO,                        PCA_ITAsset.dbo.bg_BOMDetail.FMITEMDESC, CAST(PCA_ITAsset.dbo.bg_BOMDetail.FMQTY AS numeric(18,0)) AS FMQTY FROM         PCA_ITAsset.dbo.bg_BOM INNER JOIN                       PCA_ITAsset.dbo.bg_BOMDetail ON PCA_ITAsset.dbo.bg_BOM.BOMUniq = PCA_ITAsset.dbo.bg_BOMDetail.BOMUniq WHERE     (PCA_ITAsset.dbo.bg_BOM.BOMCode = N'" + dsComm.Tables[0].Rows[j]["FMITEMNO"].ToString().Trim() + "')";
                        //ds2 = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                        //if (ds2.Tables[0].Rows.Count > 0)
                        //{
                        //    dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += "<Font color:#ff5566;\">";
                        //    for (int sec = 0; sec < ds2.Tables[0].Rows.Count; j++)
                        //    {
                        //        dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += "<BR> ---" + ds2.Tables[0].Rows[sec]["FMITEMDESC"].ToString() + "(" + ds2.Tables[0].Rows[sec]["FMQTY"].ToString() + ")";
                        //    }
                        //    dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += "</Font>";
                        //}
                        //ds2.Dispose();

                    }
                    
                    dsMain.Tables[0].Rows[i]["Item_Number_Desc"] += "</Font>";
                }
                dsComm.Dispose();
            }



            // Format Setting --*
            dsMain.AcceptChanges();
            DataView dv; dv = dsMain.Tables[0].DefaultView;
            dv.Sort = "SSort, LN, Sorting, CreateDate";
            dsMain = new DataSet();

            dsMain.Tables.Add(dv.ToTable());
            for (int n = 0; n < dsMain.Tables[0].Rows.Count; n++)
            {
                dsMain.Tables[0].Rows[n]["ItemNo"] = n + 1;

                dsMain.Tables[0].Rows[n]["ItemComment"] = dsMain.Tables[0].Rows[n]["ItemComment"].ToString().Replace("\r", "\n");

                dsMain.Tables[0].Rows[n]["ItemComment"] = dsMain.Tables[0].Rows[n]["ItemComment"].ToString().Replace("\n", "<br>");

                //Rec
                dsMain.Tables[0].Rows[n]["PO_Receipt_Qty"] = (string.IsNullOrEmpty(dsMain.Tables[0].Rows[n]["PO_Receipt_Qty"].ToString()) ? "0" : dsMain.Tables[0].Rows[n]["PO_Receipt_Qty"].ToString());

                //Cut Comma
                if (dsMain.Tables[0].Rows[n]["PO_Issue_No"].ToString().Trim().Length > 1)
                {
                    if (dsMain.Tables[0].Rows[n]["PO_Issue_No"].ToString().Trim().Substring(0, 1) == ",")
                    {
                        dsMain.Tables[0].Rows[n]["PO_Issue_No"] = dsMain.Tables[0].Rows[n]["PO_Issue_No"].ToString().Trim().Substring(1, dsMain.Tables[0].Rows[n]["PO_Issue_No"].ToString().Trim().Length - 1);
                    }
                }

                if (dsMain.Tables[0].Rows[n]["PR_No"].ToString().Trim().Length > 1)
                {
                    if (dsMain.Tables[0].Rows[n]["PR_No"].ToString().Trim().Substring(0, 1) == ",")
                    {
                        dsMain.Tables[0].Rows[n]["PR_No"] = dsMain.Tables[0].Rows[n]["PR_No"].ToString().Trim().Substring(1, dsMain.Tables[0].Rows[n]["PR_No"].ToString().Trim().Length - 1);
                    }
                }

                if (dsMain.Tables[0].Rows[n]["PO_Issue_ETA_Date"].ToString().Trim().Length > 1)
                {
                    if (dsMain.Tables[0].Rows[n]["PO_Issue_ETA_Date"].ToString().Trim().Length > 1)
                    {
                        if (dsMain.Tables[0].Rows[n]["PO_Issue_ETA_Date"].ToString().Trim().Substring(0, 1) == ",")
                        {
                            dsMain.Tables[0].Rows[n]["PO_Issue_ETA_Date"] = dsMain.Tables[0].Rows[n]["PO_Issue_ETA_Date"].ToString().Trim().Substring(1, dsMain.Tables[0].Rows[n]["PO_Issue_ETA_Date"].ToString().Trim().Length - 1);
                        }
                    }
                }

                if (dsMain.Tables[0].Rows[n]["PO_Receipt_Date"].ToString().Trim().Length > 1)
                {
                    if (dsMain.Tables[0].Rows[n]["PO_Receipt_Date"].ToString().Trim().Length > 1)
                    {
                        if (dsMain.Tables[0].Rows[n]["PO_Receipt_Date"].ToString().Trim().Substring(0, 1) == ",")
                        {
                            dsMain.Tables[0].Rows[n]["PO_Receipt_Date"] = dsMain.Tables[0].Rows[n]["PO_Receipt_Date"].ToString().Trim().Substring(1, dsMain.Tables[0].Rows[n]["PO_Receipt_Date"].ToString().Trim().Length - 1);
                        }
                    }
                }

                if (dsMain.Tables[0].Rows[n]["PO_Issue_Req_Date"].ToString().Trim().Length > 1)
                {
                    if (dsMain.Tables[0].Rows[n]["PO_Issue_Req_Date"].ToString().Trim().Length > 1)
                    {
                        if (dsMain.Tables[0].Rows[n]["PO_Issue_Req_Date"].ToString().Trim().Substring(0, 1) == ",")
                        {
                            dsMain.Tables[0].Rows[n]["PO_Issue_Req_Date"] = dsMain.Tables[0].Rows[n]["PO_Issue_Req_Date"].ToString().Trim().Substring(1, dsMain.Tables[0].Rows[n]["PO_Issue_Req_Date"].ToString().Trim().Length - 1);
                        }
                    }
                }

            }
            dsMain.Tables[0].Columns.Remove("SSort"); 
            this.RadGrid2.DataSource = dsMain.Tables[0];

            //Assign to Session
            Session["ED"] = dsMain;

            if (type == 1)
            {
                this.RadGrid2.DataBind();
            }


            this.lblEndOfContr.Text = NP.Execute("SELECT    CASE WHEN isdate(CAST(OEORDHO.VALUE AS varchar)) = 0 THEN '-' ELSE CONVERT(nvarchar,          CAST(CAST(OEORDHO.VALUE AS varchar) AS DATETIME), 106) END AS DueDate, OEORDH.ORDNUMBER FROM         OEORDH INNER JOIN       OEORDHO ON OEORDH.ORDUNIQ = OEORDHO.ORDUNIQ  WHERE     (OEORDHO.OPTFIELD = 'DELIVERYDATE') AND (OEORDH.ORDNUMBER = '" + this.cbContract.SelectedValue.ToString().Trim().Substring(0, 9) + "')", ref NP_Cls.strErr).Tables[0].Rows[0][0].ToString();

            this.btnDetail.Visible = (this.RadGrid2.Items.Count > 0);
            this.btnDetail.NavigateUrl = "http://192.168.73.39/ACCPAC/PJC-OPReportExcel.asp?typ=2&txtID=" + this.cbContract.SelectedValue.ToString(); this.btnDetail.Target = "_blank";
        }
        string getStrc(string strCond)
        {
            return "SELECT     0 AS ItemNo, vw_OrderManagement.PJC, vw_OrderManagement.[PJC DESC] AS PJCDESC, GetUnit.CATEGORY AS PG, vw_OrderManagement.PROJECT,                        vw_OrderManagement.[Main Item] AS [ProductCode], vw_OrderManagement.[Item Number Descrition] AS [ProductDesc], vw_OrderManagement.Qty,                        CAST(GetUnit.UNITPRC AS numeric(18, 3)) AS UNITPRC, vw_OrderManagement.Qty * GetUnit.UNITPRC AS TotalPrc, vw_OrderManagement.Vendor,                        vw_OrderManagement.RQNNUMBER, vw_OrderManagement.[Ref.No / PO] AS PONo, vw_OrderManagement.[Request Date] AS RequestDate, vw_OrderManagement.Referance,                        vw_OrderManagement.[PJC Status] AS PJCStatus, vw_OrderManagement.DNUM, ISNULL(PCA_ITAsset.dbo.bg_PJCSorting.ITEMComment,'') AS ITEMComment, ISNULL(PCA_ITAsset.dbo.bg_PJCSorting.Sorting,'') AS Sorting,                        PCA_ITAsset.dbo.bg_PJCSorting.CreateDate FROM         vw_OrderManagement INNER JOIN                           (SELECT     PMRES.CONTRACT AS CONTR, ICCATG.CATEGORY, PMRESO.VALUE AS UNITPRC, PMRES.ORJQTY * PMRESO.VALUE AS NET,                                                     PMRES.RESOURCE AS ITEM, ICITEM.[DESC]                             FROM          PMRES INNER JOIN                                                    PMRESO ON PMRES.CTUNIQ = PMRESO.CTUNIQ AND PMRES.PLINENUM = PMRESO.PLINENUM AND                                                     PMRES.CLINENUM = PMRESO.CLINENUM INNER JOIN                                                    ICITEM ON PMRES.ITEMNO = ICITEM.ITEMNO INNER JOIN                                                    ICCATG ON ICITEM.CATEGORY = ICCATG.CATEGORY                             WHERE      (PMRESO.OPTFIELD = 'SALES')) AS GetUnit ON REPLACE(vw_OrderManagement.PJC, '-', '') = GetUnit.CONTR AND                        vw_OrderManagement.[Main Item] = GetUnit.ITEM LEFT OUTER JOIN                       PCA_ITAsset.dbo.bg_PJCSorting ON vw_OrderManagement.PJC = PCA_ITAsset.dbo.bg_PJCSorting.ContractNo AND                        vw_OrderManagement.[Main Item] = PCA_ITAsset.dbo.bg_PJCSorting.ITEMNO WHERE     (vw_OrderManagement.PJC LIKE '"+ strCond +"') AND (vw_OrderManagement.[Ref.No / PO] LIKE 'PO%') ORDER BY PCA_ITAsset.dbo.bg_PJCSorting.Sorting, PCA_ITAsset.dbo.bg_PJCSorting.CreateDate, vw_OrderManagement.DNUM";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
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
                HyperLink HEdit = ((HyperLink)item["clnEdit"].FindControl("HyperLink1"));
                HEdit.NavigateUrl = "#"; HEdit.Attributes.Add("OnClick", "return ShowEditForm('" + item["clnPJC"].Text.Trim() + "','" + item["clnProductCode"].Text.Trim().Replace("+", "*plus*") + "');");
                
                switch (item["clnTT"].Text.Trim())
                {
                    case "T":
                        item.BackColor = ColorTranslator.FromHtml("#95C9FF");
                        break;
                    case "P":
                        item.BackColor = ColorTranslator.FromHtml("#FFFFA0");
                        break;
                    case "R":
                        item.BackColor = ColorTranslator.FromHtml("#8CFF8C");
                        break;
                    default:
                        item.BackColor = Color.White;
                        break;
                }

                    Label lblSite = e.Item.FindControl("lblSite") as Label;
                    lblSite.Text = item["clnSiteComment"].Text.Trim();
            }
        }
        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            if (e.Argument == "Rebind")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('NP1 !!');", true); return;
            }
            else if (e.Argument == "RebindAndNavigate")
            {
                DGV(1);
            }
        }

        protected void btnGen_Click(object sender, EventArgs e)
        {
            if (this.RadGrid2.Items.Count == 0) { this.NotifyWarn.Text = "Data not found !!"; this.NotifyWarn.Show(); return; }

            SqlCommand cmd = new SqlCommand();
            SqlConnection oConn = new SqlConnection(NP_Cls.strconn);
            if (oConn.State == ConnectionState.Open) { oConn.Close(); }
            oConn.Open(); SqlTransaction Tr; Tr = oConn.BeginTransaction();

            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50);
            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50);
            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200);
            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50);
            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar);
            cmd.Parameters.Add("@Sorting", SqlDbType.Float);

            try
            {
                
                DataSet ds;
                for (int i = 0; i < this.RadGrid2.Items.Count; i++)
                {
                    NP_Cls.sqlSelect = "SELECT  PJCUniq, ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting FROM  PCA_ITAsset.dbo.bg_PJCSorting WHERE  (ContractNo = N'" + this.RadGrid2.Items[i]["clnPJC"].Text.Trim() + "') AND (ITEMNO = N'" + this.RadGrid2.Items[i]["clnProductCode"].Text.Trim() + "')  ";
                    ds = new DataSet(); ds = NP.GetWithTran(NP_Cls.sqlSelect,oConn,Tr);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        //ADD
                        NP_Cls.sqlInsert = "INSERT INTO PCA_ITAsset.dbo.bg_PJCSorting (ContractNo, ITEMNO, ITEMDESC,  Sorting, CreateUser, CreateDate) VALUES (@ContractNo, @ITEMNO, @ITEMDESC,  @Sorting, @UC, GETDATE())";
                        cmd.Parameters["@ContractNo"].Value = this.RadGrid2.Items[i]["clnPJC"].Text.Trim();
                        cmd.Parameters["@ITEMNO"].Value = this.RadGrid2.Items[i]["clnProductCode"].Text.Trim();
                        cmd.Parameters["@ITEMDESC"].Value = this.RadGrid2.Items[i]["clnProductDesc"].Text.Trim();
                        cmd.Parameters["@UC"].Value = (Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName);
                        cmd.Parameters["@Sorting"].Value = this.RadGrid2.Items[i]["clnItem"].Text.Trim();

                        cmd.CommandText = NP_Cls.sqlInsert; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        //EDIT
                        NP_Cls.sqlUpdate = "UPDATE PCA_ITAsset.dbo.bg_PJCSorting SET  Sorting = @Sorting, UpdateUser = @UC, UpdateDate = GETDATE() " +
                         "WHERE (ContractNo = @ContractNo) AND (ITEMNO = @ITEMNO) AND (ITEMDESC = @ITEMDESC)";
                        cmd.Parameters["@ContractNo"].Value = this.RadGrid2.Items[i]["clnPJC"].Text.Trim();
                        cmd.Parameters["@ITEMNO"].Value = this.RadGrid2.Items[i]["clnProductCode"].Text.Trim();
                        cmd.Parameters["@ITEMDESC"].Value = this.RadGrid2.Items[i]["clnProductDesc"].Text.Trim();
                        cmd.Parameters["@UC"].Value = (Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName);
                        cmd.Parameters["@Sorting"].Value = this.RadGrid2.Items[i]["clnItem"].Text.Trim();


                        cmd.CommandText = NP_Cls.sqlUpdate; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                        cmd.ExecuteNonQuery();
                    }
                }

                Tr.Commit();
                DGV(1);
            }
            catch (Exception ex)
            {
                this.NotifyWarn.Text = ex.Message; this.NotifyWarn.Show(); return;
            }
            finally
            {
                if (oConn.State == ConnectionState.Open) { oConn.Close(); }
            }
        }
        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridNestedViewItem)
            {
                Label lblComm = ((Label)e.Item.FindControl("lblComment"));
                lblComm.Text = e.Item.OwnerTableView.DataKeyValues[((GridNestedViewItem)e.Item).ParentItem.ItemIndex]["ItemComment"].ToString();
            }
        }

        protected void RadListView1_ItemDataBound(object sender, RadListViewItemEventArgs e)
        {
            if (e.Item is RadListViewDataItem)
            {
                Label lblPJC = e.Item.FindControl("lblPJC") as Label;
                Label lblMain_Item = e.Item.FindControl("lblMain_Item") as Label;

                HyperLink HEdit = e.Item.FindControl("hy2") as HyperLink;
                HEdit.NavigateUrl = "#"; HEdit.Attributes.Add("OnClick", string.Format("window.radopen(\"EditSorting.aspx?id={0}&code={1}\", \"UserListDialog\"); return false;", lblPJC.Text.Trim(), lblMain_Item.Text.Trim()));

            }
        }
        protected void RadListView1_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
        {

        }

    }
}