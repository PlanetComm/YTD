<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSorting.aspx.cs" Inherits="YTD.EditSorting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function CloseAndRebind(args) {
                        GetRadWindow().BrowserWindow.refreshGrid(args);
                        GetRadWindow().close();
            //window.location = "OrderManagement.aspx?CT="+ args
        }

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

            return oWindow;
        }

        function CancelEdit() {
            GetRadWindow().close();
        }

          
        </script>
</head>

<body style="font-family:Tahoma;font-size:12px;">
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
</telerik:RadScriptManager>
    <div style="padding:10px 10px 10px 10px;">
    <table border="0" cellpadding="2" cellspacing="2" width="700px">
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        Contract No. :</td>
    <td style="width:auto;padding-left:10px; background-color: #FFCC99;" align="left">
        <asp:Label ID="lblContractNo" runat="server" Text="---" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px; " align="right">
        Item Code :</td>
    <td style="width:auto;padding-left:10px; background-color: #FFCC99;" align="left">
        <asp:Label ID="lblItemCode" runat="server" Text="----"></asp:Label>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        Item Description :</td>
    <td style="width:auto;padding-left:10px; background-color: #FFCC99;" align="left">
        <asp:Label ID="lblItemDesc" runat="server" Text="-----"></asp:Label>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        Comment :</td>
    <td style="width:auto;padding-left:0px;" align="left">
        <telerik:RadTextBox ID="txtComment" Runat="server" Rows="10" Skin="Simple" 
            TextMode="MultiLine" Width="500px">
        </telerik:RadTextBox>
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">
        Request Date :</td>
    <td style="width:auto;padding-left:0px;" align="left">
        <telerik:RadDatePicker ID="dtpETA" Runat="server" Culture="en-US" Skin="Sunset" 
            Width="252px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" 
                ViewSelectorText="x" Skin="Sunset">
    <SpecialDays>
        <telerik:RadCalendarDay Date="" Repeatable="Today">
            <ItemStyle BackColor="#FF9966" />
        </telerik:RadCalendarDay>
    </SpecialDays>
            </Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
        </telerik:RadDatePicker>
        <asp:CheckBox ID="ChkAll" runat="server" Font-Bold="True" 
            Text="Add to all item" />
        </td>
    </tr>
    <tr>
    <td style="background-color:#EEEEEE;width:150px;padding-right:10px;" align="right">&nbsp;</td>
    <td style="width:auto;padding-left:0px;" align="left">
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
        <asp:Label ID="lblType" runat="server" Text="TYPE" Visible="False"></asp:Label>
                         </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
