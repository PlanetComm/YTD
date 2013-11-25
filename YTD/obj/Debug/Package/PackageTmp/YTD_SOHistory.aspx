<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YTD_SOHistory.aspx.cs" Inherits="YTD.YTD_SOHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>[ Sales Order History Report ]</title>
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
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ Sales Order History Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#00A000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <telerik:RadButton ID="btnExportExcel" runat="server" 
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
            Skin="Office2010Black" Width="100%" 
           AllowSorting="True" 
                onneeddatasource="RadNested_NeedDataSource" 
             AllowFilteringByColumn="True"  >
            <GroupingSettings CaseSensitive="False" />
            <ExportSettings FileName="YTD_SOHistory">
            </ExportSettings>
            <ClientSettings>
                <Scrolling FrozenColumnsCount="2"  
                    UseStaticHeaders="True" />
           
            </ClientSettings>
            <MasterTableView DataKeyNames="Month,ORDNUMBER" ShowFooter="True">
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="ORDNUMBER" 
            FilterControlAltText="Filter clmSO column" HeaderText="SO#" 
            UniqueName="clmSO" Aggregate="Count" FooterText="Count : " AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Month" 
                        FilterControlAltText="Filter clnMonth column" HeaderText="Month" 
                        UniqueName="clnMonth" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="STATUS" 
                        FilterControlAltText="Filter clnStatus column" HeaderText="Status" 
                        UniqueName="clnStatus" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDERDATE" 
                        FilterControlAltText="Filter clnOrderDate column" HeaderText="Order Date" 
                        UniqueName="clnOrderDate" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EFFECTIVEDATE" 
                        FilterControlAltText="Filter clnEffectiveDate column" 
                        HeaderText="Effective Date" UniqueName="clnEffectiveDate" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SALEPERSON" 
                        FilterControlAltText="Filter clnSalePerson column" HeaderText="Sale Person" 
                        UniqueName="clnSalePerson" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SG" 
                        FilterControlAltText="Filter clnMarket column" HeaderText="Market" 
                        UniqueName="clnMarket" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SGDESC" 
                        FilterControlAltText="Filter clnMarketName column" HeaderText="Market Name" 
                        UniqueName="clnMarketName" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CUSTOMER" 
                        FilterControlAltText="Filter clnCustomer column" HeaderText="Customer" 
                        UniqueName="clnCustomer" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAMECUST" 
                        FilterControlAltText="Filter clnCustomerName column" FooterText="Total Amount :" 
                        HeaderText="Customer Name" UniqueName="clnCustomerName" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                        <FooterStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                        DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                        FilterControlAltText="Filter clnAmount column" HeaderText="Market Amount" 
                        UniqueName="clnAmount" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
                        <FooterStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDDATE" Display="False" 
                        FilterControlAltText="Filter clnOrdDate column" UniqueName="clnOrdDate" AutoPostBackOnFilter="True" 
                        CurrentFilterFunction="Contains">
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
    </table>

    </form>

</body>
</html>