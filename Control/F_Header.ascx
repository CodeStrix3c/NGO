<%@ Control Language="C#" AutoEventWireup="true" CodeFile="F_Header.ascx.cs" Inherits="Control_F2_Header" %>
<div id="header">
<div id="menu">
<div id="ddtopmenubar" class="mattblackmenu">
<ul>
<li><a href="Default.aspx">Home</a></li>
<li><a href="#" rel="ddsubmenu1">Hajj</a></li>
<li><a href="#" rel="ddsubmenu2">Umrah</a></li>
<li><a href="#" rel="ddsubmenu3">Ziyaraat</a></li>
<li><a href="Enquiry.aspx">Enquiry</a></li>
<li><a href="Contact.aspx" >Contact Us</a></li>
</ul>
</div>
<script type="text/javascript">
ddlevelsmenu.setup("ddtopmenubar", "topbar") //ddlevelsmenu.setup("mainmenuid", "topbar|sidebar")
</script>

<ul id="ddsubmenu1" class="ddsubmenustyle">
<li><a href="Hajj_History.aspx">History</a></li>
<li><a href="Hajj_Hotels.aspx">Hotels</a></li>
<li><a href="Hajj_Packages.aspx">Packages</a></li>
<li><a href="Hajj_Calendar.aspx">Calendar</a></li>
<li><a href="Hajj_Training.aspx">Training</a></li>
<li><a href="Hajj_Gallery.aspx">Gallery</a></li>
</ul>


<ul id="ddsubmenu2" class="ddsubmenustyle">
<li><a href="Umrah_History.aspx">History</a></li>
<li><a href="Umrah_Hotels.aspx">Hotels</a></li>
<li><a href="Umrah_Packages.aspx">Packages</a></li>
<li><a href="Umrah_Calendar.aspx">Calendar</a></li>
<li><a href="Umrah_Training.aspx">Training</a></li>
<li><a href="Umrah_Gallery.aspx">Gallery</a></li>
</ul>

<ul id="ddsubmenu3" class="ddsubmenustyle">
<li><a href="Ziyarat_Places.aspx">Places</a></li>
<li><a href="Ziyarat_Hotels.aspx">Hotels</a></li>
<li><a href="Ziyarat_Packages.aspx">Packages</a></li>
<li><a href="Ziyarat_Gallery.aspx">Gallery</a></li>
</ul>


</div>
</div>