<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SO_ReCheck.aspx.cs" Inherits="YTD.SO_ReCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>[ Order Summary List Report on Web ]</title>
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
       <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel>
	   <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" 
           DefaultLoadingPanelID="RadAjaxLoadingPanel1">
           <AjaxSettings>
               <telerik:AjaxSetting AjaxControlID="btnSubmit">
                   <UpdatedControls>
                       <telerik:AjaxUpdatedControl ControlID="rgCost" />
                   </UpdatedControls>
               </telerik:AjaxSetting>
               <telerik:AjaxSetting AjaxControlID="rgCost">
                   <UpdatedControls>
                       <telerik:AjaxUpdatedControl ControlID="rgCost" 
                           LoadingPanelID="RadAjaxLoadingPanel1" />
                   </UpdatedControls>
               </telerik:AjaxSetting>
           </AjaxSettings>
       </telerik:RadAjaxManager>
	<table border="0" cellpadding="0" cellspacing="0" width="1300px">
    <tr>
    <td align="left"> 
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
         <tr>
         <td align="left">
         <asp:Label ID="Label1" runat="server" Text="[ Order Summary List Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label>
             <br />
&nbsp;</td>
      <td align="right">
          &nbsp;</td>
        </tr>
         <tr>
         <td align="left">
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet">  
    <asp:Label ID="Label2" runat="server" Text="Period : " 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="#000008"></asp:Label>
        &nbsp; &nbsp;<telerik:RadDatePicker ID="dtpFrom" Runat="server" Skin="Simple" 
            Width="200px" Culture="en-US">
            <Calendar Skin="Simple" UseColumnHeadersAsSelectors="False" 
                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
            </Calendar>
            <DateInput DateFormat="dd MMM yyyy" DisplayDateFormat="dd MMM yyyy">
            </DateInput>
            <DatePopupButton HoverImageUrl="" ImageUrl="" />
        </telerik:RadDatePicker>
        --
        <telerik:RadDatePicker ID="dtpTo" Runat="server" Skin="Simple" Width="200px" 
            Culture="en-US">
            <Calendar Skin="Simple" UseColumnHeadersAsSelectors="False" 
                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
            </Calendar>
            <DateInput DateFormat="dd MMM yyyy" DisplayDateFormat="dd MMM yyyy">
            </DateInput>
            <DatePopupButton HoverImageUrl="" ImageUrl="" />
        </telerik:RadDatePicker>
        &nbsp;<telerik:RadButton ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
            Skin="Sitefinity" Text="Submit" Width="150px">
        </telerik:RadButton>
        &nbsp;<asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
        </telerik:RadAjaxPanel>
      </td>
      <td align="right" valign="bottom">
        <telerik:RadButton ID="btnExport" runat="server" onclick="btnExport_Click" 
            Skin="Sitefinity" Text="Export to Excel" Width="200px">
        </telerik:RadButton>
        </td>
        </tr>
      </table>
        </td>
        
    </tr>
    <tr>
    <td align="left">  
        <br />
        </td>&nbsp;
    </tr>
    <tr>
    <td align="left">   
                <asp:Panel ID="Panel1" runat="server">
     
            <telerik:RadGrid ID="rgCost" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Web20" 
                    AllowSorting="True" 
                onneeddatasource="rgCost_NeedDataSource" AllowFilteringByColumn="True" >
                <ExportSettings FileName="OE_SummaryList">
                </ExportSettings>
                <ClientSettings EnableRowHoverStyle="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView ShowFooter="True">
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="ItemNo" 
                            FilterControlAltText="Filter clnItemNo column" HeaderText="No." 
                            UniqueName="clnItemNo" AllowFiltering="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CompleteDate" 
                            FilterControlAltText="Filter clnDateComplete column" 
                            HeaderText="Date completed" UniqueName="clnDateComplete" 
                            AutoPostBackOnFilter="True" CurrentFilterFunction="Contains">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ORDNUMBER" 
                            FilterControlAltText="Filter clnSO column" HeaderText="SO#" UniqueName="clnSO" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ORDATE" 
                            FilterControlAltText="Filter clnSODate column" HeaderText="SO# Date" 
                            UniqueName="clnSODate" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="CUSCODE" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnSO column" HeaderText="Cust.Code" UniqueName="clnCusCode">
                        </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="CUSNAME" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnSO column" HeaderText="Cust.Name" UniqueName="clnCusName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="QUONUMBER" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnQT column" HeaderText="QT#" UniqueName="clnQT">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="QUODATE" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnQTDate column" HeaderText="QT# Date" 
                            UniqueName="clnQTDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SHINUMBER" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnSH column" HeaderText="SH#" UniqueName="clnSH">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SHIDATE" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnSHDate column" HeaderText="SH# Date" 
                            UniqueName="clnSHDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DONUM" 
                            FilterControlAltText="Filter clnDO column" HeaderText="with DO." 
                            UniqueName="clnDO" AllowFiltering="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="INVNUMBER" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnINV column" HeaderText="INV#" 
                            UniqueName="clnINV">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="INVDATE" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                            FilterControlAltText="Filter clnINVDate column" HeaderText="INV# Date" 
                            UniqueName="clnINVDate">
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
            <br />
   </asp:Panel>

        </td>
    </tr>
    <tr>
    <td>
        
    </td>
    </tr>
    <tr>
    <td>
    <telerik:RadNotification ID="NotifyWarn" runat="server" 
        Skin="Sunset"
        Width="250px" Height="80px" Animation="Fade" EnableRoundedCorners="true" 
        TitleIcon="img/Del.png" LoadContentOn="EveryShow" AutoCloseDelay="5000" 
        ContentIcon="" EnableShadow="True" OffsetX="-30" OffsetY="20" 
        BackColor="#FF3300" Position="TopRight" >
    </telerik:RadNotification>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>
