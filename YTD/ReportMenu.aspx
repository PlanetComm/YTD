<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMenu.aspx.cs" Inherits="YTD.ReportMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="margin-top:0px;font-family:Tahoma;">
    <form id="frm1" runat="server">
    <div align="center">
    <table border="0" cellpadding="0" cellspacing ="0" width="1000px" style="background:#2672EC;">
    <tr>
    <td style="width:100%;"><h2 style="color:white;padding:5px 5px 5px 5px;">[ ACCPAC Report on WEB ]</h2></td>
    </tr>
    <tr>
    <td style="width:990px;">
    <div style="padding:10px 10px 10px 10px;">
        <table border="0" cellpadding="1" cellspacing ="3" width="100%">
        <tr  style="background:white;">
        <td style="color:#094AB2;;padding:5px 5px 5px 5px;font-size:18px;font-weight:bold;">Order Processing</td>
        </tr>
        <tr  style="background:white;">
        <td>
                 <table border="0" cellpadding="0" cellspacing ="0" width="100%">
                 <tr>
                    <td style="height:35px;color:Black;padding:3px 3px 3px 10px;width:200px;" align="left">Sales Order</td>
                    <td style="height:35px;color:Black;padding:3px 3px 3px 10px;width:250px;font-size:13px;" align="left">
                        STATUS :: 
                        <select id="drpStatus" name="D1" style="width:140px;">
                            <option value="I">Incomplete</option>
                            <option value="A">All</option>
                        </select>
                    </td>
                     <td style="height:35px;color:Black;padding:3px 3px 3px 10px;width:250px;font-size:13px;" align="left">
                        YEAR :: 
                        <select name="txtYear" style="width:100px;">
			<option value="0" >All</option>
			<option value="<%=DateTime.Now.Year.ToString()%>"><%=DateTime.Now.Year.ToString()%></option>
		    <option value="<%=(DateTime.Now.Year-1).ToString()%>"><%=(DateTime.Now.Year - 1).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-2).ToString()%>"><%=(DateTime.Now.Year - 2).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-3).ToString()%>"><%=(DateTime.Now.Year - 3).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-4).ToString()%>"><%=(DateTime.Now.Year - 4).ToString()%></option>
		</select>
                    </td>
                    <td style="height:35px;color:Black;padding:3px 3px 3px 10px;width:auto;" align="left">
                    <asp:Button ID="btnExcelSale" runat="server" BackColor="White" 
                        BorderColor="#094AB2" BorderStyle="Solid" BorderWidth="2px" 
                        ButtonType="LinkButton" Height="25px" OnClientClick="rptexcel(1);"
                        Text="Excel" Visible="true" Width="100px" Font-Size="11px" 
                            CausesValidation="False"  >
                    </asp:Button>&nbsp;<asp:Button ID="btnWebSale" runat="server" BackColor="White" 
                        BorderColor="#094AB2" BorderStyle="Solid" BorderWidth="2px" 
                        ButtonType="LinkButton" Height="25px" OnClientClick="rptexcel(2);"
                        Text="Web" Visible="true" Width="100px" Font-Size="11px" 
                            CausesValidation="False" >
                    </asp:Button>
                    </td>
                 </tr>
                 </table>
        </td>
        </tr>
         <tr>
        <td></td>
        </tr>
        </table>
        </div>
    </td>
    </tr>
    <tr>
    <td style="width:100%;">&nbsp;</td>
    </tr>
    </table>
    </div>
    </form>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script language="javascript">

            // Menu

            function pogds() {
                window.open('http://192.168.73.39/YTD/PO_GoodsInTransit.aspx');
            }

            function oesummaryrpt(n) {

                window.open('http://192.168.73.39/YTD/SO_ReCheck.aspx');
            }

            function rptexcel(n) {

                window.open('http://192.168.73.39/ACCPAC/SO-OPReportExcel.asp?typ=' + n + '&drpStatus=' + document.frm1.drpStatus.value + '&txtYear=' + document.frm1.txtYear.value);
            }
            function icrptexcel(ty) {
                window.open('http://192.168.73.39/ACCPAC/IC-OPReportExcel.asp?typ=' + ty);
            }
            function pjcrptexcel(ty) {
                //window.open('http://192.168.73.39/ACCPAC/PJC-OPReportExcel.asp?typ=' + ty);
                window.open('http://192.168.73.39/YTD/OrderManagement.aspx');
            }

            function sooutrpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/SO-OutStanding.asp?typ=' + ty);
            }
            function sooutcaterpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/SO-OutStanding_Cate.asp?typ=' + ty);
            }

            function porpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/PO-OPReportExcel.asp?typ=' + ty + '&txtYear=' + document.frm1.txtYearPO.value);
            }

            function invrpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/INV-YTD.asp?typ=' + ty);
            }

            function soytdrpt() {

                window.open('http://192.168.73.39/YTD/YTD_Market.aspx');
            }

            function soytdcaterpt() {

                window.open('http://192.168.73.39/YTD/Default.aspx');
            }


            function sooutnewrpt() {

                window.open('http://192.168.73.39/YTD/SOOutStanding_Market.aspx');
            }

            function bom() {
                window.open('http://192.168.73.39/YTD/BOMGenerate.aspx?N=' + N + '&S=' + S);
            }

            function costpt() {
                window.open('http://192.168.73.39/YTD/ProjCost.aspx?N=' + N);
            }

            function projpricerpt() {
                window.open('http://192.168.73.39/YTD/ProjPrice.aspx');
            }

            function prodcaterpt() {
                window.open('http://192.168.73.39/YTD/ProdCateIntensive.aspx');
            }

            function sohisrpt() {
                window.open('http://192.168.73.39/YTD/YTD_SOHistory.aspx');
            }

            function invallrpt(ty) {
                window.open('http://192.168.73.39/YTD/TotalINV.aspx');
            }

            function userlog() {
                window.open('http://192.168.73.39/YTD/UserLog.aspx');
            }

            // End Menu 


      
 </script>
    </telerik:RadCodeBlock>
</body>
</html>
