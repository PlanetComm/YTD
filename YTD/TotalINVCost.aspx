<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalINVCost.aspx.cs" Inherits="YTD.TotalINVCost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>[ Invoice - Cost Report ]</title>
    <style type="text/css">


.RadGrid .rgMasterTable
{
    border-collapse:separate;
}

.RadGrid .rgMasterTable
{
    border-collapse:separate;
}

.RadGrid .rgMasterTable
{
    border-collapse:separate;
}


.RadGrid .rgMasterTable
{
    border-collapse:separate;
}

.RadGrid .rgHeader
{
	padding-top:5px;
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	cursor:default;
}

.RadGrid .rgHeader
{
	cursor:default;
}

    .RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	padding-top:5px;
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader
{
	cursor:default;
}

.RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	padding-top:5px; 
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader
{
	cursor:default;
}

.RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	padding-top:5px;
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader a
{
    text-decoration:none;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
  <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel> 
    
    <table border="0" cellpadding="0" cellspacing="0" width="1500px">
    <tr>
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ Invoice - Cost Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" 
            ForeColor="#660033"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px">
        </telerik:RadButton>
    
        </td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">&nbsp;<br /></td>
    </tr>
   <tr>
    <td align="left" style="width:50%;">
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
        <telerik:RadGrid ID="RadNested" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None"
            Skin="Web20" Width="100%" 
           AllowSorting="True" 
                onneeddatasource="RadNested_NeedDataSource" 
             AllowFilteringByColumn="True" onitemdatabound="RadNested_ItemDataBound"  >
            <GroupingSettings CaseSensitive="False" />
            <ExportSettings FileName="InvoiceCost">
            </ExportSettings>
            <ClientSettings EnableRowHoverStyle="True">
                <Selecting AllowRowSelect="True" />
                <Scrolling FrozenColumnsCount="2"  UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView DataKeyNames="INVNUMBER" ShowFooter="True">
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="INVNUMBER" 
            FilterControlAltText="Filter clnInvNumber column" HeaderText="INV#" 
            UniqueName="clnInvNumber" Aggregate="Count" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains" FooterText="Count : ">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDNUMBER" 
                        FilterControlAltText="Filter clmSO column" HeaderText="SO#" 
                        UniqueName="clnSO" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="INVDATE" 
                        FilterControlAltText="Filter clnOrderDate column" HeaderText="Invoice Date" 
                        UniqueName="clnInvDate" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CUSTOMER" 
                        FilterControlAltText="Filter clnCustomer column" HeaderText="Customer" 
                        UniqueName="clnCustomer" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAMECUST" 
                        FilterControlAltText="Filter clnCustomerName column" 
                        HeaderText="Customer Name" UniqueName="clnCustomerName" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains" FooterText="Total Amount :" 
                        FilterControlWidth="200px">
                        <FooterStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AMOUNT" 
                        FilterControlAltText="Filter clnAmount column" HeaderText="Sales Amount" 
                        UniqueName="clnAmount" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains" Aggregate="Sum" 
                        DataFormatString="{0:###,##0.00}" DataType="System.Decimal">
                        <FooterStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>

                      <telerik:GridBoundColumn DataField="COSTAMOUNT" 
                        FilterControlAltText="Filter clnAmount column" HeaderText="Cost Amount" 
                        UniqueName="clnCostAmount" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains" Aggregate="Sum" 
                        DataFormatString="{0:###,##0.00}" DataType="System.Decimal">
                        <FooterStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains" DataField="SG" 
                        FilterControlAltText="Filter clnSG column" HeaderText="SG" UniqueName="clnSG">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains" DataField="SaleP" 
                        FilterControlAltText="Filter clnSale column" HeaderText="Sale Person" 
                        UniqueName="clnSale">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDBY" 
                        FilterControlAltText="Filter clnORDBY column" HeaderText="ORDBY" 
                        UniqueName="clnORDBY" Display="False">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
                <AlternatingItemStyle BackColor="#FFFFC0" />
                <HeaderStyle ForeColor="White" />
                <FilterItemStyle BackColor="#FFFFC0" />
            </MasterTableView>
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>
        </td>        
    </tr>

    <tr>
    <td align="left" style="width:50%;">    <br />
        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" Width="100%">
            <telerik:RadGrid ID="rgSummary" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Hay" 
             onitemdatabound="rgSummary_ItemDataBound">
                <ClientSettings EnableRowHoverStyle="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView>
                    <CommandItemSettings ExportToPdfText="Export to PDF">
                    </CommandItemSettings>
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="MONTHLY" 
            FilterControlAltText="Filter clnMonth column" HeaderText="Month" 
            UniqueName="clnMonth">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="INVMONTH" DataType="System.Decimal" 
            FilterControlAltText="Filter clnSOMonth column" HeaderText="INV - Month" DataFormatString="{0:###,##0.00}"
            UniqueName="clnSOMonth">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="INVFORECAST" DataType="System.Decimal" 
            FilterControlAltText="Filter clnSOForecast column" 
            HeaderText="INV - Forecast" DataFormatString="{0:###,##0.00}"
            UniqueName="clnSOForecast">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="INVAchieve" 
            FilterControlAltText="Filter clnSOAchieve column" HeaderText="INV (% Achieve)" 
            UniqueName="clnSOAchieve">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="INVYTD" DataType="System.Decimal" 
            FilterControlAltText="Filter clnSOYTD column" HeaderText="INV - YTD" DataFormatString="{0:###,##0.00}"
            UniqueName="clnINVYTD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FORECASTYTD" DataType="System.Decimal" 
            FilterControlAltText="Filter clnForecastYTD column" 
            HeaderText="Forecast - YTD" DataFormatString="{0:###,##0.00}"
            UniqueName="clnForecastYTD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="YTDACHIEVE" DataType="System.Decimal" 
            FilterControlAltText="Filter clnYTDAchieve column" HeaderText="YTD (% Achieve)" 
            UniqueName="clnYTDAchieve">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
                <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                </HeaderContextMenu>
            </telerik:RadGrid>

        </telerik:RadAjaxPanel>
    </td>
    </tr>
    </table>

    </form>

</body>
</html>