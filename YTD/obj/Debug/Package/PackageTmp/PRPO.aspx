<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PRPO.aspx.cs" Inherits="YTD.PRPO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ PR Report ]</title>
</head>
<body>
    <form id="form1" runat="server">
 <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel> 
    
    <table border="0" cellpadding="0" cellspacing="0" width="1200px">
    <tr>
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ PR Report ]" 
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
             AllowPaging="True" PageSize="50" AllowFilteringByColumn="True" >
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
                     <telerik:GridBoundColumn DataField="RQNNUMBER" 
                         FilterControlAltText="Filter clnPR column" HeaderText="PR No." 
                         UniqueName="clnPR" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                         <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="PONUMBER" 
                         FilterControlAltText="Filter clnPO column" HeaderText="PO No." 
                         UniqueName="clnPO" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                          <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="LOCATION" 
                         FilterControlAltText="Filter clnLocation column" HeaderText="Location" 
                         UniqueName="clnLocation" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="100px" />
                     </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UID" 
                         FilterControlAltText="Filter clnItemNo column" HeaderText="UID" 
                         UniqueName="clnUID" AutoPostBackOnFilter="True"  FilterControlWidth="60px"
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="150px" />
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="ITEMNO" 
                         FilterControlAltText="Filter clnItemNo column" HeaderText="Item No." 
                         UniqueName="clnItemNo" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="ITEMDESC"
                         FilterControlAltText="Filter clnItemDesc column" HeaderText="Description" 
                         UniqueName="clnItemDesc" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="300px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="COMMENT" 
                         FilterControlAltText="Filter clnComment column" HeaderText="Comment" 
                         UniqueName="clnComment" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                 <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="OEONUMBER" 
                         FilterControlAltText="Filter clnSO column" HeaderText="SO" 
                         UniqueName="clnSO" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                 <HeaderStyle HorizontalAlign="Center" Width="100px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ETA" 
                         FilterControlAltText="Filter clnETA column" HeaderText="ETA" 
                         UniqueName="clnETA" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                 <HeaderStyle HorizontalAlign="Center" Width="100px" />
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PrepareBy" 
                         FilterControlAltText="Filter clnPrepareBy column" HeaderText="Prepare By" 
                         UniqueName="clnPrepareBy" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                <HeaderStyle HorizontalAlign="Center" Width="300px" />
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
