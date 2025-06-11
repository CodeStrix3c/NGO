<%@ Control Language="C#" AutoEventWireup="true" CodeFile="footer.ascx.cs" Inherits="UserControls_footer" %>

<div id="footer-row" role="contentinfo">
    <div class="row-container">
        <div class="container">
            <div id="footer" class="row">
                <div class="moduletable contacts  span3">
                    <header>
                        <h3 class="moduleTitle "><span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Get</span> <span class="item_title_part1 item_title_part_even item_title_part_first_half">in</span> <span class="item_title_part2 item_title_part_odd item_title_part_second_half">touch</span> </h3>
                    </header>
                    <div class="mod-article-single mod-article-single__contacts" id="module_111">
                        <div class="item__module" id="item_68">
                            <div id="Div64"></div>
                            <div class="item_introtext">
                                <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="15" AutoGenerateColumns="False"
                                    DataKeyNames="ID" ShowFooter="True" AllowSorting="True"
                                    CellPadding="4" Width="100%"
                                    GridLines="None">
                                    <Columns>
                                        <asp:TemplateField SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:Label ID="lblWriterName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                <span>
                                                    <asp:Label ID="lblSName" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="moduletable   span2">
                    <header>
                        <h3 class="moduleTitle "><span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Media</span></h3>
                    </header>
                    <div class="mod-menu">
                        <ul class="nav menu footer">
                            <li><a href="gallery.aspx">Gallery</a></li>
                            <li class="item-227"><a href="newslist.aspx">News</a>
                            </li>
                            <li class="item-142"><a href="events.aspx">Events</a>
                            </li>

                        </ul>
                        <span id="siteseal">
                            <script async type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=PhFM3qnXSQep05OyDT6rQHzPI5b7Bd7UoCAG5ATJoJbZTXzhaXTcMI2kZ6l2"></script>
                        </span>
                    </div>
                </div>
                <div class="moduletable   span4">
                    <div class="mod-menu__social">
                        <div class="moduletable   span3">

                            <header>
                                <h3 class="moduleTitle visible visible-first">
                                    <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Join</span>
                                    <span class="item_title_part1 item_title_part_even item_title_part_first_half">our</span>
                                    <span class="item_title_part2 item_title_part_odd item_title_part_second_half">newsletter</span>
                                </h3>
                                <div class="acymailing_module" id="acymailing_module_formAcymailing80611">
                                    <div class="acymailing_mootoolsbutton">
                                        <div class="acymailing_introtext">And always stay informed of the latest  news and events!</div>
                                        <p><a rel="{handler: 'iframe', size: {x: 250, y: 200}}" class="modal acymailing_togglemodule" id="acymailing_togglemodule_formAcymailing80611" href="newsletter.aspx">Sign up &gt;&gt;</a></p>
                                    </div>
                                </div>



                            </header>


                        </div>
                    </div>
                </div>
                <div class="moduletable   span3">
                    <header>
                        <h3 class="moduleTitle "><span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">STAY CONNECTED</span>  </h3>
                    </header>
                    <div class="acymailing_module" id="acymailing_module_formAcymailing43481">
                        <div class="acymailing_mootoolsbutton">
                            <div class="acymailing_introtext">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="copyright" class="span12">
                    <span class="copy">&copy;</span><span class="year"><%= DateTime.Now.Year %></span><span class="siteName">&nbsp;&nbsp;All Rights Reserved. </span>

                </div>
            </div>
        </div>
    </div>
    <!-- Copyright -->
    <div id="copyright-row">
        <div class="moduletable ">
            <div class="mod-article-single map mod-article-single__" id="module_110">
                <div class="item__module" id="item_67">
                    <div id="Div66"></div>

                </div>
            </div>
        </div>
        <!-- {%FOOTER_LINK} -->
    </div>

</div>
