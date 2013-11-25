<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APVendor.aspx.cs" Inherits="YTD.APVendor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ AR Customer Review Report ]</title>
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
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ AR Customer Review Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" 
            ForeColor="#990000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <telerik:RadButton ID="btnExportExcel" runat="server" 
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
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
         <telerik:RadGrid ID="rgPOGDS" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Metro" 
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
             <MasterTableView ShowFooter="True">
                 <CommandItemSettings ExportToPdfText="Export to PDF" />
                 <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                 </RowIndicatorColumn>
                 <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                 </ExpandCollapseColumn>
                 <Columns>
                     <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CusNo" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Customer Number" 
                         UniqueName="clnCusNo">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CusName" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Customer Name" 
                         UniqueName="clnCusName">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CusSh" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Short Name" 
                         UniqueName="clnCusSh">
                     </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Address" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Address" 
                         UniqueName="clnAddress">
                     </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Phone" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Phone" 
                         UniqueName="clnPhone">
                     </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="FAX" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Fax" 
                         UniqueName="clnFax">
                     </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Contact" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Contact" 
                         UniqueName="clnContact">
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="ContactPhone" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Contact Phone" 
                         UniqueName="clnContactPhone">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="ContactFax" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Contact Fax" 
                         UniqueName="clnContactFax">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Email" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Email" 
                         UniqueName="clnEmail">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Active" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Active" 
                         UniqueName="clnActive">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="InOn" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Inactive On" 
                         UniqueName="clnInOn">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="LastMA" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Last Maintained" 
                         UniqueName="clnLastMA">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="GRP" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Group Code" 
                         UniqueName="clnGRP">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="STRDATE" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Start Date" 
                         UniqueName="clnSTRDATE">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TERRITORY" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Territory" 
                         UniqueName="clnTerritory">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="AccTy" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Account Type" 
                         UniqueName="clnAccTy">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="AccSET" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Account Set" 
                         UniqueName="clnAccSET">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Bill" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Billing Cycle" 
                         UniqueName="clnBill">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PayCode" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Paymane Code" 
                         UniqueName="clnPayCode">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Term" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Terms Code" 
                         UniqueName="clnTerm">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Cr" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Credit Limited" 
                         UniqueName="clnCR">
                     </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="Custaxid" 
                         FilterControlAltText="Filter cknCusNo column" HeaderText="Cust TAX" 
                         UniqueName="clnCusTax">
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
