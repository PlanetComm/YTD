<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SOOutStanding_Market.aspx.cs" Inherits="YTD.SOOutStanding_Market" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>[ Sales Order OutStanding by Market ]</title>
</head>
<body>
    <form id="form1" runat="server">
      <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
      </telerik:RadAjaxLoadingPanel>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td align="left" style="width:620px;">
       <asp:Label ID="Label1" runat="server" Text="[ Sales Order OutStanding Report ] - [ Market ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label>
        <br />&nbsp;
    </td>
    <td align="left">
                
        <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px">
        </telerik:RadButton> 
                
    </td>
    </tr>
    </table>
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" 
          Width="100%" HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
        <table border="0" cellpadding="0" cellspacing="0" width="2500px">

            <tr>
                <td>
                  <telerik:RadGrid ID="rgSO" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellSpacing="0" GridLines="None" ShowFooter="True" 
                        Skin="Simple" onneeddatasource="rgSO_NeedDataSource" 
                        onitemdatabound="rgSO_ItemDataBound" 
                        onexcelmlexportrowcreated="rgSO_ExcelMLExportRowCreated">
                      <ExportSettings FileName="SalesOrderOutStanding">
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
                              <telerik:GridBoundColumn DataField="SO" 
                                  FilterControlAltText="Filter clnSO column" HeaderText="SO#" UniqueName="clnSO">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SOTYPE" 
                                  FilterControlAltText="Filter clnSOType column" HeaderText="SO Type" 
                                  UniqueName="clnSOType">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="INV" 
                                  FilterControlAltText="Filter clnInv column" HeaderText="Inv#" 
                                  UniqueName="clnInv">
                                  <ItemStyle Width="90px" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="CUSTOMER" 
                                  FilterControlAltText="Filter clnCustomer column" HeaderText="Customer" 
                                  UniqueName="clnCustomer">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="REFERENCE" FooterText = "Total Amount : "
                                  FilterControlAltText="Filter clnReference column" HeaderText="Reference" 
                                  UniqueName="clnReference">
                                  <FooterStyle HorizontalAlign="Right" />
                              </telerik:GridBoundColumn>
                              <telerik:GridTemplateColumn DataField="COMMENT" 
                                  FilterControlAltText="Filter clnComment column" HeaderText="SO Comment" 
                                  UniqueName="clnComment">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="COMMENTTextBox" runat="server" Text='<%# Bind("COMMENT") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="COMMENTLabel" runat="server" 
                                          Text='<%# (!string.IsNullOrEmpty(Eval("COMMENT").ToString().Trim()) ? (Eval("COMMENT").ToString().Length > 20 ? Eval("COMMENT").ToString().Substring(0, 20) + ".." : Eval("COMMENT").ToString() + "...") : string.Empty)  %>'></asp:Label>
                                      <telerik:RadToolTip ID="RadToolTip1" runat="server" Height="100px" Skin="Outlook" 
                                          Width="500px" TargetControlID="COMMENTLabel" ShowDelay="300" HideDelay="300" AutoCloseDelay="50000" ManualClose="True" ManualCloseButtonText="X" ShowEvent="OnClick">
                                          <div style="padding: 10px 10px 10px 10px; background-color:White;vertical-align:middle;">
                                          <%# DataBinder.Eval(Container, "DataItem.COMMENT")%>
                                          </div>
                                      </telerik:RadToolTip>
                                  </ItemTemplate>
                              </telerik:GridTemplateColumn>
                              <telerik:GridBoundColumn DataField="Amount" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnAmount column" HeaderText="Amount" Aggregate="Sum"
                                  UniqueName="clnAmount">
                                   <ItemStyle Width="90px" HorizontalAlign="Right" />
                                    <FooterStyle Width="90px" HorizontalAlign="Right"  BackColor="Aquamarine" Font-Bold="true" Font-Size="Small"/>
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="JAN" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnJan column" HeaderText="Jan" 
                                  UniqueName="clnJan" Aggregate="Sum">
                                   <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                   <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="FEB" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnFeb column" HeaderText="Feb" 
                                  UniqueName="clnFeb" Aggregate="Sum">
                                          <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                          <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="MAR" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnMar column" HeaderText="Mar" 
                                  UniqueName="clnMar" Aggregate="Sum">
                                           <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                           <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="APR" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnApr column" HeaderText="Apr" 
                                  UniqueName="clnApr" Aggregate="Sum">
                                         <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                         <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="MAY" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnMay column" HeaderText="May" 
                                  UniqueName="clnMay" Aggregate="Sum">
                                           <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                           <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="JUN" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnJun column" HeaderText="Jun" 
                                  UniqueName="clnJun" Aggregate="Sum">
                                          <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="JUL" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnJul column" HeaderText="Jul" 
                                  UniqueName="clnJul" Aggregate="Sum">
                                   <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn Aggregate="Sum" DataField="AUG" 
                                  DataFormatString="{0:###,##0.00}" DataType="System.Decimal" 
                                  FilterControlAltText="Filter clnAug column" HeaderText="Aug" 
                                  UniqueName="clnAug">
                                  <FooterStyle Font-Bold="True" ForeColor="#005900" HorizontalAlign="Right" />
                                  <ItemStyle Font-Bold="True" ForeColor="#005900" HorizontalAlign="Right" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SEP" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnSep column" HeaderText="Sep" 
                                  UniqueName="clnSep" Aggregate="Sum">
                                          <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                          <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="OCT" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnOct column" HeaderText="Oct" 
                                  UniqueName="clnOct" Aggregate="Sum">
                                         <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                         <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="NOV" DataType="System.Decimal"  DataFormatString="{0:###,##0.00}"
                                  FilterControlAltText="Filter clnNov column" HeaderText="Nov" 
                                  UniqueName="clnNov" Aggregate="Sum">
                                         <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                         <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="DEC" DataType="System.Decimal" 
                                  FilterControlAltText="Filter clnDec column" HeaderText="Dec"  DataFormatString="{0:###,##0.00}"
                                  UniqueName="clnDec" Aggregate="Sum">
                                          <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                                          <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#005900" />
                              </telerik:GridBoundColumn>
                              <telerik:GridCalculatedColumn Aggregate="Sum" DataType="System.Decimal"
                                  DataFields="AMOUNT,JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC" Expression="{0} - ({1}+{2}+{3}+{4}+{5}+{6}+{7}+{8}+{9}+{10}+{11}+{12})" 
                                  FilterControlAltText="Filter column column" HeaderText="Balance" DataFormatString="{0:###,##0.00}"
                                  UniqueName="clnBalance">
                                         <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#FF0000" />
                                         <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#FF0000" />
                              </telerik:GridCalculatedColumn>
                              <telerik:GridBoundColumn DataField="SALEPERSON" 
                                  FilterControlAltText="Filter clnSalePerson column" HeaderText="Sale Person" 
                                  UniqueName="clnSalePerson">
                                  <ItemStyle Width="100px" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SALESGROUP" 
                                  FilterControlAltText="Filter clnSalesGroup column" HeaderText="Sales Group" 
                                  UniqueName="clnSalesGroup">
                                  <ItemStyle Width="100px" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG1-ENT" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG1ENT column" 
                                  HeaderText="SG1-ENT" UniqueName="clnSG1ENT">
                                  <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                  <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG2-PB1" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG2PB1 column" 
                                  HeaderText="SG2-PB1" UniqueName="clnSG2PB1">
                                  <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                  <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG2-PB2" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG2PB2 column" 
                                  HeaderText="SG2-PB2" UniqueName="clnSG2PB2">
                                  <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                  <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG2-PB3" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG2PB3 column" 
                                  HeaderText="SG2-PB3" UniqueName="clnSG2PB3">
                                <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG3-SPV" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG3SPV column" 
                                  HeaderText="SG3-SPV" UniqueName="clnSG3SPV">
                                <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG4-BCT" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG4BCT column" 
                                  HeaderText="SG4-BCT" UniqueName="clnSG4BCT">
                                  <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                  <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="SG5-INT" DataFormatString="{0:###,##0.00}" 
                                  DataType="System.Decimal" FilterControlAltText="Filter clnSG5INT column" 
                                  HeaderText="SG5-INT" UniqueName="clnSG5INT">
                                 <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                                 <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue" />
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="EFFDATE" Display="False" 
                                  FilterControlAltText="Filter clnEFFDate column" HeaderText="EFFDATE" 
                                  UniqueName="clnEFFDate">
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
                </td>
          </tr>
          </table>
          
        </telerik:RadAjaxPanel>


    </form>
</body>
</html>
