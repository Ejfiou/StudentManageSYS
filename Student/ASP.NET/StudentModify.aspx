<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeFile="StudentModify.aspx.cs" Inherits="StudentModify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <h1>修改学生信息</h1>
    <div>
        <table>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="学号："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtStuNo" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStuNo" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label4" runat="server" Text="姓名："></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label6" runat="server" Text="学生性别："></asp:Label>
                </td>
                <td >
                    <asp:Panel ID="Panel2" runat="server" Width="147px">
                        <asp:RadioButton GroupName="sex" ID="rdoMale" runat="server" Text="男" />
                        <asp:RadioButton GroupName="sex" ID="rdoFamel" runat="server" Text="女" />
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label7" runat="server" Text="学生地址："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label8" runat="server" Text="班级："></asp:Label>
                </td>
                <td >
                    <asp:DropDownList ID="cboClassGuid" runat="server" DataTextField="ClassName" DataValueField="ClassGuid">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cboClassGuid" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnModify"  runat="server" Text="修改" OnClick="btnModify_Click" />
                </td>
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

        .auto-style3 {
            width: 100%;
            margin-right: 0px;
        }
        .auto-style1 {
            width: 81px;
        }
        .auto-style2 {
            width: 53px;
        }
        .auto-style4 {
            width: 81px;
            height: 20px;
        }
        .auto-style5 {
            width: 53px;
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
        }
    </style>
</head>
<body>
    <h1>修改学生信息</h1>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style3">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="学号："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtStuNo" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="姓名："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="学生性别："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Panel ID="Panel1" runat="server" Width="147px">
                        <asp:RadioButton GroupName="sex" ID="rdoMale" runat="server" Text="男" />
                        <asp:RadioButton GroupName="sex" ID="rdoFamel" runat="server" Text="女" />
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label7" runat="server" Text="学生地址："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Text="班级："></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="cboClassGuid" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassGuid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MySchoolConnectionString %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnModify"  runat="server" Text="修改" OnClick="btnModify_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>--%>
