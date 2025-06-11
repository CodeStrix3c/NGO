<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mainmenu.ascx.cs" Inherits="UserControls_mainmenu" %>
<asp:Literal ID="ltrmenu" runat="server"></asp:Literal>

<li id="iceMenu_203" class="iceMenuLiLevel_1 mzr-drop parent">
    <a href="#" class="iceMenuTitle">
        <span class="icemega_title icemega_nosubtitle">Media</span>
    </a>
    <ul class="icesubMenu icemodules sub_level_1" style="width: 155px">
        <li>
            <div style="float: left; width: 155px" class="iceCols">
                <ul>
                    <li id="iceMenu_171" class="iceMenuLiLevel_2">
                        <a href='Events.aspx' class=" iceMenuTitle">
                        <span class="icemega_title icemega_nosubtitle">EVENTS</span>
                        </a>
                    </li>
                     <%-- <li id="Li1" class="iceMenuLiLevel_2">
                        <a href='videos.aspx' class=" iceMenuTitle">
                        <span class="icemega_title icemega_nosubtitle">Video</span>
                        </a>
                    </li>--%>
                     <li id="Li2" class="iceMenuLiLevel_2">
                        <a href='gallery.aspx' class=" iceMenuTitle">
                        <span class="icemega_title icemega_nosubtitle">PHOTO GALLERY</span>
                        </a>
                    </li>

                   
                </ul>
            </div>
        </li>
    </ul>
</li>
  <li id="Li3" class="iceMenuLiLevel_2">
                        <a href='Downloads.aspx' class=" iceMenuTitle" >
                        <span class="icemega_title icemega_nosubtitle">RESOURCES</span>
                        </a>
                    </li>
                <style>
                    .button {
                      padding: 8px 20px;
                      font-size: 14px;
                      text-align: center;
                      cursor: pointer;
                      outline: none;
                      color: #fff;
                      background-color: #22ADD6;
                      border: none;
                      border-radius: 15px;
                    }
                    .button:hover {background-color: #FC6A00}
                    .button:active {
                      background-color: #3e8e41;
                      box-shadow: 0 5px #666;
                      transform: translateY(4px);
                    }
                    </style>
                    
                     <li id="Li1" class="iceMenuLiLevel_2" style="padding-top:18px; padding-left:30px">
                       <a style="float:right" href="donate.aspx" class="button">
                       DONATE NOW</a>
                    </li> 

                   <%--  <li id="Li4" class="iceMenuLiLevel_2" style="padding-top:18px; padding-left:2px">
                       <a style="float:right" href="registration.aspx" class="button" title="Register for FREE Coaching Classes on RRB Recruitment Exam">
                       REGISTER NOW</a>
                    </li> --%>

                   <%--  <li id="Li4" class="iceMenuLiLevel_2" style="padding-top:18px; padding-left:2px">
                       <a style="float:right" href="result.aspx" class="button" title="Search Your Result">
                       Result</a>
                    </li>--%>
                  

                  

<%-- <button style="float:right" class="button">DONATE NOW</button>--%>