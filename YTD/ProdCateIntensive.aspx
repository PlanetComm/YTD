<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProdCateIntensive.aspx.cs" Inherits="YTD.ProdCateIntensive" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ Product Category Incentive Report ]</title>
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
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ Product Category Incentive Report ]" 
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
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
         <telerik:RadGrid ID="rgProd" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Sunset" 
                    AllowSorting="True" 
                onneeddatasource="rgCost_NeedDataSource" style="margin-right: 0px" 
             onitemdatabound="rgProd_ItemDataBound" 
             onexcelmlexportrowcreated="rgProd_ExcelMLExportRowCreated" >
             <ExportSettings FileName="ProductCateIntensive">
             </ExportSettings>
             <ClientSettings EnableRowHoverStyle="True">
                 <Selecting AllowRowSelect="True" />
             </ClientSettings>
             <MasterTableView>
                 <CommandItemSettings ExportToPdfText="Export to PDF" />
                 <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                 </RowIndicatorColumn>
                 <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                 </ExpandCollapseColumn>
                 <Columns>
                     <telerik:GridBoundColumn DataField="ItemNo" 
                         FilterControlAltText="Filter clnItemNo column" HeaderText="No." 
                         UniqueName="clnItemNo">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="MKT_NM" 
                         FilterControlAltText="Filter clnSO column" HeaderText="Marketing Person" 
                         UniqueName="clnMKT_NM">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="MONTH_NM" 
                         FilterControlAltText="Filter clnSite column" HeaderText="Month" 
                         UniqueName="clnMonth_NM">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="AMT" DataFormatString="{0:###,##0.00}" 
                         DataType="System.Decimal" FilterControlAltText="Filter clnItem column" 
                         HeaderText="Achieve SO/Month" UniqueName="clnAMT">
                         <ItemStyle HorizontalAlign="Right" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="FORECAST" DataFormatString="{0:###,##0.00}" 
                         DataType="System.Decimal" FilterControlAltText="Filter clnDesc column" 
                         HeaderText="Forecast/Month" UniqueName="clnFORECAST">
                         <ItemStyle HorizontalAlign="Right" />
                     </telerik:GridBoundColumn>
                     <telerik:GridTemplateColumn DataType="System.Decimal" 
                         FilterControlAltText="Filter clnYTD column" HeaderText="SO-YTD" 
                         UniqueName="clnYTD">
                         <ItemStyle HorizontalAlign="Right" />
                         <ItemTemplate>
                             <asp:Label ID="lblYTD" runat="server"></asp:Label>
                         </ItemTemplate>
                     </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn DataType="System.Decimal" 
                         FilterControlAltText="Filter clnForeYTD column" HeaderText="Forecast-YTD" 
                         UniqueName="clnForeYTD">
                         <ItemStyle HorizontalAlign="Right" />
                         <ItemTemplate>
                             <asp:Label ID="lblForeYTD" runat="server"></asp:Label>
                         </ItemTemplate>
                     </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn DataType="System.Decimal" 
                         FilterControlAltText="Filter clnAchieve column" HeaderText="% Achieve/Month" 
                         UniqueName="clnAchieve">
                         <ItemStyle HorizontalAlign="Right" />
                         <ItemTemplate>
                             <asp:Label ID="lblAchieve" runat="server"></asp:Label>
                         </ItemTemplate>
                     </telerik:GridTemplateColumn>
                       <telerik:GridTemplateColumn DataType="System.Decimal" 
                         FilterControlAltText="Filter clnAchieve column" HeaderText="% Achieve/YTD" 
                         UniqueName="clnAchieveYTD">
                         <ItemStyle HorizontalAlign="Right" />
                         <ItemTemplate>
                             <asp:Label ID="lblAchieveYTD" runat="server"></asp:Label>
                         </ItemTemplate>
                     </telerik:GridTemplateColumn>
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
