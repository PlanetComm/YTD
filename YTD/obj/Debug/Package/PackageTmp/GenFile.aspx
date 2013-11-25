<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenFile.aspx.cs" Inherits="YTD.GenFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid .rgFooter td{padding-top:4px;padding-bottom:3px}.RadGrid .rgFooter td{padding-left:7px;padding-right:7px}.RadGrid .rgFooter td{padding-top:4px;padding-bottom:3px}.RadGrid .rgFooter td{padding-left:7px;padding-right:7px}.RadGrid .rgFooter td{padding-top:4px;padding-bottom:3px}.RadGrid .rgFooter td{padding-left:7px;padding-right:7px}</style>
</head>
<body>
    
    <form id="form1" runat="server">
      <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
    <div>
    
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" 
            Width="1000px" HorizontalAlign="NotSet" 
            LoadingPanelID="RadAjaxLoadingPanel1">
             <telerik:RadGrid ID="rgSG" runat="server" 
            AutoGenerateColumns="False" CellSpacing="0" GridLines="None" 
            Skin="Office2007" onitemcreated="rgSG_ItemCreated">
                 <ClientSettings EnableRowHoverStyle="True">
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
<MasterTableView DataKeyNames="SG" ShowFooter="True">
    <NestedViewTemplate>
     <div style="padding: 10px 10px 10px 10px; background-image: url('img/bluegradient.gif');">
     
         <telerik:RadGrid ID="rgSale" runat="server" 
             AutoGenerateColumns="False" CellSpacing="0" GridLines="None" 
             Skin="Office2010Silver" onitemcreated="rgSale_ItemCreated">
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
   

    </div>
    </form>
</body>
</html>
