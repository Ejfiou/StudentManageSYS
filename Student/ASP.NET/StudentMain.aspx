<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeFile="StudentMain.aspx.cs" Inherits="StudentMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <asp:Label ID="Label7" runat="server" Text="学生管理" Font-Size="XX-Large"></asp:Label>
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server">
            <asp:Label ID="Label1" runat="server" Text="请输入要查询的姓名"></asp:Label>
            <asp:TextBox ID="txtStudentName" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Label ID="Label2" runat="server" Text="请选择要查询的性别"></asp:Label>
            <asp:DropDownList ID="cboSex" runat="server">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label3" runat="server" Text="请选择要查询的班级"></asp:Label>
            <asp:DropDownList ID="cboClass" runat="server">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            
            &nbsp;&nbsp;
            <asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="btnQuery_Click" style="height: 21px" />
            &nbsp;
            <asp:Button ID="btnAdd" runat="server" Text="增加学生" UseSubmitBehavior="False" OnClientClick="return false" OnClick="btnAdd_Click" />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <asp:GridView ID="gvShow" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" Width="540px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="用户名" DataField="LoginId" />
                    <asp:BoundField HeaderText="班级" DataField="classs.ClassName" />
                    <asp:BoundField HeaderText="学号" DataField="StudentNO" />
                    <asp:BoundField HeaderText="姓名" DataField="StudentName" />
                    <asp:BoundField HeaderText="性别" DataField="Sex" />
                    <asp:BoundField HeaderText="地址" DataField="Address" />
                    <asp:TemplateField HeaderText="修改" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="" Text="修改"  UseSubmitBehavior="False" OnClientClick='<%# Eval("StudentGuid","modify(&#39;{0}&#39;);return false;")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="" Text="删除" UseSubmitBehavior="False" OnClientClick='<%# JsRemove(Eval("LoginId").ToString(),Eval("StudentGuid").ToString())%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            </asp:Panel>
            <asp:Panel ID="pnlPage" runat="server" Visible="False">
                <asp:LinkButton ID="First" runat="server" OnClick="First_Click">第一页</asp:LinkButton>
                <asp:LinkButton ID="Previous" runat="server" OnClick="Previous_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="Next" runat="server" OnClick="Next_Click">下一页</asp:LinkButton>
                <asp:LinkButton ID="Last" runat="server" OnClick="Last_Click">最后一页</asp:LinkButton>
                <asp:Label ID="pageMsg" runat="server" Text=""></asp:Label>
                <asp:HiddenField ID="hfPageNumber" runat="server" />
                <asp:HiddenField ID="hfPageTotalNumber" runat="server" />
        </asp:Panel>
</asp:Panel>
    <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <script>
        function modify(guid) {           
            window.open('StudentModify.aspx?guid=' + guid);
        };
        function Remove(loginId,guid) {
            var r = window.confirm("确定删除用户" + loginId + "吗？");
            if (r==true) {
                window.open('StudentRemove.aspx?guid=' + guid);
            }
        };
        $(function() {
            //$('#cphContent_btnAdd').on('click', function () {
            //    window.open('StudentAdd.aspx');
            //});
            $('#<%=this.btnAdd.ClientID%>').on('click', function () {
                window.open('StudentAdd.aspx');
            });
        })
    </script>
</asp:Content>

