<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeFile="AsyncStudnetMain.aspx.cs" Inherits="AsyncStudnetMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <style>
        form span {
            margin: 20px;
        }

        #bg{
            display:none;
            position:absolute;
            top:0%;
            left:0%;
            width:100%;
            height:100%;
            background-color:black;
            z-index:1001;
            opacity:50;
            filter:alpha(opacity=50);
        }
        #bg img{
            position:absolute;
            top:40%;
            left:40%;
            width:20%;
            background-color:black;
            z-index:1002;
            opacity:50;
            filter:alpha(opacity=50);

        }
    </style>
    <asp:Label ID="Label7" runat="server" Text="学生管理" Font-Size="XX-Large"></asp:Label>
        <br />
        <br />
        <div id="bg">
        <img src="images/0.gif" />
        </div>
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
            <asp:Button ID="btnQuery" runat="server" Text="查询" style="height: 21px" OnClientClick="return false" />
            &nbsp;
            <asp:Button ID="btnAdd" runat="server" Text="增加学生" UseSubmitBehavior="False" OnClientClick="return false" />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <asp:GridView ID="gvShow" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" Width="540px">
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
            </asp:GridView>
            <br />
            </asp:Panel>
            <asp:Panel ID="pnlPage" runat="server" >
                <asp:HyperLink ID="First" runat="server" >第一页</asp:HyperLink>
                <asp:HyperLink ID="Previous" runat="server" >上一页</asp:HyperLink>
                <asp:HyperLink ID="Next" runat="server" >下一页</asp:HyperLink>
                <asp:HyperLink ID="Last" runat="server" >最后一页</asp:HyperLink>
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

            $('#<%=this.btnQuery.ClientID%>').on('click', function () {
                pageNumber = 1;
                myAjax();
                return false;
            });

            $('#<%=this.btnAdd.ClientID%>').on('click', function () {
                window.open('StudentAdd.aspx');
            });
        })

        function showdiv() {
            document.getElementById('bg').style.display = "block";
        }
        function hidediv() {
            document.getElementById("bg").style.display = 'none';
        }
        //var pageNumber = 1;
        //var pageTotalNumber = 0;

        function myAjax() {
            //调用一般处理程序
            $.ajax({
                url: '/StudentHandlerAsyncAjax.ashx',
                type: 'POST',
                async: true,
                data: 'txtStudentName=' + $('#<%=this.txtStudentName.ClientID%>').val() + '&cboSex=' + $('#<%=this.cboSex.ClientID%>').val() + '&cboClass=' + $('#<%=this.cboClass.ClientID%>').val() + '&pageNumber=' + pageNumber,
                dataType: 'json',
                beforeSend: function (data) {
                    showdiv();
                    $('#<%=this.gvShow.ClientID%> tr td').parent().remove();
                },
                success: function (data) {
                    if (data.PageTotalNumber > 0) {
                        $.each(data.Rows, function (n, item){
                            $('#<%=this.gvShow.ClientID%>').append(
                                '<tr>' +
                                    '<td>' + item.LoginId + '</td><td>' + item.ClassName + '</td><td>' + item.StudentNO + '</td><td>' + item.StudentName + '</td><td>' + item.Sex + '</td><td>'+item.Address+'</td>' +
                                    '<td><input type="button" value="修改" onclick=modify(' + item.StudentGuid + '))/></td>' +
                                    '<td><input type="button" value="删除" onclick=Remove(' + item.StudentGuid + ')) /></td>' +
                                '</tr>');
                        });
                        $('#<%=this.pageMsg.ClientID%>').html('第' + data.PageNumber + '页,共' + data.PageTotalNumber + '页');
                    }
                    else {
                        $('#<%=this.gvShow.ClientID%>').append("<tr><td colspan='7' align='center'>查无结果</td></tr>");
                        $('#<%=this.pageMsg.ClientID%>').html('');
                    }

                    pageNumber = data.PageNumber;
                    pageTotalNumber = data.PageTotalNumber;

                    $('#<%=this.First.ClientID%>').off('click').on('click', function () {
                        pageNumber = 1;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.Previous.ClientID%>').off('click').on('click', function () {
                        pageNumber--;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.Next.ClientID%>').off('click').on('click', function () {
                        pageNumber++;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.Last.ClientID%>').off('click').on('click', function () {
                        pageNumber = pageTotalNumber;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.First.ClientID%>').attr('href', 'javascript:void(0);');
                    $('#<%=this.Previous.ClientID%>').attr('href', 'javascript:void(0);');
                    $('#<%=this.Next.ClientID%>').attr('href', 'javascript:void(0);');
                    $('#<%=this.Last.ClientID%>').attr('href', 'javascript:void(0);');

                    if (pageNumber <= 1) {
                        $('#<%=this.First.ClientID%>').removeAttr('href').off('click');
                        $('#<%=this.Previous.ClientID%>').removeAttr('href').off('click');
                    }

                    if (pageNumber >= pageTotalNumber) {
                        $('#<%=this.Next.ClientID%>').removeAttr('href').off('click');
                        $('#<%=this.Last.ClientID%>').removeAttr('href').off('click');
                    }
                },
                complete: function () {
                    hidediv();
                }
            })

            //使用WCF服务
           <%-- $.ajax({
                url: '/AsyncStudentAjaxService.svc/QueryPage',
                type: 'POST',
                async: true,
                contentType: "application/json; charset=utf-8",
                data: '{"txtStudentName":"' + $('#<%=this.txtStudentName.ClientID%>').val() + '","cboSex":"' + $('#<%=this.cboSex.ClientID%>').val() + '","cboClass":"' + $('#<%=this.cboClass.ClientID%>').val() + '","pageNumber":'+ pageNumber +'}',
                //data: 'txtStudentName=' + $('#<%=this.txtStudentName.ClientID%>').val() + '&cboSex=' + $('#<%=this.cboSex.ClientID%>').val() + '&cboClass=' + $('#<%=this.cboClass.ClientID%>').val() + '&pageNumber=' + pageNumber,
                dataType: 'json',
                beforeSend: function (data) {
                    showdiv();
                    $('#<%=this.gvShow.ClientID%> tr td').parent().remove();
                },
                success: function (data) {
                    debugger;
                    var data = data.d;
                    if (data.PageTotalNumber > 0) {
                        $.each(data.Rows, function (n, item) {
                            $('#<%=this.gvShow.ClientID%>').append(
                                '<tr>' +
                                    '<td>' + item.LoginId + '</td><td>' + item.classs.ClassName + '</td><td>' + item.StudentNO + '</td><td>' + item.StudentName + '</td><td>' + item.Sex + '</td><td>'+item.Address+'</td>' +
                                    '<td><input type="button" value="修改" onclick=modify(' + item.StudentGuid + '))/></td>' +
                                    '<td><input type="button" value="删除" onclick=Remove(' + item.StudentGuid + ')) /></td>' +
                                '</tr>');
                        });
                        $('#pageMsg').html('第' + data.PageNumber + '页,共' + data.PageTotalNumber + '页');
                    }
                    else {
                        $('#<%=this.gvShow.ClientID%>').append("<tr><td colspan='7' align='center'>查无结果</td></tr>");
                        $('#<%=this.pageMsg.ClientID%>').html('');
                    }

                    pageNumber = data.PageNumber;
                    pageTotalNumber = data.PageTotalNumber;

                    $('#<%=this.First.ClientID%>').off('click').on('click', function () {
                        pageNumber = 1;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.Previous.ClientID%>').off('click').on('click', function () {
                        pageNumber--;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.Next.ClientID%>').off('click').on('click', function () {
                        pageNumber++;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.Last.ClientID%>').off('click').on('click', function () {
                        pageNumber = pageTotalNumber;
                        myAjax();
                        return false;
                    });

                    $('#<%=this.First.ClientID%>').attr('href', 'javascript:void(0);');
                    $('#<%=this.Previous.ClientID%>').attr('href', 'javascript:void(0);');
                    $('#<%=this.Next.ClientID%>').attr('href', 'javascript:void(0);');
                    $('#<%=this.Last.ClientID%>').attr('href', 'javascript:void(0);');

                    if (pageNumber <= 1) {
                        $('#<%=this.First.ClientID%>').removeAttr('href').off('click');
                        $('#<%=this.Previous.ClientID%>').removeAttr('href').off('click');
                    }

                    if (pageNumber >= pageTotalNumber) {
                        $('#<%=this.Next.ClientID%>').removeAttr('href').off('click');
                        $('#<%=this.Last.ClientID%>').removeAttr('href').off('click');
                    }
                },
                complete: function () {
                    hidediv();
                }
            })--%>
        }
    </script>
</asp:Content>

