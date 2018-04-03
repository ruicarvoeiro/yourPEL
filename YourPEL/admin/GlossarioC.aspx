<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administracao.Master" AutoEventWireup="true" CodeBehind="GlossarioC.aspx.cs" Inherits="AdminYourPEL.GlossarioC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="GestaoGlossario" runat="server">
    <br />
    <br />
    <br />
    <ul class="nav nav-pills">
        <!-- class="active" -->
        <li role="presentation"><a href="GlossarioA.aspx">Alimentação</a></li>
        <li role="presentation" class="active"><a href="GlossarioC.aspx">Consumos Nocivos</a></li>
        <li role="presentation"><a href="GlossarioS.aspx">Sexualidade</a></li>
    </ul>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content24" ContentPlaceHolderID="GlossarioC" runat="server">
    <form runat="server">
        <div class="container">
            <div id="edicaoDocs" class="row">
                <asp:Label runat="server" ID="lblAdicionarEntradaGlossario" Font-Size="XX-Large">Adicionar Entrada no Glossário</asp:Label>
                <br />
                <br />
                <asp:Label runat="server" ID="lblFeedback" ForeColor="Red"></asp:Label>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblTituloEntradaGlossario" Font-Bold="true">Titulo:</asp:Label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtTituloEntradaGlossario" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblDescricaoEntradaGlossario" Font-Bold="true">Descrição:</asp:Label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtDescricaoEntradaGlossario" TextMode="MultiLine" Width="100%"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:Button runat="server" ID="btnAddEntradaGlossario" OnClick="btnAddEntradaGlossario_Click" Text="Adicionar" class="btn btn-block btn-danger" /><br />
                        </div>
                    </div>
                </div>
            </div>
            <div runat="server" id="listaGlossario" class="row">
                <h1>Glossário</h1>
                <a href="#letraA" style="font-size: x-large">A</a>
                <a href="#letraB" style="font-size: x-large">B</a>
                <a href="#letraC" style="font-size: x-large">C</a>
                <a href="#letraD" style="font-size: x-large">D</a>
                <a href="#letraE" style="font-size: x-large">E</a>
                <a href="#letraF" style="font-size: x-large">F</a>
                <a href="#letraG" style="font-size: x-large">G</a>
                <a href="#letraH" style="font-size: x-large">H</a>
                <a href="#letraI" style="font-size: x-large">I</a>
                <a href="#letraJ" style="font-size: x-large">J</a>
                <a href="#letraK" style="font-size: x-large">K</a>
                <a href="#letraL" style="font-size: x-large">L</a>
                <a href="#letraM" style="font-size: x-large">M</a>
                <a href="#letraN" style="font-size: x-large">N</a>
                <a href="#letraO" style="font-size: x-large">O</a>
                <a href="#letraP" style="font-size: x-large">P</a>
                <a href="#letraQ" style="font-size: x-large">Q</a>
                <a href="#letraR" style="font-size: x-large">R</a>
                <a href="#letraS" style="font-size: x-large">S</a>
                <a href="#letraT" style="font-size: x-large">T</a>
                <a href="#letraU" style="font-size: x-large">U</a>
                <a href="#letraV" style="font-size: x-large">V</a>
                <a href="#letraW" style="font-size: x-large">W</a>
                <a href="#letraX" style="font-size: x-large">X</a>
                <a href="#letraY" style="font-size: x-large">Y</a>
                <a href="#letraZ" style="font-size: x-large">Z</a>
                <br />
                <asp:Label ID="lblFeedback2" runat="server" ForeColor="Green"></asp:Label>
                <h3 id="letraA">A</h3>
                <asp:GridView ID="gvA" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceA" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescricaoAEditar" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceA" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='a']/definicao" EnableCaching="false"></asp:XmlDataSource>
                <br />
                <h3 id="letraB">B</h3>
                <asp:GridView ID="gvB" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceB" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceB" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='b']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraC">C</h3>
                <asp:GridView ID="gvC" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceC" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceC" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='c']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraD">D</h3>
                <asp:GridView ID="gvD" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceD" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceD" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='d']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraE">E</h3>
                <asp:GridView ID="gvE" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceE" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceE" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='e']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraF">F</h3>
                <asp:GridView ID="gvF" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceF" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceF" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='f']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraG">G</h3>
                <asp:GridView ID="gvG" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceG" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceG" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='g']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraH">H</h3>
                <asp:GridView ID="gvH" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceH" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceH" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='h']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraI">I</h3>
                <asp:GridView ID="gvI" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceI" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceI" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='i']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraJ">J</h3>
                <asp:GridView ID="gvJ" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceJ" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceJ" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='j']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraK">K</h3>
                <asp:GridView ID="gvK" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceK" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceK" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='k']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraL">L</h3>
                <asp:GridView ID="gvL" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceL" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceL" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='l']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraM">M</h3>
                <asp:GridView ID="gvM" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceM" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceM" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='m']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraN">N</h3>
                <asp:GridView ID="gvN" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceN" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceN" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='n']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraO">O</h3>
                <asp:GridView ID="gvO" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceO" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceO" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='o']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraP">P</h3>
                <asp:GridView ID="gvP" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceP" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceP" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='p']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraQ">Q</h3>
                <asp:GridView ID="gvQ" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceQ" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceQ" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='q']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraR">R</h3>
                <asp:GridView ID="gvR" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceR" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceR" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='r']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraS">S</h3>
                <asp:GridView ID="gvS" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceS" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceS" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='s']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraT">T</h3>
                <asp:GridView ID="gvT" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceT" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceT" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='t']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraU">U</h3>
                <asp:GridView ID="gvU" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceU" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceU" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='u']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraV">V</h3>
                <asp:GridView ID="gvV" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceV" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceV" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='v']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraW">W</h3>
                <asp:GridView ID="gvW" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceW" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceW" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='w']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraX">X</h3>
                <asp:GridView ID="gvX" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceX" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceX" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='x']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraY">Y</h3>
                <asp:GridView ID="gvY" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceY" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceY" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='y']/definicao"></asp:XmlDataSource>
                <br />
                <h3 id="letraZ">Z</h3>
                <asp:GridView ID="gvZ" runat="server" DataKeyNames="Título" DataSourceID="XmlDataSourceZ" Width="80%" OnRowCreated="gv_RowCreated"
                    AutoGenerateColumns="false" OnRowDeleting="gv_RowDeleting" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Título">
                            <ItemTemplate>
                                <%# Eval("Título") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <%# Eval("Descrição") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Descrição") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <asp:XmlDataSource ID="XmlDataSourceZ" runat="server" DataFile="~/glossarioC.xml" TransformFile="~/XSLFile1.xsl" XPath="//letra[@id='z']/definicao"></asp:XmlDataSource>

            </div>
        </div>
    </form>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
</asp:Content>
