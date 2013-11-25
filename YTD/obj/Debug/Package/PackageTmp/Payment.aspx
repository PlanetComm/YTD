<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="YTD.Payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ AP Payment Report ]</title>
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
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ AP Payment Report ]" 
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
             AllowPaging="True" PageSize="25" AllowFilteringByColumn="True" 
             onitemdatabound="rgPOGDS_ItemDataBound" >
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
                         CurrentFilterFunction="Contains" DataField="RCPHSEQ" Display="false"
                         FilterControlAltText="Filter clnID column" HeaderText="ID" UniqueName="clnID">
                     </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="VENCODE" 
                         FilterControlAltText="Filter clnID column" HeaderText="VENCODE" UniqueName="clnSH">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="VENNAME" 
                         FilterControlAltText="Filter clnID column" HeaderText="VENNAME" UniqueName="clnGRP">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="RECNO" 
                         FilterControlAltText="Filter clnID column" HeaderText="RECNO" UniqueName="clnDateInac">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PONO"
                         FilterControlAltText="Filter clnID column" HeaderText="PONO" UniqueName="clnDateStr">
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="INVNO" 
                         FilterControlAltText="Filter clnID column" HeaderText="INVNO" UniqueName="clnVenName">
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="StartsWith" DataField="RECDATE" 
                         FilterControlAltText="Filter clnStatus column" HeaderText="RECDATE" 
                         UniqueName="clnStatus">
                                 <HeaderStyle HorizontalAlign="Center" />
                                 <ItemStyle HorizontalAlign="Center" Width="80px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="WYEAR"  Display="false"
                         FilterControlAltText="Filter clnID column" HeaderText="Addr 1" UniqueName="clnAddr1">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="RECCUR" 
                         FilterControlAltText="Filter clnID column" HeaderText="RECCUR" UniqueName="clnAddr2">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="RECRATE" 
                         FilterControlAltText="Filter clnID column" HeaderText="RECRATE" UniqueName="clnAddr3">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="RECBFAMT" DataFormatString="{0:#,#.00}"
                         FilterControlAltText="Filter clnID column" HeaderText="RECBFAMT" UniqueName="clnAddr4">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="RECATAMT" DataFormatString="{0:#,#.00}"

                         FilterControlAltText="Filter clnID column" HeaderText="RECATAMT" UniqueName="clnCity">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PAYDATE" 
                         FilterControlAltText="Filter clnID column" HeaderText="PAYDATE" UniqueName="clnProvince">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PAYCURR" 
                         FilterControlAltText="Filter clnID column" HeaderText="PAYCURR" UniqueName="clnZip">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PAYRATE" 
                         FilterControlAltText="Filter clnID column" HeaderText="PAYRATE" UniqueName="clnCountry">
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PAYAMT" DataFormatString="{0:#,#.00}"
                         FilterControlAltText="Filter clnID column" HeaderText="PAYAMT" UniqueName="clnContact">
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="PAYINTHB" DataFormatString="{0:#,#.00}"
                         FilterControlAltText="Filter clnID column" HeaderText="PAYINTHB" UniqueName="clnPhone1">
                     </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="GL" DataFormatString="{0:#,0.00}"
                         FilterControlAltText="Filter clnID column" HeaderText="Gain / Loss" UniqueName="clnGL">
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
