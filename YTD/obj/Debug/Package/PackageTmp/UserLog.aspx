<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLog.aspx.cs" Inherits="YTD.UserLog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>[ User Access Log Report ]</title>
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
    
    <table border="0" cellpadding="0" cellspacing="0" width="1000px">
    <tr>
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ User Access Log Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" 
            ForeColor="#00A000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <telerik:RadButton ID="btnExportExcel" runat="server" 
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
            CellSpacing="0" GridLines="None" Skin="Office2010Black" 
                    AllowSorting="True" 
                onneeddatasource="rgPOGDS_NeedDataSource" style="margin-right: 0px" 
             AllowPaging="True" PageSize="200" >
             <ExportSettings FileName="UserLog">
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
                         UniqueName="clnItemNo" DataFormatString="{0:#,##0}">
                         <ItemStyle Width="45px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="LogUserID" 
                         FilterControlAltText="Filter clnEmpID column" HeaderText="ID" 
                         UniqueName="clnEmpID">
                         <ItemStyle Width="70px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnName column" 
                         HeaderText="Name" UniqueName="clnName" DataField="NAME">
                         <ItemStyle Width="200px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="DEPT" 
                         FilterControlAltText="Filter clnDept column" HeaderText="Department" 
                         UniqueName="clnDept">
                         <ItemStyle Width="100px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clmSect column" 
                         HeaderText="Section" UniqueName="clmSect" DataField="SECT">
                         <ItemStyle Width="100px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="LogDateTime" 
                         FilterControlAltText="Filter clnLogDateTime column" HeaderText="Access On" 
                         UniqueName="clnLogDateTime" 
                         DataType="System.DateTime">
                         <ItemStyle Width="100px" />
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
