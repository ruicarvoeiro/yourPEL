<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="AdminYourPEL.Forum" %>
<asp:Content ID="Content17" ContentPlaceHolderID="Forum" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <li role="presentation"><a href="addPost.aspx">Novo Post</a></li>
    </ul>
    <form id="DefaultPosts" class="form-group" runat="server">
        <asp:GridView ID="GridView4" runat="server" Visible="false"
            CssClass="table table-hover table-striped" GridLines="None"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource4" OnRowCommand="GridView4_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="TITULO" HeaderText="Título" SortExpression="TITULO" />
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" InsertVisible="False" ReadOnly="True" SortExpression="ID_POST" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:BoundField DataField="TEMA" HeaderText="Tema" SortExpression="TEMA" />
                <asp:TemplateField HeaderText="Tópico">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA], [TEMA] FROM [POST] WHERE ([FECHADO] = @FECHADO)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView4" DefaultValue="TRUE" Name="FECHADO" PropertyName="SelectedValue" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <asp:GridView ID="GridView1" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None" Visible="false"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" SortExpression="ID_POST" />
                <asp:BoundField DataField="TITULO" HeaderText="Título" SortExpression="TITULO" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:TemplateField HeaderText="Tópico">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA] FROM [POST] WHERE (([FECHADO] = @FECHADO) AND ([TEMA] = @TEMA))">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="TRUE" Name="FECHADO" PropertyName="SelectedValue" Type="Boolean" />
                <asp:ControlParameter ControlID="GridView1" DefaultValue="Sexualidade" Name="TEMA" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <asp:GridView ID="GridView2" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None" Visible="false"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource2" OnRowCommand="GridView2_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" SortExpression="ID_POST" />
                <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA] FROM [POST] WHERE (([FECHADO] = @FECHADO) AND ([TEMA] = @TEMA))">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" DefaultValue="true" Name="FECHADO" PropertyName="SelectedValue" Type="Boolean" />
                <asp:ControlParameter ControlID="GridView2" DefaultValue="Substâncias Nocivas" Name="TEMA" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <asp:GridView ID="GridView3" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None" Visible="false"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource3" OnRowCommand="GridView3_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" InsertVisible="False" ReadOnly="True" SortExpression="ID_POST" />
                <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA] FROM [POST] WHERE (([FECHADO] = @FECHADO) AND ([TEMA] = @TEMA))">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" DefaultValue="true" Name="FECHADO" PropertyName="SelectedValue" Type="Boolean" />
                <asp:ControlParameter ControlID="GridView3" DefaultValue="Alimentação" Name="TEMA" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <h3>Últimos Posts Publicados</h3>
        <br />
        <br />
        <asp:GridView ID="GridView5" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource5" OnRowCommand="GridView5_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="TITULO" HeaderText="Título" SortExpression="TITULO" />
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" InsertVisible="False" ReadOnly="True" SortExpression="ID_POST" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:BoundField DataField="TEMA" HeaderText="Tema" SortExpression="TEMA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [RESPOSTA] WHERE [ID_POST] = @ID_POST; DELETE FROM [POST] WHERE [ID_POST] = @ID_POST" InsertCommand="INSERT INTO [POST] ([TITULO], [DATA_HORA], [TEMA]) VALUES (@TITULO, @DATA_HORA, @TEMA)" SelectCommand="SELECT [TITULO], [ID_POST], [DATA_HORA], [TEMA] FROM [POST] ORDER BY [ID_POST] DESC" UpdateCommand="UPDATE [POST] SET [TITULO] = @TITULO, [DATA_HORA] = @DATA_HORA, [TEMA] = @TEMA WHERE [ID_POST] = @ID_POST">
            <DeleteParameters>
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <h4>Sexualidade</h4>
        <asp:GridView ID="GridView6" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource6" OnRowCommand="GridView6_RowCommand">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>

                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" SortExpression="ID_POST" />
                <asp:BoundField DataField="TITULO" HeaderText="Título" SortExpression="TITULO" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:TemplateField HeaderText="Tópico">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [POST] WHERE [ID_POST] = @ID_POST" InsertCommand="INSERT INTO [POST] ([TITULO], [DATA_HORA], [TEMA]) VALUES (@TITULO, @DATA_HORA, @TEMA)" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA], [TEMA] FROM [POST] WHERE ([TEMA] = @TEMA)" UpdateCommand="UPDATE [POST] SET [TITULO] = @TITULO, [DATA_HORA] = @DATA_HORA, [TEMA] = @TEMA WHERE [ID_POST] = @ID_POST">
            <DeleteParameters>
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="Sexualidade" Name="TEMA" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <br />
        <br />
        <h4>Consumos Nocivos</h4>
        <asp:GridView ID="GridView7" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource7" OnRowCommand="GridView7_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" SortExpression="ID_POST" />
                <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [POST] WHERE [ID_POST] = @ID_POST" InsertCommand="INSERT INTO [POST] ([TITULO], [DATA_HORA], [TEMA]) VALUES (@TITULO, @DATA_HORA, @TEMA)" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA], [TEMA] FROM [POST] WHERE ([TEMA] = @TEMA)" UpdateCommand="UPDATE [POST] SET [TITULO] = @TITULO, [DATA_HORA] = @DATA_HORA, [TEMA] = @TEMA WHERE [ID_POST] = @ID_POST">
            <DeleteParameters>
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" DefaultValue="Consumos Nocivos" Name="TEMA" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <h4>Alimentação</h4>
        <asp:GridView ID="GridView8" runat="server" 
            CssClass="table table-hover table-striped" GridLines="None"
            AutoGenerateColumns="False" DataKeyNames="ID_POST" DataSourceID="SqlDataSource8" OnRowCommand="GridView8_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ID_POST" HeaderText="Post Nº" InsertVisible="False" ReadOnly="True" SortExpression="ID_POST" />
                <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                <asp:BoundField DataField="DATA_HORA" HeaderText="DATA_HORA" SortExpression="DATA_HORA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Width="60" Text="Abrir" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:YourPELcs %>" DeleteCommand="DELETE FROM [POST] WHERE [ID_POST] = @ID_POST" InsertCommand="INSERT INTO [POST] ([TITULO], [DATA_HORA], [TEMA]) VALUES (@TITULO, @DATA_HORA, @TEMA)" SelectCommand="SELECT [ID_POST], [TITULO], [DATA_HORA], [TEMA] FROM [POST] WHERE ([TEMA] = @TEMA)" UpdateCommand="UPDATE [POST] SET [TITULO] = @TITULO, [DATA_HORA] = @DATA_HORA, [TEMA] = @TEMA WHERE [ID_POST] = @ID_POST">
            <DeleteParameters>
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" DefaultValue="Alimentação" Name="TEMA" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITULO" Type="String" />
                <asp:Parameter Name="DATA_HORA" Type="String" />
                <asp:Parameter Name="TEMA" Type="String" />
                <asp:Parameter Name="ID_POST" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</asp:Content>
<asp:Content ID="Content16" ContentPlaceHolderID="AddPost" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="oTopico" runat="server">
</asp:Content>