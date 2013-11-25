using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Net;
using Telerik.Web.UI;

namespace YTD
{
    public partial class BOMGenerate : System.Web.UI.Page
    {
        NP_Cls NP = new NP_Cls();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DT"] != null) { Session.Remove("DT"); }
                DataSet dsCB = new DataSet();
                dsCB = NP.Execute("SELECT  RTRIM(VENDORID) AS CODE, RTRIM(VENDORID) + ' : ' + RTRIM(VENDNAME) AS DSC FROM   APVEN WHERE (SWACTV = 1) ORDER BY  CODE", ref NP_Cls.strErr);
                DataRow dr; dr = dsCB.Tables[0].NewRow();
                dr[0] = "0"; dr[1] = string.Empty;
                dsCB.Tables[0].Rows.InsertAt(dr, 0);

                this.cbVendorCode.DataSource = dsCB.Tables[0];
                this.cbVendorCode.DataBind();


            }
        }
        protected void cbProductCode_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.cbProductCode.Text.Trim()))
            {
                this.btnAdd.Visible = true;
            }
            else
            {
                if (string.IsNullOrEmpty(this.cbVendorCode.Text.Trim()))
                {
                    this.btnAdd.Visible = false;
                }
            }
            this.btnAdd.Focus();
        }
        private void CheackH(byte p)
        {
            //Create Source
            string strSrc = string.Empty;
            for (int c = 0; c < this.RadGrid1.Items.Count; c++)
            {
                strSrc += this.RadGrid1.Items[c]["clnItemCode"].Text.Trim() + this.RadGrid1.Items[c]["clnQty"].Text.Trim().ToString();
            }

            //MD5
            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, strSrc);

                NP_Cls.sqlSelect = "SELECT BOMCode, BOMName, VenCode, HashCode FROM PCA_ITAsset.dbo.bg_BOM WHERE (HashCode = '" + hash + "')";
                DataSet ds = new DataSet();
                ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.txtBOMCode.Text = ds.Tables[0].Rows[0][0].ToString();
                    this.txtBOMName.Text = ds.Tables[0].Rows[0][1].ToString();
                    this.btnSave.Visible = false;

                    this.lblC.Text = ds.Tables[0].Rows[0][3].ToString();

                    //this.btnDel.Visible = true;                  
                    //this.NotifySave.Text = "[ Found BOM Code ] : <B>" + this.txtBOMCode.Text.Trim() + "</B>"; this.NotifySave.Show();
                }
                else
                {
                    if (string.IsNullOrEmpty(this.lblC.Text.Trim()))
                    {
                        if (string.IsNullOrEmpty(this.txtBOMCode.Text.Trim())) { this.txtBOMCode.Text = string.Empty; }
                        if (string.IsNullOrEmpty(this.txtBOMName.Text.Trim())) { this.txtBOMName.Text = string.Empty; }
                    }
                    else
                    {
                        this.txtBOMCode.Text = string.Empty;
                        this.txtBOMName.Text = string.Empty;
                        this.lblC.Text = string.Empty;
                    }

                    ////switch (Request.QueryString["S"].ToString())
                    ////{
                    ////    case "MKT":
                    ////    case "RND":
                    ////    case "ITD":
                    ////        this.btnSave.Visible = true;
                    ////        break;
                    ////    default:
                    ////        this.btnSave.Visible = false;
                    ////        break;
                    ////}

                    Session["hash"] = hash;
                    //this.btnDel.Visible = true;                     
                    //this.NotifyWarn.Text = "<B>[  Not found BOM Code ]</B> <br> Entry BOM Code for Save !!"; this.NotifyWarn.Show();

                    this.btnSave.Visible = true;
                }
            }
        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash. 
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
        }
        // Verify a hash against a string. 
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            // Hash the input. 
            string hashOfInput = GetMd5Hash(md5Hash, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtBOMCode.Text.Trim())) { this.NotifyWarn.Text = "Please Entry BOM Code !!"; this.NotifyWarn.Show(); return; }

            if (!Duplicate())
            {
                this.NotifyWarn.Text = "Duplicate BOM Code !!"; this.NotifyWarn.Show();
                this.txtBOMCode.Focus();
                return;
            }

            SqlCommand cmdIns = new SqlCommand();
            SqlConnection cn = new SqlConnection(NP_Cls.strconn);
            if (cn.State == System.Data.ConnectionState.Open) { cn.Close(); }
            cn.Open(); SqlTransaction Tr; Tr = cn.BeginTransaction();

            try
            {
                NP_Cls.sqlInsert = "INSERT INTO PCA_ITAsset.dbo.bg_BOM (BOMCode, BOMName, HashCode, VenCode, CreateUser) VALUES (@BOMCode, @BOMName, @HashCode, @VenCode, @CreateUser)";

                cmdIns.Parameters.Add("@BOMCode", System.Data.SqlDbType.NVarChar, 20).Value = this.txtBOMCode.Text.Trim();
                cmdIns.Parameters.Add("@BOMName", System.Data.SqlDbType.NVarChar, 500).Value = this.txtBOMName.Text.Trim();
                cmdIns.Parameters.Add("@HashCode", System.Data.SqlDbType.NVarChar).Value = Session["hash"].ToString();
                cmdIns.Parameters.Add("@VenCode", System.Data.SqlDbType.NVarChar).Value = this.txtVenCode.Text.Trim();
                cmdIns.Parameters.Add("@CreateUser", System.Data.SqlDbType.NVarChar, 50).Value = (Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName);

                cmdIns.Connection = cn; cmdIns.CommandText = NP_Cls.sqlInsert; cmdIns.Transaction = Tr;
                cmdIns.ExecuteNonQuery();

                cmdIns.Parameters.Clear();
                string strUniq = NP.GetWithTran("SELECT BOMUniq FROM PCA_ITAsset.dbo.bg_BOM WHERE (BOMCode = '" + this.txtBOMCode.Text.Trim() + "')", cn, Tr).Tables[0].Rows[0][0].ToString();

                NP_Cls.sqlInsert = "INSERT INTO PCA_ITAsset.dbo.bg_BOMDetail (BOMUniq, FMITEMNO, FMITEMDESC, FMQTY) VALUES (@BOMUniq, @FMITEMNO, @FMITEMDESC, @FMQTY)";
                cmdIns.Parameters.Add("@BOMUniq", System.Data.SqlDbType.UniqueIdentifier);
                cmdIns.Parameters.Add("@FMITEMNO", System.Data.SqlDbType.NVarChar, 50);
                cmdIns.Parameters.Add("@FMITEMDESC", System.Data.SqlDbType.NVarChar, 255);
                cmdIns.Parameters.Add("@FMQTY", System.Data.SqlDbType.Int);

                for (int i = 0; i < this.RadGrid1.Items.Count; i++)
                {
                    cmdIns.Parameters["@BOMUniq"].Value = new Guid(strUniq);
                    cmdIns.Parameters["@FMITEMNO"].Value = this.RadGrid1.Items[i]["clnItemCode"].Text.Trim();
                    cmdIns.Parameters["@FMITEMDESC"].Value = this.RadGrid1.Items[i]["clnItemDesc"].Text.Trim();
                    cmdIns.Parameters["@FMQTY"].Value = decimal.Parse(this.RadGrid1.Items[i]["clnQty"].Text.Trim());
                    cmdIns.Connection = cn; cmdIns.CommandText = NP_Cls.sqlInsert; cmdIns.Transaction = Tr;
                    cmdIns.ExecuteNonQuery();
                }

                Tr.Commit();

                if (Session["DT"] != null) { Session.Remove("DT"); }

                this.NotifySave.Text = "Save BOM Code Completed"; this.NotifySave.AutoCloseDelay = 1500; this.NotifySave.Show(); this.btnSave.Visible = false;
                this.txtBOMCode.Focus();
            }
            catch (Exception ex)
            {
                this.NotifyWarn.Text = ex.Message; this.NotifyWarn.Show(); return;
            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open) { cn.Close(); }
            }
        }
        private bool Duplicate()
        {
            NP_Cls.sqlSelect = "SELECT BOMCode FROM PCA_ITAsset.dbo.bg_BOM WHERE (BOMCode = '" + this.txtBOMCode.Text.Trim() + "')";
            if (NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr).Tables[0].Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtBOMCode.Text.Trim()))
            {
                this.NotifyWarn.Text = "Please Entry BOM Code !!"; this.NotifyWarn.Show();
                //this.ltBomCode.Items.Clear();
                return;
            }

            NP_Cls.sqlSelect = "SELECT   RTRIM(PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO) AS CODE, RTRIM(PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO) + ' : ' + RTRIM(PCA_ITAsset.dbo.bg_BOMDetail.FMITEMDESC) AS DSC FROM         PCA_ITAsset.dbo.bg_BOM INNER JOIN                       PCA_ITAsset.dbo.bg_BOMDetail ON PCA_ITAsset.dbo.bg_BOM.BOMUniq = PCA_ITAsset.dbo.bg_BOMDetail.BOMUniq WHERE  (PCA_ITAsset.dbo.bg_BOM.BOMCode = N'" + this.txtBOMCode.Text.Trim() + "') ORDER BY PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO";
            DataSet ds = new DataSet();
            ds = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //this.ltBomCode.DataSource = ds.Tables[0];
                //this.ltBomCode.DataBind();
                this.txtBOMCode.Focus();
            }
            else
            {
                this.NotifyWarn.Text = "Data Not Found BOM Code : <b>" + this.txtBOMCode.Text.Trim() + "</b>"; this.NotifyWarn.Show();
                this.txtBOMCode.Focus();
                //this.ltBomCode.Items.Clear(); 
                if (Session["DT"] != null) { Session.Remove("DT"); }
                return;
            }
        }

        protected void cbVendorCode_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(this.cbVendorCode.Text.Trim())) { return; }
            this.cbProductCode.ClearSelection(); this.cbProductCode.SelectedIndex = 0;
            if (string.IsNullOrEmpty(this.cbProductCode.Text.Trim())) { this.btnAdd.Visible = false; }

            DataSet dsCB = new DataSet();
            dsCB = NP.Execute("SELECT     RTRIM(FMTITEMNO) AS CODE, RTRIM(FMTITEMNO) + ' : ' + [DESC]  AS DSC FROM    ICITEM WHERE  (INACTIVE = 0) AND (LEFT(RTRIM(FMTITEMNO), 4) = '" + this.cbVendorCode.SelectedValue.Substring(0, 4) + "') ORDER BY CODE", ref NP_Cls.strErr);
            DataRow dr; dr = dsCB.Tables[0].NewRow();
            dr[0] = "0"; dr[1] = string.Empty;
            dsCB.Tables[0].Rows.InsertAt(dr, 0);
            //dsCB.Tables[0].Rows.Add("0", string.Empty);
            this.cbProductCode.DataSource = dsCB.Tables[0];
            this.cbProductCode.DataBind(); this.btnAdd.Visible = true;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.cbVendorCode.Text.Trim())) { this.NotifyWarn.Text = "Please select Vendor !!"; this.NotifyWarn.Show(); return; }

            //Clear
            this.txtVenCode.Text = string.Empty; this.txtBOMCode.Text = string.Empty; this.txtBOMName.Text = string.Empty; this.RadGrid1.DataSource = null;
            //this.numQty.Value = null;

            this.txtVenCode.Text = this.cbVendorCode.Text.Split(':')[0].Trim();
            if (string.IsNullOrEmpty(this.cbProductCode.Text.Trim()))
            {

            }
            else
            {
                this.txtBOMCode.Text = this.cbProductCode.Text.Split(':')[0].Trim();
                this.txtBOMName.Text = this.cbProductCode.Text.Split(':')[1].Trim();
            }

            // ItemCode
            DataSet dsCB = new DataSet();
            dsCB = NP.Execute("SELECT   RTRIM(FMITEMNO) AS CODE, RTRIM(FMITEMDESC) AS DSC FROM PCA_ITAsset.dbo.bg_tmpItem WHERE (VendorCode = '" + this.txtVenCode.Text.Trim().Substring(0, 4) + "') ORDER BY CODE", ref NP_Cls.strErr);
            DataRow dr; dr = dsCB.Tables[0].NewRow();
            dr[0] = "0"; dr[1] = string.Empty;
            dsCB.Tables[0].Rows.InsertAt(dr, 0);
      
            DataSet dsRad = new DataSet(); dsRad = dsCB.Copy();
            dsRad.Tables[0].Rows.RemoveAt(0);

            this.rgChoose.DataSource = dsRad.Tables[0]; this.rgChoose.DataBind();
            Session["ND"] = dsRad;
            //if (Session["DT"] == null)
            //{
            //    DataTable dt = new DataTable();
            //    dt.Columns.Add("CODE"); dt.Columns.Add("DSC");
            //    dt.Rows.Add(this.cbProductCode.SelectedValue, this.cbProductCode.Text.Trim());
            //    dt.AcceptChanges();

            //    this.ltBomCode.DataSource = dt; this.ltBomCode.DataBind();
            //    Session["DT"] = dt.Copy();
            //}
            //else
            //{
            //    for (int dup = 0; dup < this.ltBomCode.Items.Count; dup++)
            //    {
            //        if (this.ltBomCode.Items[dup].Value == this.cbProductCode.SelectedValue)
            //        {
            //            this.NotifyWarn.Text = "Product Code already Added !!"; this.NotifyWarn.Show(); return;
            //        }
            //    }

            //    DataTable dtDup = new DataTable();
            //    dtDup = (DataTable)Session["DT"];
            //    dtDup.Rows.Add(this.cbProductCode.SelectedValue, this.cbProductCode.Text.Trim());
            //    dtDup.AcceptChanges();

            //    DataView dv; dv = dtDup.DefaultView;
            //    dv.Sort = "CODE";

            //    this.ltBomCode.DataSource = dv.ToTable(); this.ltBomCode.DataBind();
            //    Session["DT"] = dv.ToTable().Copy();
            //}
            //this.btnD.Visible = true;

     
            //Bulid Grid
            BuildGrid(this.cbProductCode.SelectedValue.ToString());

            // Commamd
            Command("VIEW");
        }

        private void Command(string Type)
        {
            switch (Type.ToUpper())
            {
                case "VIEW":
                    this.btnNew.Enabled = true;
                    break;
                default:
                    break;
            }
        }

        private void BuildGrid(string strPro = null)
        {
            NP_Cls.sqlSelect = "SELECT 0 as ItemNo,   PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO,PCA_ITAsset.dbo. bg_BOMDetail.FMITEMDESC, PCA_ITAsset.dbo.bg_BOMDetail.FMQTY AS QTY, PCA_ITAsset.dbo.bg_BOM.HashCode FROM  PCA_ITAsset.dbo.bg_BOM INNER JOIN  PCA_ITAsset.dbo.bg_BOMDetail ON PCA_ITAsset.dbo.bg_BOM.BOMUniq = PCA_ITAsset.dbo.bg_BOMDetail.BOMUniq WHERE  (PCA_ITAsset.dbo.bg_BOM.BOMCode = N'" + strPro + "') ORDER BY PCA_ITAsset.dbo.bg_BOMDetail.FMITEMNO";
            DataSet dsCom = new DataSet(); dsCom = NP.Execute(NP_Cls.sqlSelect, ref NP_Cls.strErr);
            this.btnDel.Visible = false;
            DataTable dt = new DataTable(); this.lblC.Text = string.Empty;
            for (int c = 0; c < dsCom.Tables[0].Rows.Count; c++)
            {
                dsCom.Tables[0].Rows[c][0] = c + 1;

                foreach (GridDataItem item in rgChoose.Items)
                {
                    RadNumericTextBox numQ = item.FindControl("numQty") as RadNumericTextBox;
                    if ((item["clnCode"].Text.Trim().CompareTo(dsCom.Tables[0].Rows[c]["FMITEMNO"].ToString().Trim()) == 0) && (numQ.Value == null))
                    {
                        //OLD
                        numQ.Value = double.Parse(dsCom.Tables[0].Rows[c]["QTY"].ToString().Trim());
                    }
                }
                this.lblC.Text = dsCom.Tables[0].Rows[0]["HashCode"].ToString();
            }
            dsCom.Tables[0].Columns.Remove("HashCode");
            this.RadGrid1.DataSource = dsCom.Tables[0]; this.RadGrid1.DataBind();
            Session["DT"] = dsCom.Tables[0].Copy();
        }
        protected void btnBOM_Click(object sender, EventArgs e)
        {
            string strShow = string.Empty;
            if (Session["DT"] == null)
            { 
                DataTable dt = new DataTable();
                foreach (GridDataItem item in rgChoose.Items)
                {
                    RadNumericTextBox numQ = item.FindControl("numQty") as RadNumericTextBox;
                    if (numQ.Value != null)
                    {
                        strShow += numQ.Value.ToString();

                        //OLD
                       
                        dt.Columns.Add("ItemNo"); dt.Columns.Add("FMITEMNO"); dt.Columns.Add("FMITEMDESC"); dt.Columns.Add("QTY");
                        dt.Rows.Add(1, item["clnCode"].Text.Trim(), item["clnDesc"].Text.Trim(), numQ.Value.ToString());
                        dt.AcceptChanges();
                    }
                }
                this.RadGrid1.DataSource = dt; this.RadGrid1.DataBind();
                Session["DT"] = dt.Copy();
             
            }
            else
            {
                //for (int dup = 0; dup < this.RadGrid1.Items.Count; dup++)
                //{
                //    if (this.RadGrid1.Items[dup]["clnItemCode"].Text.Trim() == this.cbItemCode.SelectedValue)
                //    {
                //        this.NotifyWarn.Text = "Product Code already Added !!"; this.NotifyWarn.Show(); return;
                //    }
                //}
                DataTable dtDup = new DataTable();
                dtDup = (DataTable)Session["DT"];
                dtDup.Rows.Clear();
                foreach (GridDataItem item in rgChoose.Items)
                {
                    RadNumericTextBox numQ = item.FindControl("numQty") as RadNumericTextBox;
                    if (numQ.Value != null)
                    {
                        strShow += numQ.Value.ToString();

                        dtDup.Rows.Add(1, item["clnCode"].Text.Trim(), item["clnDesc"].Text.Trim(), numQ.Value.ToString());
                        dtDup.AcceptChanges();

                        DataView dv; dv = dtDup.DefaultView;
                        dv.Sort = "FMITEMNO";

                        dtDup = new DataTable(); dtDup = dv.ToTable();

                        for (int i = 0; i < dtDup.Rows.Count; i++)
                        {
                            dtDup.Rows[i][0] = i + 1;
                        }
                    }
                }
                this.RadGrid1.DataSource = dtDup; this.RadGrid1.DataBind();
                Session["DT"] = dtDup.Copy();
                //this.cbItemCode.Focus();
            }
            if (string.IsNullOrEmpty(strShow)) { this.NotifyWarn.Text = "Please entry Quantity !!!"; this.NotifyWarn.Show(); return; }
            
            //Check
            CheackH(0);
        }
        
        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.txtBOMCode.Text = string.Empty; this.txtBOMName.Text = string.Empty; this.txtVenCode.Text = string.Empty;
            //this.cbItemCode.ClearSelection(); this.cbItemCode.Text = string.Empty;
            //this.cbItemCode.SelectedIndex = 0; this.numQty.Value = null; 
            this.btnDel.Visible = false;
            this.cbVendorCode.ClearSelection(); this.txtVenCode.Text = string.Empty; this.cbVendorCode.SelectedIndex = 0;
            this.cbProductCode.ClearSelection(); this.cbProductCode.Text = string.Empty; this.cbProductCode.SelectedIndex = 0;

            this.rgChoose.DataSource = null; this.rgChoose.DataBind();
           
            BuildGrid();

            foreach (GridDataItem item in rgChoose.Items)
            {
                RadNumericTextBox numQ = item.FindControl("numQty") as RadNumericTextBox;
                numQ.Value = null;
            }

            this.cbVendorCode.Focus();
        }
        protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (Session["DT"] != null)
            {
                DataTable dt = new DataTable(); dt = (DataTable)Session["DT"];
                dt.Rows.RemoveAt(e.Item.ItemIndex);
                dt.AcceptChanges();

                this.RadGrid1.DataSource = dt; this.RadGrid1.DataBind();

                //Check
                CheackH(0);
            }
        }
        protected void btnDel_Click(object sender, EventArgs e)
        {
            return;
        }

    }
}