<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPages/ContentPage.Master" CodeBehind="Search.aspx.vb" Inherits="UtilityWizards.Builder.Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/masterPages/ContentPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style type="text/css">
        .wrap-table {
            width: 100%;
            display: block;
        }

            .wrap-table td {
                display: inline-block;
            }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="menuContent" runat="server">
    <ul class="sidebar-menu">
        <li class="header">WORK ORDER OPTIONS</li>
        <li>
            <asp:LinkButton runat="server" ID="lnkNew"><i class="fa fa-file-text-o"></i><span>New Work Order</span></asp:LinkButton></li>
    </ul>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="breadcrumbContent" runat="server">
    <h1>Dashboard
        <small>Version 2.2</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="..Default.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">System Modules</li>
    </ol>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContent_Ajax" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:PlaceHolder runat="server" ID="tblNewWorkOrder">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <telerik:RadButton ID="btnNewWorkOrder" runat="server" ButtonType="LinkButton" CssClass="fixedWidth" Skin="Metro" Text="New Work Order" Width="100%" />
                            </td>
                            <td style="text-align: right;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="text-align: right;">&nbsp;</td>
                        </tr>
                    </table>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="tblSearchOptions">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="1" Width="100%">
                                    <Tabs>
                                        <telerik:RadTab runat="server" Text="Filters" PageViewID="RadPageView1" />
                                        <telerik:RadTab runat="server" Text="Included Items" PageViewID="RadPageView2" Selected="true" />
                                    </Tabs>
                                </telerik:RadTabStrip>
                                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" Width="100%" SelectedIndex="1">
                                    <telerik:RadPageView ID="RadPageView1" runat="server" Height="100px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px">
                                        <table style="width: 90%; margin: 10px;" runat="server" id="tblFieldSearch">
                                            <tr>
                                                <td style="width: 33%;">Field</td>
                                                <td style="width: 10px;">&nbsp;</td>
                                                <td style="width: 30%;">Comparison</td>
                                                <td style="width: 10px;">&nbsp;</td>
                                                <td style="width: 33%;">Value</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 33%;">
                                                    <asp:DropDownList ID="ddlSearchField" runat="server" Width="100%" onclick="UpdateSearchDescription()" />
                                                </td>
                                                <td style="width: 10px;">&nbsp;</td>
                                                <td style="width: 30%;">
                                                    <asp:DropDownList ID="ddlSearchComparison" runat="server" Width="100%" onclick="UpdateSearchDescription()">
                                                        <asp:ListItem Text="Starts With" Value="startswith" />
                                                        <asp:ListItem Text="Ends With" Value="endswith" />
                                                        <asp:ListItem Selected="True" Text="Contains" Value="contains" />
                                                        <asp:ListItem Text="Equal To" Value="equals" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 10px;">&nbsp;</td>
                                                <td style="width: 33%;">
                                                    <asp:TextBox ID="txtSearchValue" runat="server" Width="100%" onchange="UpdateSearchDescription()"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </telerik:RadPageView>
                                    <telerik:RadPageView ID="RadPageView2" runat="server" Height="100px" Selected="true" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px">
                                        <table style="width: 90%; margin: 10px;">
                                            <tr>
                                                <td style="width: 50%; vertical-align: top;">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td>Item Status</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:CheckBoxList ID="cblStatus" runat="server" Height="60px" Width="100%" RepeatDirection="Horizontal" onclick="UpdateSearchDescription()" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 50%; vertical-align: top;">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ddlDateType" runat="server" Width="100%" onclick="UpdateSearchDescription()">
                                                                    <asp:ListItem Text="Date Created" Value="created" />
                                                                    <asp:ListItem Text="Date Modified" Value="modified" />
                                                                    <asp:ListItem Text="Date Created OR Modified" Value="both" />
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlDatePresets" runat="server" Width="100%" AutoPostBack="true" onclick="UpdateSearchDescription()">
                                                                                <asp:ListItem Text="Today" Value="today" />
                                                                                <asp:ListItem Text="This Week" Value="week" />
                                                                                <asp:ListItem Text="This Month" Value="month" />
                                                                                <asp:ListItem Text="Last Month" Value="1month" />
                                                                                <asp:ListItem Text="Past 3 Months" Value="3months" />
                                                                                <asp:ListItem Text="Past 6 Months" Value="6months" />
                                                                                <asp:ListItem Text="Everything" Value="all" />
                                                                                <asp:ListItem Text="Custom" Value="custom" />
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:TextBox ID="txtStartDate" runat="server" Width="80px" onchange="UpdateSearchDescription()"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: center;">to</td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtEndDate" runat="server" Width="80px" onchange="UpdateSearchDescription()"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </telerik:RadPageView>
                                </telerik:RadMultiPage>
                                <br />
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 200px;">
                                            <asp:Button runat="server" ID="btnApply" Text="Apply Criteria" />
                                        </td>
                                        <td><span id="lblSearchDesc"></span></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: right;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="text-align: right;">&nbsp;</td>
                        </tr>
                    </table>
                </asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadGrid ID="RadSearchGrid" runat="server" AllowSorting="True" GroupPanelPosition="Top" AutoGenerateEditColumn="True" Skin="Metro">
                </telerik:RadGrid>
                <telerik:RadGrid ID="RadSearchGridMobile" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GroupPanelPosition="Top" Skin="MetroTouch">
                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                    </ClientSettings>
                    <MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1" ShowHeader="false">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="Work Order Data" UniqueName="TemplateColumn">
                                <ItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="vertical-align: top; width: 55px;">
                                                <asp:Image ID='imgIcon' runat='server' Height='45px' Width='45px' ImageUrl='<%# Eval("ModuleIcon") %>' />
                                            </td>
                                            <td style="vertical-align: top;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID='lblModule' runat='server' Font-Bold='True' ForeColor='White' Text='<%# Eval("ModuleName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID='Label1' runat='server' ForeColor='White' Text='Work Order #'></asp:Label>
                                                            <asp:Label ID='lblWorkOrderID' runat='server' ForeColor='White' Text='<%# Eval("ID") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID='lblDescription' runat='server' ForeColor='White' Text='<%# Eval("CustomerAddress") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID='lblAssignedTo' runat='server' ForeColor='White' Text='<%# Eval("AssignedToName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Priority" UniqueName="Priority" DataField="xPriority" Display="false" />
                            <telerik:GridBoundColumn HeaderText="ID" UniqueName="ID" DataField="ID" Display="false" />
                            <telerik:GridBoundColumn HeaderText="ModuleID" UniqueName="xModuleID" DataField="xModuleID" Display="false" />
                            <telerik:GridBoundColumn HeaderText="FolderID" UniqueName="xFolderID" DataField="xFolderID" Display="false" />
                            <telerik:GridBoundColumn HeaderText="SupervisorID" UniqueName="SupervisorID" DataField="SupervisorID" Display="false" />
                            <telerik:GridBoundColumn HeaderText="TechnicianID" UniqueName="TechnicianID" DataField="TechnicianID" Display="false" />
                            <telerik:GridBoundColumn HeaderText="xCustAcctNum" UniqueName="xCustAcctNum" DataField="xCustAcctNum" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UtilityWizardsConnectionString %>"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <asp:Panel runat="server" ID="pnlHidden" Visible="false" BackColor="#CC0000">
        <asp:Label ID="lblFields" runat="server"></asp:Label>
        <asp:Label ID="lblClientID" runat="server"></asp:Label>
        <asp:Label ID="lblModuleID" runat="server"></asp:Label>
        <asp:Label ID="lblCustAcctNum" runat="server"></asp:Label>
        <asp:Label ID="lblFilterID" runat="server"></asp:Label>
    </asp:Panel>
    <script type="text/javascript">
        function UpdateSearchDescription() {
            if (document.getElementById('lblSearchDesc')) {
                var desc = 'All [status] Work Orders [datetype] between [start] and [end]';

                // get the status description
                var status = ''
                var cbl = document.getElementById("<%=cblStatus.ClientID %>").getElementsByTagName("input");
                if (eval(cbl)) {
                    for (var i = 0; i < cbl.length; i++) {
                        if (cbl[i].checked) {
                            if (status == '') { status = cbl[i].nextSibling.innerHTML; } else { status += ' or ' + cbl[i].nextSibling.innerHTML; }
                        }
                    }
                }

                // date type
                var datetype = document.getElementById('<%=ddlDateType.ClientID%>').value;
                if (datetype == 'both') { datetype = 'created or modified'; }


                // replace the values in the final text
                desc = desc.replace('[status]', status);
                desc = desc.replace('[datetype]', datetype);
                desc = desc.replace('[start]', document.getElementById('<%=txtStartDate.ClientID%>').value);
                desc = desc.replace('[end]', document.getElementById('<%=txtEndDate.ClientID%>').value);

                if (document.getElementById('<%=txtSearchValue.ClientID%>').value !== '') {
                    desc += ' with [field] [comparison] "[value]"';

                    desc = desc.replace('[field]', document.getElementById('<%=ddlSearchField.ClientID%>').options[document.getElementById('<%=ddlSearchField.ClientID%>').selectedIndex].text);

                var comparison = '';
                switch (document.getElementById('<%=ddlSearchComparison.ClientID%>').value) {
                    case 'startswith':
                        comparison = 'starting with';
                        break;
                    case 'endswith':
                        comparison = 'ending with';
                        break;
                    case 'contains':
                        comparison = 'containing';
                        break;
                    case 'equals':
                        comparison = 'equal to';
                        break;
                }
                desc = desc.replace('[comparison]', comparison);
                desc = desc.replace('[value]', document.getElementById('<%=txtSearchValue.ClientID%>').value);
                }

                document.getElementById('lblSearchDesc').innerText = desc;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContent_OutsideAjax" runat="server">
</asp:Content>
