<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BOMAddEdit.aspx.cs" Inherits="YTD.BOMAddEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family:Tahoma;font-size:12px;">
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
</telerik:RadScriptManager>
    <div style="padding:10px 10px 10px 10px;">
    <table border="0" cellpadding="2" cellspacing="2" width="700px">
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        Vendor Code :</td>
    <td style="width:auto;padding-left:10px; background-color: #F0FFF0;" align="left">
        <asp:Label ID="lblVendorNo" runat="server" Text="---" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px; " align="right">
        Item Code :</td>
    <td style="width:auto;padding-left:10px; background-color: #F0FFF0;" align="left">
        <telerik:RadTextBox ID="txtItemCode" Runat="server" Skin="Metro" Width="400px">
        </telerik:RadTextBox>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        Item Description :</td>
    <td style="width:auto;padding-left:10px; background-color: #F0FFF0;" align="left">
        <telerik:RadTextBox ID="txtItemDesc" Runat="server" Rows="3" Skin="Metro" 
            TextMode="MultiLine" Width="400px">
        </telerik:RadTextBox>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        <asp:Label ID="lblType" runat="server" Text="TYPE" Visible="False"></asp:Label>
        </td>
    <td style="width:auto;padding-left:10px;" align="left">
        <telerik:RadButton ID="btnSubmit" runat="server" BackColor="White" 
                        BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" 
                        ButtonType="LinkButton" Skin="Office2010Silver" 
                        Text="Save" Visible="true" Width="120px" Font-Size="11px" 
                 onclick="btnSubmit_Click">
                    </telerik:RadButton>
                         <telerik:RadButton ID="btnClear" runat="server" BackColor="#FFCC99" 
                        BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" 
                        ButtonType="LinkButton" Skin="Office2010Silver" 
                        Text="Close" Visible="true" Width="120px" Font-Size="11px" 
            CausesValidation="False" onclick="btnClear_Click">
                    </telerik:RadButton>
                         </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
