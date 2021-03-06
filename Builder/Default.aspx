﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPages/Dashboard.Master" CodeBehind="Default.aspx.vb" Inherits="UtilityWizards.Builder._Default4" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/masterPages/Dashboard.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="scripts/radWindowScripts.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menuContent" runat="server">
    <ul class="sidebar-menu">
        <asp:PlaceHolder runat="server" ID="pnlRootOptions">
            <li class="header">DASHBOARD OPTIONS</li>
            <li runat="server" id="liNewModule">
                <asp:LinkButton runat="server" ID="lnkNewModule"><i class="fa fa-puzzle-piece"></i><span>Add Module</span></asp:LinkButton>
            </li>
            <li runat="server" id="liNewFolder">
                <asp:LinkButton runat="server" ID="lnkNewFolder"><i class="fa fa-folder-open-o"></i><span>Add Folder</span></asp:LinkButton>
            </li>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="pnlFolderOptions">
            <li class="header">FOLDER OPTIONS</li>
            <li runat="server" id="liNewFolderModule">
                <asp:LinkButton runat="server" ID="lnkNewFolderModule"><i class="fa fa-puzzle-piece"></i><span>Add Module</span></asp:LinkButton>
            </li>
            <li runat="server" id="liDeleteFolder">
                <asp:LinkButton runat="server" ID="lnkDeleteFolder"><i class="fa fa-trash-o"></i><span>Delete Folder</span></asp:LinkButton>
            </li>
            <li runat="server" id="liEditFolder">
                <asp:LinkButton runat="server" ID="lnkEditFolder"><i class="fa fa-gears"></i><span>Manage Folder</span></asp:LinkButton>
            </li>
        </asp:PlaceHolder>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="breadcrumbContent" runat="server">
    <h1>Dashboard
        <small>Version 2.2</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageContent_Ajax" runat="server">
    <!-- Info boxes -->
    <asp:PlaceHolder runat="server" ID="pnlBadges">
        <div class="row">
            <asp:PlaceHolder runat="server" ID="pnlWOLookup">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-blue"></span>

                        <div class="info-box-content">
                            <span class="info-box-text" style="font-weight: bold;">Quick Lookup</span>
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%" HorizontalAlign="NotSet" LoadingPanelID="MainAjaxLoadingPanel">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>Work Order #</td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtWOLookup" Width="50px" /></td>
                                        <td>
                                            <asp:Button runat="server" ID="btnWOLookup" Text="Lookup" /></td>
                                    </tr>
                                </table>
                            </telerik:RadAjaxPanel>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
            </asp:PlaceHolder>
            <!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green"></span>

                    <div class="info-box-content">
                        <span class="info-box-text" style="font-weight: bold;">
                            <asp:LinkButton runat="server" ID="lnkCompletedWorkOrders">Completed Work Orders</asp:LinkButton></span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblCompletedWorkOrders" /></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red"></span>

                    <div class="info-box-content">
                        <span class="info-box-text" style="font-weight: bold;">
                            <asp:LinkButton runat="server" ID="lnkOpenWorkOrders">Open Work Orders</asp:LinkButton></span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblOpenWorkOrders" /></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
        </div>
    </asp:PlaceHolder>
    <!-- /.row -->
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <asp:Label ID="lblHeader" runat="server" Text="System Modules"></asp:Label></h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <telerik:RadAjaxPanel ID="MainAjaxPanel" runat="server" Width="100%" HorizontalAlign="NotSet" LoadingPanelID="MainAjaxLoadingPanel">
                        <asp:Literal runat="server" ID="lblAppUrl" />
                        <asp:Table runat="server" ID="tblModules" CellPadding="1" CellSpacing="2" Width="100%" Style="display: block;" />
                    </telerik:RadAjaxPanel>
                </div>
                <!-- ./box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-6">
                </div>
                <!-- /.col -->

                <div class="col-md-6">
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- TABLE: RECENT WORK ORDERS -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Recent Work Orders</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" Width="100%" Height="350px" SelectedIndex="0">
                        <telerik:RadPageView runat="server" ID="RadPageView1" ContentUrl="~/includes/RecentWorkOrders.aspx" Height="350px" />
                    </telerik:RadMultiPage>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->

        <div class="col-md-4">

            <!-- ACTIVITY LIST -->
            <asp:PlaceHolder runat="server" ID="pnlActivity">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Today's Activity</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" Width="100%" Height="350px" SelectedIndex="0">
                            <telerik:RadPageView runat="server" ID="RadPageView2" ContentUrl="~/includes/History.aspx" Height="350px" />
                        </telerik:RadMultiPage>
                    </div>
                    <!-- /.box-body -->
                </div>
            </asp:PlaceHolder>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="pageContent_OutsideAjax" runat="server">
</asp:Content>
