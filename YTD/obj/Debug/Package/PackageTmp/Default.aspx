<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>[ Sales Order YTD by Category ]</title>
	
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel>
	<table border="0" cellpadding="0" cellspacing="0" width="1800px">
    <tr>
    <td align="left">   <asp:Label ID="Label1" runat="server" Text="[ Sales Order YTD Report ] - [ Category ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label>
        <br />&nbsp;
        </td>
    </tr>
    
    <tr>
    <td align="left">
        
        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1" Width="1000px">
            <telerik:RadGrid ID="rgSG" runat="server" AutoGenerateColumns="False" 
                CellSpacing="0" GridLines="None" onitemcreated="rgSG_ItemCreated" 
                Skin="Office2007">
                <MasterTableView DataKeyNames="CATEGORY" ShowFooter="True">
                    <NestedViewTemplate>
                        <div style="padding: 10px 10px 10px 10px; background-image: url('img/bluegradient.gif');">
                            <telerik:RadGrid ID="rgSale" runat="server" AutoGenerateColumns="False" 
                                CellSpacing="0" GridLines="None"   Skin="Office2010Silver">
                                <MasterTableView DataKeyNames="MONTH">
                                    
                                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="MONTH" 
                                            FilterControlAltText="Filter clnSGDESC column" HeaderText="Month" 
                                            UniqueName="clnMonth">
                                            <ItemStyle Width="150px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                                            DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                                            FilterControlAltText="Filter clnAmount column" HeaderText="Amount" 
                                            UniqueName="clnAmount">
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
                        </div>
                    </NestedViewTemplate>
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="CATEDESC" 
                            FilterControlAltText="Filter clnSGDESC column" HeaderText="Category" 
                            UniqueName="clnCateDesc">
                            <HeaderStyle HorizontalAlign="Left" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                            DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                            FilterControlAltText="Filter clnAmount column" HeaderText="Category Amount" 
                            UniqueName="clnAmount">
                            <HeaderStyle HorizontalAlign="Left" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CATEGORY" Display="False" 
                            FilterControlAltText="Filter clnSG column" HeaderText="Cate" 
                            UniqueName="clnCate">
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
    <tr>
    <td>
     <telerik:RadButton ID="btmShow" runat="server" Text="Show / Hide" 
            onclick="btmShow_Click" Skin="Windows7" Width="300px" Height="50px">
        </telerik:RadButton>
            <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px" Visible="False">
        </telerik:RadButton>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1" 
            Visible="False">
        <telerik:RadGrid ID="RadNested" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None"
            Skin="Office2010Black" Width="95%" 
            onneeddatasource="RadNested_NeedDataSource" 
            onitemdatabound="RadNested_ItemDataBound" AllowSorting="True" 
            AllowFilteringByColumn="True"  >
            <GroupingSettings CaseSensitive="False" />
            <ExportSettings FileName="YTD_Category">
            </ExportSettings>
            <ClientSettings>
                <Scrolling FrozenColumnsCount="2" ScrollHeight="1200px" UseStaticHeaders="true" 
                    AllowScroll="true" />
            </ClientSettings>
            <MasterTableView DataKeyNames="Month,ORDNUMBER" ShowFooter="True">
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="ORDNUMBER" 
            FilterControlAltText="Filter clmSO column" HeaderText="SO#" 
            UniqueName="clmSO" AndCurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Month" 
                        FilterControlAltText="Filter clnMonth column" UniqueName="clnMonth" 
                        HeaderText="Month" AndCurrentFilterFunction="Contains" 
                        AutoPostBackOnFilter="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CATEGORY" 
                        FilterControlAltText="Filter clnCategory column" HeaderText="Category" 
                        UniqueName="clnCategory" AndCurrentFilterFunction="Contains" 
                        AutoPostBackOnFilter="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CATEDESC" 
                        FilterControlAltText="Filter clnCategoryName column" HeaderText="Category Name" 
                        UniqueName="clnCategoryName" AndCurrentFilterFunction="Contains" 
                        AutoPostBackOnFilter="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CUSTOMER" 
                        FilterControlAltText="Filter clnCustomer column" HeaderText="Customer" 
                        UniqueName="clnCustomer" AndCurrentFilterFunction="Contains" 
                        AutoPostBackOnFilter="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAMECUST" 
                        FilterControlAltText="Filter clnCustomerName column" FooterText="SubTotal" 
                        HeaderText="Customer Name" UniqueName="clnCustomerName" 
                        AndCurrentFilterFunction="Contains" AutoPostBackOnFilter="True" 
                        FilterControlWidth="150px">
                        <FooterStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                        DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                        FilterControlAltText="Filter clnAmount column" HeaderText="Category Amount" 
                        UniqueName="clnAmount" AndCurrentFilterFunction="Contains" 
                        AutoPostBackOnFilter="True">
                        <FooterStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDDATE" Display="False" 
                        FilterControlAltText="Filter clnOrdDate column" UniqueName="clnOrdDate" 
                        AndCurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
                <AlternatingItemStyle BackColor="#FFFFC0" />
                <HeaderStyle ForeColor="White" />
            </MasterTableView>
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>
        </td>
    </tr>
    <tr>
    <td>
    
    <table border="0" cellpadding="0" cellspacing="0" width="1000px">
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss" runat="server" Font-Bold="True" Font-Size="Small" 
            Text="January"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDJan" runat="server" Font-Bold="True" 
            Font-Size="Small" ForeColor="#66FFCC"></asp:Label></td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss0" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="February"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDFeb" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss1" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="March"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDMar" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss2" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="April"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDApr" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss3" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="May"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDMay" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss4" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="June"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDJun" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss5" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="July"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDJul" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss6" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="August"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDAug" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss7" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="September"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDSep" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;"><asp:Label ID="lblss8" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="October"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDOct" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;">
        <asp:Label ID="lblss9" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="November"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDNov" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px;">
        <asp:Label ID="lblss10" runat="server" 
            Font-Bold="True" Font-Size="Small" 
            Text="December"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblYTDDec" runat="server" Font-Bold="True" Font-Size="Small" 
            ForeColor="#66FFCC"></asp:Label>
        </td>
    </tr>
    <tr style="background-color:#FFFFCC; color: #009900; font-weight: bold; font-family: Tahoma;">
    <td align="right" style="width:850px; height: 25px;">
        <asp:Label ID="lblss11" runat="server" 
            Font-Bold="True" Font-Size="Medium" 
            Text="Total Amount"></asp:Label>
            </td>
    <td align="left" style="width:auto;">
        &nbsp;&nbsp;
        <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Medium" 
            ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    </table>
        
        </td>
    </tr>
    </table>
	</form>
    </body>
</html>
