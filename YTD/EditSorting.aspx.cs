using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace YTD
{
    public partial class EditSorting : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls(); private DataSet MyDS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {             
                if (Request.QueryString["id"] != null)
                {
                    NP_Cls.sqlSelect = "SELECT  PJCUniq, ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate FROM  PCA_ITAsset.dbo.bg_PJCSorting WHERE  (ContractNo = N'" + Request.QueryString["id"].ToString() + "') AND (ITEMNO = N'" + Request.QueryString["code"].ToString().Replace("*plus*", "+") + "')  ";
                    DataSet ds = new DataSet(); ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        this.lblType.Text = "EDIT";
                        this.lblContractNo.Text = Request.QueryString["id"].ToString(); this.lblItemCode.Text = Request.QueryString["code"].ToString().Replace("*plus*", "+");
                        this.lblItemDesc.Text = ds.Tables[0].Rows[0]["ITEMDesc"].ToString();
                        if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ReqDate"].ToString()))
                        {
                            this.dtpETA.DbSelectedDate = DateTime.Parse(ds.Tables[0].Rows[0]["ReqDate"].ToString());
                        }
                        this.txtComment.Text = ds.Tables[0].Rows[0]["ITEMComment"].ToString(); 
                        this.txtComment.SelectionOnFocus = Telerik.Web.UI.SelectionOnFocus.SelectAll; this.txtComment.Focus();
                    }
                    else
                    {
                        this.lblType.Text = "ADD";
                        this.lblContractNo.Text = Request.QueryString["id"].ToString(); this.lblItemCode.Text = Request.QueryString["code"].ToString(); this.dtpETA.SelectedDate = null;
                        this.lblItemDesc.Text = "-"; this.txtComment.Focus();
                    }

                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                this.MyDS = new DataSet();
                if (this.Session["ED"] != null)
                {
                    this.MyDS = ((DataSet)Session["ED"]).Copy();
                }

                SqlCommand cmd = new SqlCommand(); SqlTransaction Tr;
                SqlConnection oConn = new SqlConnection(NP_Cls.strconn);
                if (oConn.State == ConnectionState.Open) { oConn.Close(); }
                oConn.Open();
                Tr = oConn.BeginTransaction();

                System.Data.SqlTypes.SqlDateTime DTNull;
                DTNull = System.Data.SqlTypes.SqlDateTime.Null;

                string strUser = string.Empty;
                try
                {
                  strUser =  (Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName);
                }
                catch 
                {
                    strUser = Request.ServerVariables["remote_addr"];
                }

                try
                {
                    switch (this.lblType.Text.Trim())
                    {
                        case "ADD":                            
                            NP_Cls.sqlInsert = "INSERT INTO PCA_ITAsset.dbo.bg_PJCSorting (ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate, CreateUser, CreateDate) VALUES (@ContractNo, @ITEMNO, @ITEMDESC, @ITEMComment, @Sorting, @ETA, @UC, GETDATE())";
                            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50).Value = this.lblContractNo.Text.Trim();
                            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50).Value = this.lblItemCode.Text.Trim();
                            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200).Value = this.lblItemDesc.Text.Trim();
                            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50).Value = strUser;
                            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar).Value = this.txtComment.Text.Trim();
                            cmd.Parameters.Add("@Sorting", SqlDbType.Float).Value = 0;
                            cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = (this.dtpETA.SelectedDate == null ? DTNull : this.dtpETA.SelectedDate.Value);

                            cmd.CommandText = NP_Cls.sqlInsert; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                            cmd.ExecuteNonQuery();

                            if (this.ChkAll.Checked)
                            {

                                for (int i = 0; i < this.MyDS.Tables[0].Rows.Count; i++)
                                {
                                    if (!this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim().Contains(this.lblItemCode.Text.Trim()))
                                    {
                                        cmd.Parameters.Clear();
                                        NP_Cls.sqlSelect = "SELECT  PJCUniq, ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate FROM  PCA_ITAsset.dbo.bg_PJCSorting WHERE  (ContractNo = N'" + this.lblContractNo.Text.Trim() + "') AND (ITEMNO = N'" + this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim() + "') ";
                                        DataSet ds = new DataSet(); ds = NP.GetWithTran(NP_Cls.sqlSelect, oConn, Tr);
                                        if (ds.Tables[0].Rows.Count == 0)
                                        {
                                            NP_Cls.sqlInsert = "INSERT INTO PCA_ITAsset.dbo.bg_PJCSorting (ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate, CreateUser, CreateDate) VALUES (@ContractNo, @ITEMNO, @ITEMDESC, @ITEMComment, @Sorting, @ETA, @UC, GETDATE())";
                                            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50).Value = this.lblContractNo.Text.Trim();
                                            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50).Value = this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim();
                                            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200).Value = this.MyDS.Tables[0].Rows[i]["Item_Number_Desc"].ToString().Trim();
                                            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50).Value = strUser;
                                            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar).Value = string.Empty;
                                            cmd.Parameters.Add("@Sorting", SqlDbType.Float).Value = 0;
                                            cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = (this.dtpETA.SelectedDate == null ? DTNull : this.dtpETA.SelectedDate.Value);

                                            cmd.CommandText = NP_Cls.sqlInsert; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                                            cmd.ExecuteNonQuery();
                                        }
                                        else
                                        {
                                            NP_Cls.sqlUpdate = "UPDATE PCA_ITAsset.dbo.bg_PJCSorting SET Sorting = @Sorting, ReqDate = @ETA, UpdateUser = @UC, UpdateDate = GETDATE() " +
                             "WHERE (ContractNo = @ContractNo) AND (ITEMNO = @ITEMNO) AND (ITEMDESC = @ITEMDESC)";
                                            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50).Value = this.lblContractNo.Text.Trim();
                                            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50).Value = this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim();
                                            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200).Value = this.MyDS.Tables[0].Rows[i]["Item_Number_Desc"].ToString().Trim();
                                            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50).Value = strUser;
                                            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar).Value = string.Empty;
                                            cmd.Parameters.Add("@Sorting", SqlDbType.Float).Value = 0;
                                            cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = (this.dtpETA.SelectedDate == null ? DTNull : this.dtpETA.SelectedDate.Value);

                                            cmd.CommandText = NP_Cls.sqlUpdate; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                                            cmd.ExecuteNonQuery();
                                        }
                                    }
                                }
                            }

                            Tr.Commit();
                            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('" + this.lblContractNo.Text.Trim() + "');", true);
                            break;

                        case "EDIT":
                            NP_Cls.sqlUpdate = "UPDATE PCA_ITAsset.dbo.bg_PJCSorting SET ITEMComment = @ITEMComment, Sorting = @Sorting, ReqDate = @ETA, UpdateUser = @UC, UpdateDate = GETDATE() " +
                            "WHERE (ContractNo = @ContractNo) AND (ITEMNO = @ITEMNO) ";
                            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50).Value = this.lblContractNo.Text.Trim();
                            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50).Value = this.lblItemCode.Text.Trim();
                            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200).Value = this.lblItemDesc.Text.Trim();
                            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50).Value = strUser;
                            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar).Value = this.txtComment.Text.Trim();
                            cmd.Parameters.Add("@Sorting", SqlDbType.Float).Value = 0;
                            cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = (this.dtpETA.SelectedDate == null ? DTNull : this.dtpETA.SelectedDate.Value);

                            cmd.CommandText = NP_Cls.sqlUpdate; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                            cmd.ExecuteNonQuery();

                            if (this.ChkAll.Checked)
                            {

                                for (int i = 0; i < this.MyDS.Tables[0].Rows.Count; i++)
                                {
                                    if (!this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim().Contains(this.lblItemCode.Text.Trim()))
                                    {
                                        cmd.Parameters.Clear();
                                        NP_Cls.sqlSelect = "SELECT  PJCUniq, ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate FROM  PCA_ITAsset.dbo.bg_PJCSorting WHERE  (ContractNo = N'" + this.lblContractNo.Text.Trim() + "')  AND (ITEMNO = N'" + this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim() + "')";
                                        DataSet ds = new DataSet(); ds = NP.GetWithTran(NP_Cls.sqlSelect, oConn, Tr);
                                        if (ds.Tables[0].Rows.Count == 0)
                                        {
                                            NP_Cls.sqlInsert = "INSERT INTO PCA_ITAsset.dbo.bg_PJCSorting (ContractNo, ITEMNO, ITEMDESC, ITEMComment, Sorting, ReqDate, CreateUser, CreateDate) VALUES (@ContractNo, @ITEMNO, @ITEMDESC, @ITEMComment, @Sorting, @ETA, @UC, GETDATE())";
                                            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50).Value = this.lblContractNo.Text.Trim();
                                            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50).Value = this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim();
                                            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200).Value = this.MyDS.Tables[0].Rows[i]["Item_Number_Desc"].ToString().Trim();
                                            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50).Value = strUser;
                                            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar).Value = string.Empty;
                                            cmd.Parameters.Add("@Sorting", SqlDbType.Float).Value = 0;
                                            cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = (this.dtpETA.SelectedDate == null ? DTNull : this.dtpETA.SelectedDate.Value);

                                            cmd.CommandText = NP_Cls.sqlInsert; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                                            cmd.ExecuteNonQuery();
                                        }
                                        else
                                        {
                                            NP_Cls.sqlUpdate = "UPDATE PCA_ITAsset.dbo.bg_PJCSorting SET  Sorting = @Sorting, ReqDate = @ETA, UpdateUser = @UC, UpdateDate = GETDATE() " +
                             "WHERE (ContractNo = @ContractNo) AND (ITEMNO = @ITEMNO) ";
                                            cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50).Value = this.lblContractNo.Text.Trim();
                                            cmd.Parameters.Add("@ITEMNO", SqlDbType.NVarChar, 50).Value = this.MyDS.Tables[0].Rows[i]["Main_Item"].ToString().Trim();
                                            cmd.Parameters.Add("@ITEMDESC", SqlDbType.NVarChar, 200).Value = this.MyDS.Tables[0].Rows[i]["Item_Number_Desc"].ToString().Trim();
                                            cmd.Parameters.Add("@UC", SqlDbType.NVarChar, 50).Value = strUser;
                                            cmd.Parameters.Add("@ITEMComment", SqlDbType.NVarChar).Value = string.Empty;
                                            cmd.Parameters.Add("@Sorting", SqlDbType.Float).Value = 0;
                                            cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = (this.dtpETA.SelectedDate == null ? DTNull : this.dtpETA.SelectedDate.Value);

                                            cmd.CommandText = NP_Cls.sqlUpdate; cmd.Connection = oConn; cmd.CommandType = CommandType.Text; cmd.Transaction = Tr;
                                            cmd.ExecuteNonQuery();
                                        }
                                    }
                                }
                            }

                            Tr.Commit();
                            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
                            break;
                        default:
                            break;
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message); return;
                }
                finally
                {
                    if (oConn.State == ConnectionState.Open) { oConn.Close(); }
                }
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
            //ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('" + this.lblContractNo.Text.Trim() + "');", true);
        }
    }
}