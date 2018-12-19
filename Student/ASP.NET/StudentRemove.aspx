<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeFile="StudentRemove.aspx.cs" Inherits="StudentRemove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
        label {
            text-align:right;        
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

     <h1>删除学生信息</h1>
     <div>
    
        <table style="width:100%;">
            <tr>
                <td >
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblLoginId" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="班级："></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblClassName" runat="server"></asp:Label>
                </td>
                <td ></td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label7" runat="server" Text="状态："></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblState" runat="server" ></asp:Label>
                </td>
                <td >&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="学号："></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblStudentNo" runat="server"></asp:Label>
                </td>
                <td ></td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label4" runat="server" Text="姓名："></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblStudentName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label5" runat="server" Text="性别："></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblSex" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="地址："></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnRemove" runat="server" Text="删除" OnClick="btnRemove_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <asp:HiddenField runat="server" ID="hfGuid"></asp:HiddenField>
    </div>
</asp:Panel>
</asp:Content>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 79px;
        }
        .auto-style2 {
            width: 79px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style4 {
            width: 151px;
        }
        .auto-style5 {
            width: 151px;
            height: 20px;
        }
    </style>
</head>
<body>
    <h1>删除学生信息</h1>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblLoginId" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="班级："></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Label ID="lblClassName" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="学号："></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblStudentNo" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="姓名："></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblStudentName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Text="性别："></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblSex" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="地址："></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnRemove" runat="server" Text="删除" OnClick="btnRemove_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>--%>
