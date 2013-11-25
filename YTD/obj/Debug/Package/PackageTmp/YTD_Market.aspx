<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YTD_Market.aspx.cs" Inherits="YTD.YTD_Market" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ Sales Order YTD by Market ]</title>
</head>
<body>
  <form id="form1" runat="server">
   
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel>
	<table border="0" cellpadding="0" cellspacing="0" width="1800px">
    <tr>
    <td align="left">  
    <table border="0" cellpadding="0" cellspacing="0" width="1000px">
    <tr>
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ Sales Order YTD Report ] - [ Market ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label>
        
        </td>
     <td align="right" style="width:50%;">
         <telerik:RadButton ID="btnUpdate" runat="server" Text="[ Refresh Data ]" 
             Width="200px" onclick="btnUpdate_Click">             
         </telerik:RadButton>
         <br />
         <asp:Label ID="lblLastUpdate" runat="server" Font-Size="Small" 
             ForeColor="#FF5050" Font-Names="Tahoma"></asp:Label>
     </td>
    </tr>
    </table>
        <asp:Label ID="lblUser" runat="server" Font-Size="Small" 
             ForeColor="#006600" Font-Names="Tahoma"></asp:Label>
        <br />&nbsp;
        </td>
    </tr>
    <tr>
    <td align="left">
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" 
            Width="1000px" HorizontalAlign="NotSet" 
            LoadingPanelID="RadAjaxLoadingPanel1">
             <telerik:RadGrid ID="rgSG" runat="server" 
            AutoGenerateColumns="False" CellSpacing="0" GridLines="None" 
            Skin="Office2007" onitemcreated="rgSG_ItemCreated" 
                 onitemdatabound="rgSG_ItemDataBound">
                 <ClientSettings EnableRowHoverStyle="True">
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
<MasterTableView DataKeyNames="SG" ShowFooter="True">
    <NestedViewTemplate>
     <div style="padding: 10px 10px 10px 10px; background-image: url('img/bluegradient.gif');">
     
         <telerik:RadGrid ID="rgSale" runat="server" 
             AutoGenerateColumns="False" CellSpacing="0" GridLines="None" 
             Skin="Office2010Silver" onitemcreated="rgSale_ItemCreated" 
             onitemdatabound="rgSale_ItemDataBound">
              <ClientSettings EnableRowHoverStyle="True">
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
             <MasterTableView DataKeyNames="SG,SALEPERSON" ShowFooter="false" >
                 <NestedViewTemplate>
                     <div style="padding: 10px 10px 10px 10px; background-image: url('img/bluegradient.gif');">

                     <telerik:RadGrid ID="rgMonth" runat="server" 
             AutoGenerateColumns="False" CellSpacing="0" GridLines="None" 
             Skin="Sunset">
              <ClientSettings EnableRowHoverStyle="True">
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
             <MasterTableView DataKeyNames="SALEPERSON,MONTH" ShowFooter="false">
           
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
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                         DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                         FilterControlAltText="Filter clnAmount column" HeaderText="Sale Person Amount" 
                         UniqueName="clnAmount">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="SALEPERSON" Display="False" 
                         FilterControlAltText="Filter clnSG column" HeaderText="Sales Person" 
                         UniqueName="clnSalePerson">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="FORECAST" DataType="System.Decimal" 
                         FilterControlAltText="Filter clnForecast column" HeaderText="Forecast Month"  DataFormatString="{0:###,##0.00}"
                         UniqueName="clnForecast">
                     </telerik:GridBoundColumn>
                     <telerik:GridCalculatedColumn DataFields="NET,FORECAST" 
                         DataType="System.Decimal" Expression="({0}*100) / {1}" 
                         FilterControlAltText="Filter clnAchieve column" HeaderText="Achieve % Month"  DataFormatString="{0:###,##0.00}%"
                         UniqueName="clnAchieve">
                     </telerik:GridCalculatedColumn>
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
                     <telerik:GridBoundColumn DataField="SALEPERSON" 
                         FilterControlAltText="Filter clnSGDESC column" HeaderText="Sales Person" 
                         UniqueName="clnSalePerson">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                         DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                         FilterControlAltText="Filter clnAmount column" HeaderText="Sale Person Amount" 
                         UniqueName="clnAmount">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="FORECASTYTD" DataFormatString="{0:###,##0.00}"
                         FilterControlAltText="Filter clnForecast column" HeaderText="Forecast YTD" 
                         UniqueName="clnForecast">
                     </telerik:GridBoundColumn>
                     <telerik:GridCalculatedColumn DataFields="NET,FORECASTYTD" 
                         Expression="({0}*100)/{1}" FilterControlAltText="Filter clnAchieve column" DataType="System.Decimal" 
                         HeaderText="Achieve % YTD" UniqueName="clnAchieve"  DataFormatString="{0:###,##0.00}%">
                     </telerik:GridCalculatedColumn>
                     <telerik:GridBoundColumn DataField="SG" Display="False" 
                         FilterControlAltText="Filter clnSG column" HeaderText="Sales Group" 
                         UniqueName="clnSG">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="FORECAST" DataFormatString="{0:###,##0.00}" 
                         DataType="System.Decimal" FilterControlAltText="Filter clnForecastYear column" 
                         HeaderText="Forcast Year" UniqueName="clnForecastYear">
                     </telerik:GridBoundColumn>
                     <telerik:GridCalculatedColumn DataFields="NET,FORECAST" 
                         DataFormatString="{0:###,##0.00}%" Expression="({0}*100)/{1}" 
                         FilterControlAltText="Filter clnAchieveYear column" HeaderText="Achieve % Year" 
                         UniqueName="clnAchieveYear">
                     </telerik:GridCalculatedColumn>
                     <telerik:GridBoundColumn DataField="ISHEADOFSECTOR" Display="False" 
                         FilterControlAltText="Filter clnHeader column" HeaderText="IsHeader" 
                         UniqueName="clnHeader">
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
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
</RowIndicatorColumn>

<ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
        Visible="True">
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="SGDESC" 
            FilterControlAltText="Filter clnSGDESC column" HeaderText="Sales Group" FooterText = "Total Amount :"
            UniqueName="clnSGDESC">
            <FooterStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Left" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="NET" 
            FilterControlAltText="Filter clnAmount column" HeaderText="Sales Group Amount" 
            UniqueName="clnAmount" DataFormatString="{0:###,##0.00}" 
            DataType="System.Decimal" Aggregate="Sum" 
            FooterAggregateFormatString="{0:###,##0.00}" >
            <HeaderStyle HorizontalAlign="Left" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SG" Display="False" 
            FilterControlAltText="Filter clnSG column" HeaderText="Sales Group" 
            UniqueName="clnSG">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="FORECASTYTD" 
            FilterControlAltText="Filter clnForecast column" HeaderText="Forecast YTD" 
            UniqueName="clnForecast" DataFormatString="{0:###,##0.00}" 
            DataType="System.Decimal" Aggregate="Sum">
        </telerik:GridBoundColumn>
        <telerik:GridCalculatedColumn DataFields="NET,FORECASTYTD" Expression="({0}*100)/{1}"
            DataType="System.Decimal" FilterControlAltText="Filter clnArchive column" 
            HeaderText="Archive % YTD" UniqueName="clnArchive" 
            DataFormatString="{0:###,##0.00}%" >
        </telerik:GridCalculatedColumn>
        <telerik:GridBoundColumn DataField="FORECAST" DataFormatString="{0:###,##0.00}" 
            DataType="System.Decimal" FilterControlAltText="Filter clnForecastYear column" 
            HeaderText="Forecast Year" UniqueName="clnForecastYear" Aggregate="Sum">
        </telerik:GridBoundColumn>
        <telerik:GridCalculatedColumn DataFields="NET,FORECAST" 
            DataFormatString="{0:###,##0.00}%" DataType="System.Decimal" 
            Expression="({0} *100) / {1}" 
            FilterControlAltText="Filter clnAchieveYear column" HeaderText="Achieve % Year" 
            UniqueName="clnAchieveYear">
        </telerik:GridCalculatedColumn>
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
    <FooterStyle Font-Bold="True" ForeColor="PapayaWhip" />
</MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
        </telerik:RadGrid>
        </telerik:RadAjaxPanel>
        </td>
    </tr>
       
       

    <tr>
    <td>
     <table border="0" cellpadding="0" cellspacing="0" width="1000px" >
     <tr>
     <td><br />
     <asp:Label ID="Label2" runat="server" Text="[ Pending Sales Order ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="Large" ForeColor="#003399"></asp:Label> 
         </td>
     </tr>
     <tr>
     <td>
     <telerik:RadGrid ID="rgWait" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None"
            Skin="Sunset" Width="100%" AllowSorting="True"  >
            <ClientSettings EnableRowHoverStyle="true">
               <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView DataKeyNames="ORDNUMBER" ShowFooter="True">
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="ORDNUMBER" 
            FilterControlAltText="Filter clmSO column" HeaderText="SO#" 
            UniqueName="clnSO" Aggregate="Count" FooterText="Count : ">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Month" 
                        FilterControlAltText="Filter clnMonth column" HeaderText="Month" 
                        UniqueName="clnMonth">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SALEPERSON" 
                        FilterControlAltText="Filter clnSalePerson column" HeaderText="Sale Person" 
                        UniqueName="clnSalePerson">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SG" 
                        FilterControlAltText="Filter clnMarket column" HeaderText="Market" 
                        UniqueName="clnMarket">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SGDESC" 
                        FilterControlAltText="Filter clnMarketName column" HeaderText="Market Name" 
                        UniqueName="clnMarketName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CUSTOMER" 
                        FilterControlAltText="Filter clnCustomer column" HeaderText="Customer" 
                        UniqueName="clnCustomer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAMECUST" 
                        FilterControlAltText="Filter clnCustomerName column" FooterText="Total Amount :" 
                        HeaderText="Customer Name" UniqueName="clnCustomerName">
                        <FooterStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                        DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                        FilterControlAltText="Filter clnAmount column" HeaderText="Market Amount" 
                        UniqueName="clnAmount">
                        <FooterStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDDATE" Display="False" 
                        FilterControlAltText="Filter clnOrdDate column" UniqueName="clnOrdDate">
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
     </td>
     </tr>
     <tr>
     <td>
     <asp:Label ID="Label3" runat="server" Text="Company Sales Order YTD (included Pending Sales Order)" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="Large" ForeColor="#003399"></asp:Label> 
     <br />
     <telerik:RadGrid ID="rgSummary" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Hay" 
             onitemdatabound="rgSummary_ItemDataBound">
               <ClientSettings EnableRowHoverStyle="True">
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
<MasterTableView>
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="MONTHLY" 
            FilterControlAltText="Filter clnMonth column" HeaderText="Month" 
            UniqueName="clnMonth">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SOMONTH" DataType="System.Decimal" 
            FilterControlAltText="Filter clnSOMonth column" HeaderText="SO - Month" DataFormatString="{0:###,##0.00}"
            UniqueName="clnSOMonth">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SOFORECAST" DataType="System.Decimal" 
            FilterControlAltText="Filter clnSOForecast column" HeaderText="SO - Forecast" DataFormatString="{0:###,##0.00}"
            UniqueName="clnSOForecast">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SOAchieve" 
            FilterControlAltText="Filter clnSOAchieve column" HeaderText="SO (% Achieve)" 
            UniqueName="clnSOAchieve">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SOYTD" DataType="System.Decimal" 
            FilterControlAltText="Filter clnSOYTD column" HeaderText="SO - YTD" DataFormatString="{0:###,##0.00}"
            UniqueName="clnSOYTD">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="FORECASTYTD" DataType="System.Decimal" 
            FilterControlAltText="Filter clnForecastYTD column" HeaderText="Forecast - YTD" DataFormatString="{0:###,##0.00}"
            UniqueName="clnForecastYTD">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="YTDACHIEVE" DataType="System.Decimal" 
            FilterControlAltText="Filter clnYTDAchieve column" HeaderText="YTD (% Achieve)" 
            UniqueName="clnYTDAchieve">
        </telerik:GridBoundColumn>
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
        </telerik:RadGrid>
     </td>
     </tr>
    </table>
    
    </td>
    </tr>
    <tr>
    <td>
    <table border="0" cellpadding="0" cellspacing="0" width="1000px" id="tlb" runat="server" visible="FALSE">
    <tr style="background-color:#339933; color: #FFFFCC; font-weight: bold; font-family: Tahoma;">
    <td align="right" colspan="2">
        
    </td>
    </tr>
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
    <tr>
    <td align="left"> 
    
    &nbsp;<br />
&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Names="Tahoma" Font-Size="Small" ForeColor="#CC6600" 
            NavigateUrl="~/YTD_SOHistory.aspx" Target="_blank">Link to Sales Order History ..</asp:HyperLink>
&nbsp;<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1" 
            Visible="False">
        <telerik:RadGrid ID="RadNested" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None"
            Skin="Office2010Black" Width="100%" 
            
            onitemdatabound="RadNested_ItemDataBound" AllowSorting="True" 
                onneeddatasource="RadNested_NeedDataSource"  >
            <ClientSettings>
                <Scrolling FrozenColumnsCount="2" ScrollHeight="1000px" UseStaticHeaders="true" 
                    AllowScroll="True" />
                <Scrolling AllowScroll="True" FrozenColumnsCount="2" ScrollHeight="1000px" 
                    UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView DataKeyNames="Month,ORDNUMBER" ShowFooter="True">
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <CommandItemSettings ExportToPdfText="Export to PDF" />
              
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="ORDNUMBER" 
            FilterControlAltText="Filter clnSO column" HeaderText="SO#" 
            UniqueName="clnSO" Aggregate="Count" FooterText="Count : ">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Month" 
                        FilterControlAltText="Filter clnMonth column" HeaderText="Month" 
                        UniqueName="clnMonth">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="STATUS" 
                        FilterControlAltText="Filter clnStatus column" HeaderText="Status" 
                        UniqueName="clnStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDERDATE" 
                        FilterControlAltText="Filter clnOrderDate column" HeaderText="Order Date" 
                        UniqueName="clnOrderDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EFFECTIVEDATE" 
                        FilterControlAltText="Filter clnEffectiveDate column" 
                        HeaderText="Effective Date" UniqueName="clnEffectiveDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SALEPERSON" 
                        FilterControlAltText="Filter clnSalePerson column" HeaderText="Sale Person" 
                        UniqueName="clnSalePerson">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SG" 
                        FilterControlAltText="Filter clnMarket column" HeaderText="Market" 
                        UniqueName="clnMarket">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SGDESC" 
                        FilterControlAltText="Filter clnMarketName column" HeaderText="Market Name" 
                        UniqueName="clnMarketName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CUSTOMER" 
                        FilterControlAltText="Filter clnCustomer column" HeaderText="Customer" 
                        UniqueName="clnCustomer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAMECUST" 
                        FilterControlAltText="Filter clnCustomerName column" FooterText="Total Amount :" 
                        HeaderText="Customer Name" UniqueName="clnCustomerName">
                        <FooterStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Aggregate="Sum" DataField="NET" 
                        DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                        FilterControlAltText="Filter clnAmount column" HeaderText="Market Amount" 
                        UniqueName="clnAmount">
                        <FooterStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ORDDATE" Display="False" 
                        FilterControlAltText="Filter clnOrdDate column" UniqueName="clnOrdDate">
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
    </table>
	</form>
</body>
</html>
