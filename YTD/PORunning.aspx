<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PORunning.aspx.cs" Inherits="YTD.PORunning" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ PO Ruuning ]</title>
    <style type="text/css">
        .style1
        {
            width: 50%;
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnSubmit">
  <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="rgPOGDS">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" 
                            LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btnSubmit">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" 
                            LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    </telerik:RadAjaxLoadingPanel>

    <table border="0" cellpadding="0" cellspacing="0" width="1200px">
    <tr>
    <td align="left" class="style1"><asp:Label ID="Label1" runat="server" Text="[ PO Running ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#00A000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px" CausesValidation="False" UseSubmitBehavior="False" >
        </telerik:RadButton>
    
        </td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">&nbsp;</td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">&nbsp;<asp:Label ID="Label2" runat="server" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="12px" ForeColor="#009900" 
            Text="PO Number :"></asp:Label>
&nbsp;<telerik:RadTextBox ID="txtPO" Runat="server" DisplayText="" LabelWidth="100px" 
            Skin="Metro" type="text"  Width="250px">
        </telerik:RadTextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtPO" Display="Dynamic" ErrorMessage="***" Font-Size="11px"></asp:RequiredFieldValidator>
&nbsp;<telerik:RadButton ID="btnSubmit" runat="server" 
            onclick="btnSubmit_Click" Skin="Office2010Silver" Text="Submit" 
            Width="150px" >
        </telerik:RadButton>
    
        <br />
        <br /></td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
         <telerik:RadGrid ID="rgPOGDS" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Metro" 
                    AllowSorting="True" 
                onneeddatasource="rgPOGDS_NeedDataSource"
             AllowFilteringByColumn="True" >
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
                      <telerik:GridBoundColumn DataField="PO_Number" 
                         FilterControlAltText="Filter clnPR column" HeaderText="PO Number" 
                         UniqueName="clnPO" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                          <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="PO_Date" 
                         FilterControlAltText="Filter clnPO column" HeaderText="PO Date" 
                         UniqueName="clnPODate" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="Month_Name" 
                         FilterControlAltText="Filter clnLocation column" HeaderText="Month" 
                         UniqueName="clnMonth" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="100px" />
                     </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="VendorCode"
                         FilterControlAltText="Filter clnItemNo column" HeaderText="Vendor Code" 
                         UniqueName="clnVenCode" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="VendorName" 
                         FilterControlAltText="Filter clnItemDesc column" HeaderText="Vendor Name" 
                         UniqueName="clnVenName" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                 <HeaderStyle HorizontalAlign="Center" Width="300px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="RQNNUMBER" 
                         FilterControlAltText="Filter clnComment column" HeaderText="PR No." 
                         UniqueName="clnRQN" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                 <HeaderStyle HorizontalAlign="Center" Width="200px" />
                     </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="COMMENT" 
                         FilterControlAltText="Filter clnSO column" HeaderText="Comment" 
                         UniqueName="clnComment" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                 <HeaderStyle HorizontalAlign="Center" Width="100px" />
                     </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VDESC" 
                         FilterControlAltText="Filter clnPrepareBy column" HeaderText="Prepare By" 
                         UniqueName="clnPrepareBy" AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains">
                                <HeaderStyle HorizontalAlign="Center" Width="300px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="DESCRIPTIO" 
                         FilterControlAltText="Filter clnETA column" HeaderText="Description" 
                         UniqueName="clnDesc">
                         <HeaderStyle HorizontalAlign="Center" Width="100px" />
                     </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
                         CurrentFilterFunction="Contains" DataField="CURR" 
                         FilterControlAltText="Filter clnETA column" HeaderText="CURRENCY" 
                         UniqueName="clnCurr">
                         <HeaderStyle HorizontalAlign="Center" Width="80px" />
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
