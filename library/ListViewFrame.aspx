<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListViewFrame.aspx.cs" Inherits="Library_testlistview" MaintainScrollPositionOnPostBack="True"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/App_style/CssDefault.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divrbs" class ="schrbs" runat="server">
            <asp:RadioButton ID="O_name"  runat="server" Text="名称" GroupName="group1" />
            <asp:RadioButton ID="O_item" runat="server" Text="货号" GroupName="group1"/>
            <asp:RadioButton ID="O_orderer" runat="server" Text="订购人" GroupName="group1"/>
            <asp:RadioButton ID="O_receiver" runat="server" Text="收货人"  GroupName="group1"/>
        </div>
        <div class="schbox">
        <asp:textbox ID="tbsch" runat="server" Text=""  CssClass="schtxtbox">
        </asp:textbox><asp:Button ID="btnsearch" runat="server" Text="搜索" OnClick="BtnSearch_Click" CssClass="schbutton"    />
            <asp:Button ID="btnorder" runat="server" Text="我要订购" CssClass="schbutton" OnClick="BtnOrder_Click"/>
        </div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
        <asp:View ID="Viewadd" runat="server">
        <div id="insertitem" class="edititemtem">
            <div class="btn">
                            <asp:Button ID="btnconfirm" runat="server" Text="确定" OnClick="BtnConfirm_Click" OnClientClick="return confirm('是否确定订购？')" />
                            <asp:Button ID="btncancel" runat="server" Text="取消" OnClick="BtnCancel_Click"  />
                        </div>
                        <div class="product">
                            <h4>名称:<asp:TextBox ID="tbname" runat="server"  TextMode="MultiLine"></asp:TextBox></h4>
                            <h4>公司:<asp:TextBox ID="tbbrand" runat="server" ></asp:TextBox></h4>
                            <h4>货号:<asp:TextBox ID="tbitem" runat="server" ></asp:TextBox></h4>
                            <h4>数量:<asp:TextBox ID="tbnumber" runat="server" ></asp:TextBox></h4>
                        </div>
                        <div class="person">
                            <p>订购人:<asp:TextBox ID="tborderer" runat="server" ></asp:TextBox></p>
                        </div>
                        <div class="note">
                            <p>备注:<asp:TextBox ID="tbnote" runat="server" TextMode="MultiLine" Height="80px" ></asp:TextBox></p>

                        </div>
                        <div class="clr"></div>
             </div>
        </asp:View>
        <asp:View ID="Viewlv" runat="server">
          <div>
           <asp:ListView ID="lvorder" runat="server" ItemPlaceholderID="itemholder" DataSourceID="SDSorder" DataKeyNames="O_id" >
                <LayoutTemplate>
                    <div id="itemholder" runat="server"></div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="itemtem">
                   
                        <div class="btn">
                            <asp:Button ID="btnlviupdate" runat="server" Text="修改" CommandName="Edit" Visible='<%#Eval("O_edit")%>'/>
                            <asp:Button ID="btnlvdelete" runat="server" Text="删除" OnCommand="MarkDelete" Visible='<%#Eval("O_edit")%>' CommandArgument='<%#Eval("O_id")%>' CommandName="markonly" OnClientClick="return confirm('确认删除？')"/>
                            <asp:Button ID="btnlvireorder" runat="server" Text="重新订购" OnCommand="ReOrder" CommandArgument='<%#Eval("O_id")%>' CommandName="switchmv0" />
                        </div>
                        <div class="product">
                            <h4>名称:<%#Eval("O_name")%></h4>
                            <h4>公司:<%#Eval("O_brand")%></h4>
                            <h4>货号:<%#Eval("O_item")%></h4>
                            <h4>数量:<%#Eval("O_number")%></h4>
                        </div>
                        <div class="person">
                            <p>申请时间:<%#Eval("O_ordertime")%></p>
                            <p>订购人:<%#Eval("O_orderer")%></p>
                            <p>订购时间:<%#Eval("O_buytime")%></p>
                            <p>到货时间:<%#Eval("O_arrival")%></p>
                            <p>收货人:<%#Eval("O_receiver")%></p>
                        </div>
                        <div class="note">
                            <p>备注:<%#Eval("O_note")%></p>

                        </div>
                        <div class="clr"></div>
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div class="altitemtem">
                        <div class="btn">
                            <asp:Button ID="btnlviupdate" runat="server" Text="修改" CommandName="Edit" Visible='<%#Eval("O_edit")%>'/>
                            <asp:Button ID="btnlvdelete" runat="server" Text="删除" OnCommand="MarkDelete" Visible='<%#Eval("O_edit")%>' CommandArgument='<%#Eval("O_id")%>' CommandName="markonly"/>
                            <asp:Button ID="btnlvireorder" runat="server" Text="重新订购" OnCommand="ReOrder" CommandArgument='<%#Eval("O_id")%>' CommandName="switchmv0" />
                        </div>
                        <div class="product">
                            <h4>名称:<%#Eval("O_name")%></h4>
                            <h4>公司:<%#Eval("O_brand")%></h4>
                            <h4>货号:<%#Eval("O_item")%></h4>
                            <h4>数量:<%#Eval("O_number")%></h4>
                        </div>
                        <div class="person">
                            <p>申请时间:<%#Eval("O_ordertime")%></p>
                            <p>订购人:<%#Eval("O_orderer")%></p>
                            <p>订购时间:<%#Eval("O_buytime")%></p>
                            <p>到货时间:<%#Eval("O_arrival")%></p>
                            <p>收货人:<%#Eval("O_receiver")%></p>
                        </div>
                        <div class="note">
                            <p>备注:<%#Eval("O_note")%></p>

                        </div>
                        <div class="clr"></div>
                    </div>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <div class="edititemtem">
                   
                        <div class="btn">
                            <asp:Button ID="btnlveupdate" runat="server" Text="确定" CommandName="Update" OnClientClick="return confirm('是否确定修改？')"/>
                            <asp:Button ID="btnlvcancel" runat="server" Text="取消" CommandName="Cancel" />
                        </div>
                        <div class="product">
                            <h4>名称:<asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("O_name")%>' TextMode="MultiLine" /></h4>
                            <h4>公司:<asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("O_brand")%>'/></h4>
                            <h4>货号:<asp:TextBox ID="TextBox3" runat="server" Text='<%#Bind("O_item")%>'/></h4>
                            <h4>数量:<asp:TextBox ID="TextBox4" runat="server" Text='<%#Bind("O_number")%>'/></h4>
                        </div>
                        <div class="person">
                            <p>申请时间:<%#Eval("O_ordertime")%></p>
                            <p>订购人:<asp:TextBox ID="TextBox5" runat="server" Text='<%#Bind("O_orderer")%>'/></p>
                            <p>订购时间:<%#Eval("O_buytime")%></p>
                            <p>到货时间:<%#Eval("O_arrival")%></p>
                            <p>收货人:<%#Eval("O_receiver")%></p>
                        </div>
                        <div class="note">
                            <p>备注:<asp:TextBox ID="TextBox6" runat="server" Text='<%#Bind("O_note")%>' TextMode="MultiLine" Height="80px"/></p>

                        </div>
                        <div class="clr"></div>
                    </div>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <p>无记录！</p>
                </EmptyDataTemplate>
            </asp:ListView>
             <asp:SqlDataSource ID="SDSorder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringorder %>" 

                ProviderName="<%$ ConnectionStrings:ConnectionStringorder.ProviderName %>" 
                SelectCommand="SELECT * FROM [T_order] WHERE ([O_delete] = ?) ORDER BY [O_id] DESC" 
                UpdateCommand="UPDATE [T_order] SET [O_orderer] = ?, [O_name] = ?, [O_brand] = ?, [O_item] = ?, [O_number] = ?, [O_note] = ? WHERE [O_id] = ?">

                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="O_delete" Type="Boolean" />
                </SelectParameters>
                <UpdateParameters>
                    
                    <asp:Parameter Name="O_orderer" Type="String" />
                    <asp:Parameter Name="O_name" Type="String" />
                    <asp:Parameter Name="O_brand" Type="String" />
                    <asp:Parameter Name="O_item" Type="String" />
                    <asp:Parameter Name="O_number" Type="String" />
               
                    
                    <asp:Parameter Name="O_note" Type="String" />

                    <asp:Parameter Name="O_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="divpager">
              <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvorder" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
              </asp:DataPager>
           </div>
           </div>
          </asp:View>
      </asp:MultiView>
    </form>
</body>
</html>
