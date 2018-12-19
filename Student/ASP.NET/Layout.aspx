<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Layout.aspx.cs" Inherits="Layout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .myDiv{
            display:inline-block;
            vertical-align:top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="header" runat="server" HorizontalAlign="Center">
            <asp:Label ID="Label4" runat="server" Text="我的学生管理系统" Font-Bold="True" Font-Names="华文仿宋" Font-Size="X-Large"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="nav" runat="server" CssClass="myDiv" Width="120px">
            <asp:Label ID="Label6" runat="server" Text="菜单"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="section" runat="server" CssClass="myDiv">
            <asp:Label ID="Label7" runat="server" Text="主要内容"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="footer" runat="server" HorizontalAlign="Center">
            <asp:Label ID="Label5" runat="server" Text="Copyright XXX" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
