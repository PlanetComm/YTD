<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QTExpire.aspx.cs" Inherits="YTD.QTExpire" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>[ Quote Expire Report ]</title>
</head>
<body>
  <form id="form1" runat="server">
  <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel> 
    
    <table border="0" cellpadding="0" cellspacing="0" width="1000px">
    <tr>
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ Quote Expire Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" 
            ForeColor="#0066FF"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px" >
        </telerik:RadButton>
    
        </td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">
        <br />
        &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" 
            Font-Names="Tahoma" Font-Size="12px" Text="Select Month / Year :"></asp:Label>
&nbsp;<telerik:RadMonthYearPicker ID="dtpMY" Runat="server" Width="200px">
        </telerik:RadMonthYearPicker>
        <telerik:RadButton ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Search" Width="150px">
        </telerik:RadButton>
        <br />
        <br /></td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
         <telerik:RadGrid ID="rgPOGDS" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Office2007" 
                    AllowSorting="True" 
                onneeddatasource="rgPOGDS_NeedDataSource" 
             AllowPaging="True" PageSize="25" AllowFilteringByColumn="True" >
             <GroupingSettings CaseSensitive="False" />
             <ExportSettings FileName="">
             </ExportSettings>
             <ClientSettings EnableRowHoverStyle="True">
                 <Selecting AllowRowSelect="True" />
                 <Scrolling UseStaticHeaders="True" />
                
             </ClientSettings>
             <MasterTableView ShowFooter="True" AutoGenerateColumns="false">
                 <CommandItemSettings ExportToPdfText="Export to PDF" />
                 <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                 </RowIndicatorColumn>
                 <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                 </ExpandCollapseColumn>
                 <Columns>
                     <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="ORDNUMBER"
                         FilterControlAltText="Filter clnID column" HeaderText="SO #" 
                         UniqueName="clnSO">
                     </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CUSTOMER" 
                         FilterControlAltText="Filter clnID column" HeaderText="Customer" 
                         UniqueName="clnCust">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="BILNAME" 
                         FilterControlAltText="Filter clnID column" HeaderText="Customer Name" 
                         UniqueName="clnCustName">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="QTEXPDATE"
                         FilterControlAltText="Filter clnID column" HeaderText="QT Expire Date" 
                         UniqueName="clnQTExpDate">
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
