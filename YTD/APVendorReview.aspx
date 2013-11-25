<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APVendorReview.aspx.cs" Inherits="YTD.APVendorReview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ AP Vendor Review Report ]</title>
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
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ AP Vendor Review Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#00A000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px" >
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
             <MasterTableView ShowFooter="True" AutoGenerateColumns="false">
                 <CommandItemSettings ExportToPdfText="Export to PDF" />
                 <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                 </RowIndicatorColumn>
                 <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                 </ExpandCollapseColumn>
                 <Columns>
                     <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="VendorID" 
                         FilterControlAltText="Filter clnID column" HeaderText="ID" UniqueName="clnID">
                     </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="SHORTNAME" 
                         FilterControlAltText="Filter clnID column" HeaderText="Short Name" UniqueName="clnSH">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="IDGRP" 
                         FilterControlAltText="Filter clnID column" HeaderText="ID Group" UniqueName="clnGRP">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="DATEINAC" 
                         FilterControlAltText="Filter clnID column" HeaderText="Date Inactive" UniqueName="clnDateInac">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="DATESTART"
                         FilterControlAltText="Filter clnID column" HeaderText="Start Date" UniqueName="clnDateStr">
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="VENDNAME" 
                         FilterControlAltText="Filter clnID column" HeaderText="Vendor Name" UniqueName="clnVenName">
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="StartsWith" DataField="SWACTV" 
                         FilterControlAltText="Filter clnStatus column" HeaderText="Status" 
                         UniqueName="clnStatus">
                                 <HeaderStyle HorizontalAlign="Center" />
                                 <ItemStyle HorizontalAlign="Center" Width="80px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TEXTSTRE1" 
                         FilterControlAltText="Filter clnID column" HeaderText="Addr 1" UniqueName="clnAddr1">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TEXTSTRE2" 
                         FilterControlAltText="Filter clnID column" HeaderText="Addr 2" UniqueName="clnAddr2">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TEXTSTRE3" 
                         FilterControlAltText="Filter clnID column" HeaderText="Addr 3" UniqueName="clnAddr3">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TEXTSTRE4" 
                         FilterControlAltText="Filter clnID column" HeaderText="Addr 4" UniqueName="clnAddr4">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="NAMECITY" 
                         FilterControlAltText="Filter clnID column" HeaderText="City" UniqueName="clnCity">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CODESTTE" 
                         FilterControlAltText="Filter clnID column" HeaderText="Province" UniqueName="clnProvince">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CODEPSTL" 
                         FilterControlAltText="Filter clnID column" HeaderText="Zipcode" UniqueName="clnZip">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CODECTRY" 
                         FilterControlAltText="Filter clnID column" HeaderText="Country" UniqueName="clnCountry">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="NAMECTAC" 
                         FilterControlAltText="Filter clnID column" HeaderText="Contact" UniqueName="clnContact">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TEXTPHON1" 
                         FilterControlAltText="Filter clnID column" HeaderText="Phone 1" UniqueName="clnPhone1">
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TEXTPHON2" 
                         FilterControlAltText="Filter clnID column" HeaderText="Phone 2" UniqueName="clnPhone2">
                     </telerik:GridBoundColumn>
                     
                                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="IDACCTSET" 
                         FilterControlAltText="Filter clnID column" HeaderText="Account Set" UniqueName="clnAccSet">
                     </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CURNCODE" 
                         FilterControlAltText="Filter clnID column" HeaderText="Currency Code" UniqueName="clnCurr">
                     </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="TERMSCODE" 
                         FilterControlAltText="Filter clnID column" HeaderText="Terms" UniqueName="clnTerms">
                     </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="AMTCRLIMT" DataFormatString="{0:#,#0.00}"
                         FilterControlAltText="Filter clnCrLimit column" HeaderText="Credit Limit" 
                         UniqueName="clnCrLimit">
                     </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="EMAIL1" 
                         FilterControlAltText="Filter clnID column" HeaderText="Email 1" UniqueName="clnEmail1">
                     </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="EMAIL2" 
                         FilterControlAltText="Filter clnID column" HeaderText="Email 2" UniqueName="clnEmail2">
                     </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="WEBSITE" 
                         FilterControlAltText="Filter clnID column" HeaderText="WEBSITE" UniqueName="clnWebsite">
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
