<%@ Page Title="Donate" Language="C#" AutoEventWireup="true" CodeFile="donate.aspx.cs" Inherits="donate" %>

<%@ Register Src="UserControls/InsideLatestNews.ascx" TagName="InsideLatestNews" TagPrefix="uc10" %>
<%@ Register Src="UserControls/Banner.ascx" TagName="Banner" TagPrefix="uc1" %>
<%@ Register Src="UserControls/mainmenu.ascx" TagName="mainmenu" TagPrefix="uc2" %>
<%@ Register Src="UserControls/HomeDetails.ascx" TagName="HomeDetails" TagPrefix="uc3" %>
<%@ Register Src="UserControls/LatestNews.ascx" TagName="LatestNews" TagPrefix="uc4" %>
<%@ Register Src="UserControls/LatestVideo.ascx" TagName="LatestVideo" TagPrefix="uc5" %>
<%@ Register Src="UserControls/Shehjar_Cat.ascx" TagName="Shehjar_Cat" TagPrefix="uc6" %>
<%@ Register Src="UserControls/OngoingProjects.ascx" TagName="OngoingProjects" TagPrefix="uc7" %>
<%@ Register Src="UserControls/topmenu.ascx" TagName="topmenu" TagPrefix="uc8" %>
<%@ Register Src="UserControls/footer.ascx" TagName="footer" TagPrefix="uc9" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb">

                                            <head runat="server">

                                                <link rel="shortcut icon" href="images/logo.png">
                                                <title>Ehsaase-e-Insaniyat Trust</title>

                                                <link rel="stylesheet" href="css/joom_settings.css" type="text/css" />
                                                <link rel="stylesheet" href="css/joomgallery.css" type="text/css" />
                                                <link rel="stylesheet" href="css/jquery.fancybox.css" type="text/css" />
                                                <link rel="stylesheet" href="css/jquery.fancybox-buttons.css" type="text/css" />
                                                <link rel="stylesheet" href="css/jquery.fancybox-thumbs.css" type="text/css" />
                                                <link rel="stylesheet" href="css/template.css" type="text/css" />
                                                <link rel="stylesheet" href="css/all-hovers.css" type="text/css" />
                                                <link rel="stylesheet" href="css/lrstyle.css" type="text/css" />
                                                <link rel="stylesheet" href="css/module_default.css?v=1415026638" type="text/css" />
                                                <link rel="stylesheet" href="css/modal.css" type="text/css" />
                                                <link rel="stylesheet" href="css/caroufredsel.css" type="text/css" />
                                                <link rel="stylesheet" href="css/camera.css" type="text/css" />
                                                <link rel="stylesheet" href="css/default_icemegamenu.css" type="text/css" />
                                                <link rel="stylesheet" href="css/default_icemegamenu-reponsive.css" type="text/css" />

                                                <script src="js/plusone.js" type="text/javascript"></script>
                                                <script src="js/jquery.min.js" type="text/javascript"></script>
                                                <script src="js/jquery-noconflict.js" type="text/javascript"></script>
                                                <script src="js/jquery-migrate.min.js" type="text/javascript"></script>
                                                <script src="js/caption.js" type="text/javascript"></script>
                                                <script src="js/bootstrap.min.js" type="text/javascript"></script>
                                                <script src="js/mootools-core.js" type="text/javascript"></script>
                                                <script src="js/core.js" type="text/javascript"></script>
                                                <script src="js/mootools-more.js" type="text/javascript"></script>
                                                <script src="js/modal.js" type="text/javascript"></script>
                                                <script src="js/jquery.caroufredsel.js" type="text/javascript"></script>
                                                <script src="js/camera.min.js" type="text/javascript"></script>
                                                <script type="text/javascript">
                                                    jQuery(window).on('load', function () {
                                                        new JCaption('img.caption');
                                                    });
                                                    window.setInterval(function () {
                                                        var r;
                                                        try {
                                                            r = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP")
                                                        } catch (e) { }
                                                        if (r) {
                                                            r.open("GET", "./", true);
                                                            r.send(null)
                                                        }
                                                    }, 840000);
                                                    jQuery(document).ready(function () {
                                                        jQuery('.hasTooltip').tooltip({
                                                            "html": true,
                                                            "container": "body"
                                                        });
                                                    });
                                                    jQuery(function ($) {
                                                        SqueezeBox.initialize({});
                                                        SqueezeBox.assign($('a.modal').get(), {
                                                            parse: 'rel'
                                                        });
                                                    });
                                                </script>
                                                <script type="text/javascript" src="js/tmlazyload.js"></script>
                                                <script type='text/javascript' src='https://www.google.com/jsapi?key='></script>
                                                <script type='text/javascript' src='https://www.google.com/uds/?file=earth&amp;v=1'></script>
                                                <script type='text/javascript' src='js/googleearth.js'></script>
                                                <script type='text/javascript' src='js/googlemapsv3.js'></script>

                                                <script type="text/javascript">
                                                    jQuery(function ($) {
                                                        $("img.lazy").lazy({
                                                            threshold: 0,
                                                            visibleOnly: false,
                                                            effect: "fadeIn",
                                                            effectTime: 500,
                                                            enableThrottle: true,
                                                            throttle: 500,
                                                            afterLoad: function (element) {
                                                                if (typeof $.fn.BlackAndWhite_init == "function") {
                                                                    jQuery(element).parents(".item_img a .lazy_container").BlackAndWhite_init();
                                                                }
                                                                setTimeout(function () {
                                                                    element.parent(".lazy_container").addClass("lazyloaded");
                                                                }, 500)
                                                            }
                                                        });
                                                    });

                                                </script>

                                                    <script>
                                                        jQuery(window).on('load', function () {
                                                            if (jQuery(this).mousewheel) {
                                                                jQuery(this).mousewheel(handle);
                                                                jQuery("body").mousewheel(handle);
                                                            }
                                                        });

                                                        function handle(turn, delta) {
                                                            var time = 430;
                                                            var distance = 400;

                                                            jQuery('html, body').stop().animate({

                                                                scrollTop: jQuery(window).scrollTop() - (distance * delta)

                                                            }, time);

                                                            return true;
                                                        }
                                                </script>

                                            </head>

                                            <body class="com_content view-category task- itemid-134 body__">
                                                
                                                    <!-- Body -->
                                                    <div id="wrapper">
                                                        <div class="wrapper-inner">
                                                            <!-- Top -->
                                                            <div id="top-row" style="background-color:#00A6D6">
                                                                <div class="row-container">
                                                                    <div class="container">
                                                                        <uc8:topmenu ID="topmenu1" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Header -->
                                                            <div id="header-row">
                                                                <div class="row-container">
                                                                    <div class="container">
                                                                        <header>
                                                                            <div class="row">
                                                                                <!-- Logo -->
                                                                                <div id="logo" class="span4a">
                                                                                    <a href="Default.aspx">
                                                                                        <img src="images/logo.png" alt="Orphan Care" width="100px">
                                                                                        <h1>Ehsaase-e-Insaniyat Trust</h1>
                                                                                        <span class="hightlight"></span>
                                                                                    </a>
                                                                                </div>

                                                                                <div class="moduletable   span8a">
                                                                                    <div class="icemegamenu">
                                                                                        <div class="ice-megamenu-toggle">
                                                                                            <a data-toggle="collapse" data-target=".nav-collapse">Menu</a>
                                                                                        </div>
                                                                                        <div class="nav-collapse icemegamenu collapse  " style="float:right">

                                                                                            <ul id="icemegamenu" class="meganizr mzr-slide mzr-responsive">

                                                                                                <uc2:mainmenu ID="mainmenu1" runat="server" />

                                                                                            </ul>

                                                                                        </div>
                                                                                    </div>

                                                                                    <script>
                                                                                        jQuery(function ($) {
                                                                                            $('#icemegamenu li.parent[class^="iceMenuLiLevel"]').hover(function () {
                                                                                                $('#icemegamenu li.parent[class^="iceMenuLiLevel"]').not($(this).parents('li')).not($(this)).removeClass('hover');
                                                                                                $(this).addClass('hover').attr('data-hover', 'true')
                                                                                                $(this).find('>ul.icesubMenu').addClass('visible')
                                                                                            },
                                                                                                function () {
                                                                                                    $(this).attr('data-hover', 'false')
                                                                                                    $(this).delay(800).queue(function (n) {
                                                                                                        if ($(this).attr('data-hover') == 'false') {
                                                                                                            $(this).removeClass('hover').delay(250).queue(function (n) {
                                                                                                                if ($(this).attr('data-hover') == 'false') {
                                                                                                                    $(this).find('>ul.icesubMenu').removeClass('visible')
                                                                                                                }
                                                                                                                n();
                                                                                                            });
                                                                                                        }
                                                                                                        n();
                                                                                                    })
                                                                                                })
                                                                                            var ismobile = navigator.userAgent.match(/(iPhone)|(iPod)|(iPad)|(android)|(webOS)/i)
                                                                                            if (ismobile && screen.width > 767) {
                                                                                                $('#icemegamenu').sftouchscreen();
                                                                                            }
                                                                                            $(window).load(function () {
                                                                                                $('#icemegamenu').parents('[id*="-row"]').scrollToFixed({
                                                                                                    minWidth: 768
                                                                                                });
                                                                                            })
                                                                                        });
                                                                                    </script>

                                                                                    <script type="text/javascript">
                                                                                        jQuery(document).ready(function () {
                                                                                            var browser_width1 = jQuery(window).width();
                                                                                            jQuery("#icemegamenu").find(".icesubMenu").each(function (index) {
                                                                                                var offset1 = jQuery(this).offset();
                                                                                                var xwidth1 = offset1.left + jQuery(this).width();
                                                                                                if (xwidth1 >= browser_width1) {
                                                                                                    jQuery(this).addClass("ice_righttoleft");
                                                                                                }
                                                                                            });
                                                                                        })
                                                                                        jQuery(window).resize(function () {
                                                                                            var browser_width = jQuery(window).width();
                                                                                            jQuery("#icemegamenu").find(".icesubMenu").removeClass("ice_righttoleft");
                                                                                            jQuery("#icemegamenu").find(".icesubMenu").each(function (index) {
                                                                                                var offset = jQuery(this).offset();
                                                                                                var xwidth = offset.left + jQuery(this).width();

                                                                                                if (xwidth >= browser_width) {
                                                                                                    jQuery(this).addClass("ice_righttoleft");
                                                                                                }
                                                                                            });
                                                                                        });
                                                                                    </script>

                                                                                </div>
                                                                            </div>
                                                                        </header>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                            <!-- Maintop -->

                                                                <link rel="stylesheet" href="css/donate.css" />
                                                                <script type="text/javascript" src="js/jquery.jqtransform.js"></script>
                                                                <div id="showcase-row">

                                                                    <div class="moduletable ">

                                                                        <img src="images/Donation.jpg" width="100%">

                                                                    </div>

                                                                </div>

                                                                <div id="content-row">
                                                                    <div class="row-container">
                                                                        <div class="container">
                                                                            <div class="content-inner row">

                                                                                <div id="component" class="span12">
                                                                                    <main role="main">

                                                                                        <!-- Content-top -->
                                                                                        <div id="content-top-row" class="row">
                                                                                            <div id="content-top">
                                                                                                <div class="moduletable   span8">
                                                                                                  <header><h3 class="moduleTitle">
                                                                                                  <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                                                                                                      Donation
                                                                                                  </span></h3></header>
                                                                                                    <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">
                                                                                                        <%--<form id="formwithout" method="post" action="donaterequest.aspx">--%>
                                                                                                        <form id="formwithout" method="post" class="search-form" enctype="multipart/form-data">
                                                                                                            <fieldset>
                                                                                                            <input type="hidden" name="merchant_id" id="merchant_id" value="179737"/>
                                                                                                            <input type="hidden" name="order_id" value="<% Response.Write(RandomDigits(10)); %>"/>
                                                                                                            <input type="hidden" name="redirect_url" value="http://localhost:49493/HelpFoundation_PaymentGatway/donateresponse.aspx"/>
                                                                                                            <input type="hidden" name="cancel_url" value="http://localhost:49493/HelpFoundation_PaymentGatway/donate.aspx"/>
                                                                                                            <ul class="form-sec-inner">
                                                                                                                <li>
                                                                                                                    <ul class="regis-form-sec">

                                                                                                                        <li><strong>Choose Donor Type*</strong></li>

                                                                                                                        <li class="Currency">
                                                                                                                            <div class="dispaly-inline post">
                                                                                                                                <span class="select-sec jqTransformSelectWrapper-nation" id="selected-currency">
                                                                                                                                    <select name="merchant_param2" id="merchant_param2">
						                                                                                                            <option value="INDIAN" >INDIAN DONOR</option>	
						                                                                                                            <option value="NRI" >NRI</option>	
						                                                                                                            <option value="FOREIGNER" >FOREIGNER</option>	
					                                                                                                                </select>
                                                                                                                                </span>
                                                                                                                            </div>
                                                                                                                            <input type="text" name="amount" id="amount" value="Amount" maxlength="10" onfocus="if(this.value=='Amount') this.value ='';" onblur="if(this.value=='') this.value='Amount';" />
                                                                                                                        </li>

                                                                                                                         <li><strong>Choose Currency*</strong></li>
                                                                                                                         <li class="CurrencyType">
                                                                                                                            <div class="dispaly-inline post">
                                                                                                                                <span class="select-sec jqTransformSelectWrapper-nation" id="selected-merchant_param2">
                                                                                                                                   <select name="currency" id="currency">
						                                                                                                           <option value="INR">INDIAN RUPEE (INR)</option>	
						                                                                                                           <option value="FOREIGN" >FOREIGN</option>	
					                                                                                                               </select>
                                                                                                                                </span>
                                                                                                                            </div>
                                                                                                                         </li>


                                                                                                                           <li><strong>PURPOSE OF DONATION*</strong></li>
                                                                                                                           <li class="national">

                                                                                                                                <div class="dispaly-inline post">
                                                                                                                                    <span class="select-sec jqTransformSelectWrapper-nation" id="selected-PURPOSEDONATION" >
                                                                                                                                    <select name="merchant_param3" id="PURPOSEDONATION" onchange="disable_Bank_Exam(this)">
                                                                                                                                        <option value="Health">Health Care</option>
                                                                                                                                        <option value="Education">Education</option>
                                                                                                                                        <option value="Livelihoods">Livelihoods</option>
                                                                                                                                        <option value="Disaster">Disaster Relief</option>
                                                                                                                                        <option value="Charity">Charity</option>
                                                                                                                                    </select>
                                                                                                                                    </span>
                                                                                                                                </div>

                                                                                                                                 <select name="merchant_param4" id="ddlPurpose" disabled="false">
														                                                                            <option value="Religious">Religious </option>	
														                                                                            <option value="Social">Social</option>	
														                                                                            <option value="Economic">Economic</option>	
						                                                                                                         </select>
                                                                                                                                  
                                                                                                                                <script>
                                                                                                                                    function disable_Bank_Exam(v) {
                                                                                                                                        if (v.value == 'Charity') {
                                                                                                                                            ddlPurpose.disabled = false;
                                                                                                                                        }
                                                                                                                                        else {
                                                                                                                                            ddlPurpose.disabled = true;
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                 </script>
                                                                                                                              
                                                                                                                        </li>

                                                                                                                        <li><strong>Please enter your Mailling Address</strong></li>
                                                                                                                        <li>
                                                                                                                            <input type="text" name="billing_name" id="fname" value="First Name" maxlength="30" onfocus="if(this.value=='First Name') this.value ='';" onblur="if(this.value=='') this.value='First Name';" />
                                                                                                                            <input type="text" name="billing_name" id="lname" value="Last Name" maxlength="30" onfocus="if(this.value=='Last Name') this.value ='';" onblur="if(this.value=='') this.value='Last Name';" />
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                            <input type="text" name="billing_email" id="email_id" value="Email Address" maxlength="40" onfocus="if(this.value=='Email Address') this.value ='';" onblur="if(this.value=='') this.value='Email Address';" />
                                                                                                                            <input type="text" name="billing_tel" id="phone" value="Telephone" maxlength="10" onfocus="if(this.value=='Telephone') this.value ='';" onblur="if(this.value=='') this.value='Telephone';" />
                                                                                                                        </li>

                                                                                                                        <li class="national">
                                                                                                                            <textarea name="billing_address" id="address" value="Address" onfocus="if(this.value=='Address') this.value ='';" onblur="if(this.value=='') this.value='Address';" class="dispaly-inline">Address</textarea>
                                                                                                                            <input type="text" name="billing_city" id="txtcity" value="City" maxlength="15" onfocus="if(this.value=='City') this.value ='';" onblur="if(this.value=='') this.value='City';" />
                                                                                                                            
                                                                                                                        </li>
                                                                                                                         <li class="dob">                                                                                                                             
                                                                                                                             <div>
                                                                                                                                <input type="text" name="billing_state" id="txtstate" value="State" style="width:200px;" onfocus="if(this.value=='State') this.value ='';" onblur="if(this.value=='') this.value='State';" />
                                                                                                                               </div>
                                                                                                                             <div>
                                                                                                                                  <input type="text" name="billing_zip" id="txtzip" value="Zip" style="width:200px;" style="width:200px;" onfocus="if(this.value=='Zip') this.value ='';" onblur="if(this.value=='') this.value='Zip';" />
                                                                                                                             </div>
                                                                                                                             <div class="dispaly-inline post">
                                                                                                                                <input type="text" name="merchant_param1" id="panno" value="PAN No." maxlength="10" onfocus="if(this.value=='PAN No.') this.value ='';" onblur="if(this.value=='') this.value='PAN No.';" />
                                                                                                                                <p> (Please note that tax examption as per law is only available if PAN is quoted) </p>
                                                                                                                            </div>
                                                                                                                             
                                                                                                                         </li>

                                                                                                                        <li class="dob">
                                                                                                                            <div>
                                                                                                                                <label>Date of Birth</label>
                                                                                                                                <span class="select-sec jqTransformSelectWrapper-date">        
                                                                                                                                      <select name="merchant_param5" id="bd">
                                                                                                                                       <option value="none">Select Date</option>
               				                                                                                                                        <option value="1">1</option>
								                                                                                                                        <option value="2">2</option>
								                                                                                                                        <option value="3">3</option>
								                                                                                                                        <option value="4">4</option>
								                                                                                                                        <option value="5">5</option>
								                                                                                                                        <option value="6">6</option>
								                                                                                                                        <option value="7">7</option>
								                                                                                                                        <option value="8">8</option>
								                                                                                                                        <option value="9">9</option>
								                                                                                                                        <option value="10">10</option>
								                                                                                                                        <option value="11">11</option>
								                                                                                                                        <option value="12">12</option>
								                                                                                                                        <option value="13">13</option>
								                                                                                                                        <option value="14">14</option>
								                                                                                                                        <option value="15">15</option>
								                                                                                                                        <option value="16">16</option>
								                                                                                                                        <option value="17">17</option>
								                                                                                                                        <option value="18">18</option>
								                                                                                                                        <option value="19">19</option>
								                                                                                                                        <option value="20">20</option>
								                                                                                                                        <option value="21">21</option>
								                                                                                                                        <option value="22">22</option>
								                                                                                                                        <option value="23">23</option>
								                                                                                                                        <option value="24">24</option>
								                                                                                                                        <option value="25">25</option>
								                                                                                                                        <option value="26">26</option>
								                                                                                                                        <option value="27">27</option>
								                                                                                                                        <option value="28">28</option>
								                                                                                                                        <option value="29">29</option>
								                                                                                                                        <option value="30">30</option>
								                                                                                                                        <option value="31">31</option>
				                                                                                                                                      </select>
                                                                                                                                   </span>
                                                                                                                            </div>

                                                                                                                            <div>
                                                                                                                                <!--<label>Month</label>-->
                                                                                                                                <span class="select-sec jqTransformSelectWrapper-date">        
                                                                                                                                   <select name="merchant_param6" id="bm">
                                                                                                                                   <option value="none">Select Month</option>
               				                                                                                                                    <option value="1">January</option>
								                                                                                                                    <option value="2">February</option>
								                                                                                                                    <option value="3">March</option>
								                                                                                                                    <option value="4">April</option>
								                                                                                                                    <option value="5">May</option>
								                                                                                                                    <option value="6">June</option>
								                                                                                                                    <option value="7">July</option>
								                                                                                                                    <option value="8">August</option>
								                                                                                                                    <option value="9">September</option>
								                                                                                                                    <option value="10">October</option>
								                                                                                                                    <option value="11">November</option>
								                                                                                                                    <option value="12">December</option>
				                                                                                                                                  </select>
                                                                                                                               </span>
                                                                                                                            </div>

                                                                                                                            <div>
                                                                                                                                <!--<label>Year</label>-->
                                                                                                                                <span class="select-sec jqTransformSelectWrapper-date">        
                                                                                                                                      <select name="merchant_param7" id="by">
                                                                                                                                       <option value="none">Select Year</option>
               				                                                                                                                        <option value="1900">1900</option>
								                                                                                                                        <option value="1901">1901</option>
								                                                                                                                        <option value="1902">1902</option>
								                                                                                                                        <option value="1903">1903</option>
								                                                                                                                        <option value="1904">1904</option>
								                                                                                                                        <option value="1905">1905</option>
								                                                                                                                        <option value="1906">1906</option>
								                                                                                                                        <option value="1907">1907</option>
								                                                                                                                        <option value="1908">1908</option>
								                                                                                                                        <option value="1909">1909</option>
								                                                                                                                        <option value="1910">1910</option>
								                                                                                                                        <option value="1911">1911</option>
								                                                                                                                        <option value="1912">1912</option>
								                                                                                                                        <option value="1913">1913</option>
								                                                                                                                        <option value="1914">1914</option>
								                                                                                                                        <option value="1915">1915</option>
								                                                                                                                        <option value="1916">1916</option>
								                                                                                                                        <option value="1917">1917</option>
								                                                                                                                        <option value="1918">1918</option>
								                                                                                                                        <option value="1919">1919</option>
								                                                                                                                        <option value="1920">1920</option>
								                                                                                                                        <option value="1921">1921</option>
								                                                                                                                        <option value="1922">1922</option>
								                                                                                                                        <option value="1923">1923</option>
								                                                                                                                        <option value="1924">1924</option>
								                                                                                                                        <option value="1925">1925</option>
								                                                                                                                        <option value="1926">1926</option>
								                                                                                                                        <option value="1927">1927</option>
								                                                                                                                        <option value="1928">1928</option>
								                                                                                                                        <option value="1929">1929</option>
								                                                                                                                        <option value="1930">1930</option>
								                                                                                                                        <option value="1931">1931</option>
								                                                                                                                        <option value="1932">1932</option>
								                                                                                                                        <option value="1933">1933</option>
								                                                                                                                        <option value="1934">1934</option>
								                                                                                                                        <option value="1935">1935</option>
								                                                                                                                        <option value="1936">1936</option>
								                                                                                                                        <option value="1937">1937</option>
								                                                                                                                        <option value="1938">1938</option>
								                                                                                                                        <option value="1939">1939</option>
								                                                                                                                        <option value="1940">1940</option>
								                                                                                                                        <option value="1941">1941</option>
								                                                                                                                        <option value="1942">1942</option>
								                                                                                                                        <option value="1943">1943</option>
								                                                                                                                        <option value="1944">1944</option>
								                                                                                                                        <option value="1945">1945</option>
								                                                                                                                        <option value="1946">1946</option>
								                                                                                                                        <option value="1947">1947</option>
								                                                                                                                        <option value="1948">1948</option>
								                                                                                                                        <option value="1949">1949</option>
								                                                                                                                        <option value="1950">1950</option>
								                                                                                                                        <option value="1951">1951</option>
								                                                                                                                        <option value="1952">1952</option>
								                                                                                                                        <option value="1953">1953</option>
								                                                                                                                        <option value="1954">1954</option>
								                                                                                                                        <option value="1955">1955</option>
								                                                                                                                        <option value="1956">1956</option>
								                                                                                                                        <option value="1957">1957</option>
								                                                                                                                        <option value="1958">1958</option>
								                                                                                                                        <option value="1959">1959</option>
								                                                                                                                        <option value="1960">1960</option>
								                                                                                                                        <option value="1961">1961</option>
								                                                                                                                        <option value="1962">1962</option>
								                                                                                                                        <option value="1963">1963</option>
								                                                                                                                        <option value="1964">1964</option>
								                                                                                                                        <option value="1965">1965</option>
								                                                                                                                        <option value="1966">1966</option>
								                                                                                                                        <option value="1967">1967</option>
								                                                                                                                        <option value="1968">1968</option>
								                                                                                                                        <option value="1969">1969</option>
								                                                                                                                        <option value="1970">1970</option>
								                                                                                                                        <option value="1971">1971</option>
								                                                                                                                        <option value="1972">1972</option>
								                                                                                                                        <option value="1973">1973</option>
								                                                                                                                        <option value="1974">1974</option>
								                                                                                                                        <option value="1975">1975</option>
								                                                                                                                        <option value="1976">1976</option>
								                                                                                                                        <option value="1977">1977</option>
								                                                                                                                        <option value="1978">1978</option>
								                                                                                                                        <option value="1979">1979</option>
								                                                                                                                        <option value="1980">1980</option>
								                                                                                                                        <option value="1981">1981</option>
								                                                                                                                        <option value="1982">1982</option>
								                                                                                                                        <option value="1983">1983</option>
								                                                                                                                        <option value="1984">1984</option>
								                                                                                                                        <option value="1985">1985</option>
								                                                                                                                        <option value="1986">1986</option>
								                                                                                                                        <option value="1987">1987</option>
								                                                                                                                        <option value="1988">1988</option>
								                                                                                                                        <option value="1989">1989</option>
								                                                                                                                        <option value="1990">1990</option>
								                                                                                                                        <option value="1991">1991</option>
								                                                                                                                        <option value="1992">1992</option>
								                                                                                                                        <option value="1993">1993</option>
								                                                                                                                        <option value="1994">1994</option>
								                                                                                                                        <option value="1995">1995</option>
								                                                                                                                        <option value="1996">1996</option>
								                                                                                                                        <option value="1997">1997</option>
								                                                                                                                        <option value="1998">1998</option>
								                                                                                                                        <option value="1999">1999</option>
								                                                                                                                        <option value="2000">2000</option>
								                                                                                                                        <option value="2001">2001</option>
								                                                                                                                        <option value="2002">2002</option>
								                                                                                                                        <option value="2003">2003</option>
								                                                                                                                        <option value="2004">2004</option>
								                                                                                                                        <option value="2005">2005</option>
								                                                                                                                        <option value="2006">2006</option>
				                                                                                                                                      </select>
                                                                                                                                   </span>
                                                                                                                            </div>
                                                                                                                        </li>

                                                                                                                         <li class="national">
                                                                                                                            <div class="dispaly-inline post">
						                                                                                                      <select name="billing_country" id="nationality">
							                                                                                                      <option value="none" selected="selected">Passport</option>
														                                                                            <option value="India">India</option>	
														                                                                            <option value="Afghanistan">Afghanistan</option>	
														                                                                            <option value="Albania">Albania</option>	
														                                                                            <option value="Algeria">Algeria</option>	
														                                                                            <option value="American Samoa">American Samoa</option>	
														                                                                            <option value="Andorra">Andorra</option>	
														                                                                            <option value="Angola">Angola</option>	
														                                                                            <option value="Anguilla">Anguilla</option>	
														                                                                            <option value="Antarctica">Antarctica</option>	
														                                                                            <option value=">Antigua and Barbuda">Antigua and Barbuda</option>	
														                                                                            <option value="Argentina">Argentina</option>	
														                                                                            <option value="Armenia">Armenia</option>	
														                                                                            <option value="Aruba">Aruba</option>	
														                                                                            <option value="Australia">Australia</option>	
														                                                                            <option value="Austria">Austria</option>	
														                                                                            <option value="Azerbaijan">Azerbaijan</option>	
														                                                                            <option value="Bahamas">Bahamas</option>	
														                                                                            <option value="Bahrain">Bahrain</option>	
														                                                                            <option value="Bangladesh">Bangladesh</option>	
														                                                                            <option value="Barbados">Barbados</option>	
														                                                                            <option value="Belarus">Belarus</option>	
														                                                                            <option value="Belgium">Belgium</option>	
														                                                                            <option value="Belize">Belize</option>	
														                                                                            <option value="Benin">Benin</option>	
														                                                                            <option value="Bermuda">Bermuda</option>	
														                                                                            <option value="Bhutan">Bhutan</option>	
														                                                                            <option value="Bolivia">Bolivia</option>	
														                                                                            <option value="Bosnia and Herzegowina">Bosnia and Herzegowina</option>	
														                                                                            <option value="Botswana">Botswana</option>	
														                                                                            <option value="Bouvet Island">Bouvet Island</option>	
														                                                                            <option value="Brazil">Brazil</option>	
														                                                                            <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>	
														                                                                            <option value="Brunei Darussalam">Brunei Darussalam</option>	
														                                                                            <option value="Bulgaria">Bulgaria</option>	
														                                                                            <option value="Burkina Faso">Burkina Faso</option>	
														                                                                            <option value="Burundi">Burundi</option>	
														                                                                            <option value="Cambodia">Cambodia</option>	
														                                                                            <option value="Cameroon">Cameroon</option>	
														                                                                            <option value="Canada">Canada</option>	
														                                                                            <option value="Cape Verde">Cape Verde</option>	
														                                                                            <option value="Cayman Islands">Cayman Islands</option>	
														                                                                            <option value="Central African Republic">Central African Republic</option>	
														                                                                            <option value="Chad">Chad</option>	
														                                                                            <option value="Chile">Chile</option>	
														                                                                            <option value="China">China</option>	
														                                                                            <option value="Christmas Island">Christmas Island</option>	
														                                                                            <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>	
														                                                                            <option value="Colombia">Colombia</option>	
														                                                                            <option value="Comoros">Comoros</option>	
														                                                                            <option value="Congo">Congo</option>	
														                                                                            <option value="Cook Islands">Cook Islands</option>	
														                                                                            <option value=">Costa Rica">Costa Rica</option>	
														                                                                            <option value="Croatia">Croatia</option>	
														                                                                            <option value="Cuba">Cuba</option>	
														                                                                            <option value="Cyprus">Cyprus</option>	
														                                                                            <option value="Czech Republic">Czech Republic</option>	
														                                                                            <option value="Denmark">Denmark</option>	
														                                                                            <option value="Djibouti">Djibouti</option>	
														                                                                            <option value="Dominica">Dominica</option>	
														                                                                            <option value="Dominican Republic">Dominican Republic</option>	
														                                                                            <option value="East Timor">East Timor</option>	
														                                                                            <option value="Ecuador">Ecuador</option>	
														                                                                            <option value="Egypt">Egypt</option>	
														                                                                            <option value="El Salvador">El Salvador</option>	
														                                                                            <option value="Equatorial Guinea">Equatorial Guinea</option>	
														                                                                            <option value="Eritrea">Eritrea</option>	
														                                                                            <option value="Estonia">Estonia</option>	
														                                                                            <option value="Ethiopia">Ethiopia</option>	
														                                                                            <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>	
														                                                                            <option value="Faroe Islands">Faroe Islands</option>	
														                                                                            <option value="Fiji">Fiji</option>	
														                                                                            <option value="Finland">Finland</option>	
														                                                                            <option value="France">France</option>	
														                                                                            <option value="France, Metropolitan">France, Metropolitan</option>	
														                                                                            <option value="French Guiana">French Guiana</option>	
														                                                                            <option value="French Polynesia">French Polynesia</option>	
														                                                                            <option value="French Southern Territories">French Southern Territories</option>	
														                                                                            <option value="Gabon">Gabon</option>	
														                                                                            <option value="Gambia">Gambia</option>	
														                                                                            <option value="Georgia">Georgia</option>	
														                                                                            <option value="Germany">Germany</option>	
														                                                                            <option value="Ghana">Ghana</option>	
														                                                                            <option value="Gibraltar">Gibraltar</option>	
														                                                                            <option value="Greece">Greece</option>	
														                                                                            <option value="Greenland">Greenland</option>	
														                                                                            <option value="Grenada">Grenada</option>	
														                                                                            <option value="Guadeloupe">Guadeloupe</option>	
														                                                                            <option value="Guam">Guam</option>	
														                                                                            <option value="Guatemala">Guatemala</option>	
														                                                                            <option value="Guinea">Guinea</option>	
														                                                                            <option value="Guinea-bissau">Guinea-bissau</option>	
														                                                                            <option value="Guyana">Guyana</option>	
														                                                                            <option value="Haiti">Haiti</option>	
														                                                                            <option value="Heard and Mc Donald Islands">Heard and Mc Donald Islands</option>	
														                                                                            <option value="Honduras">Honduras</option>	
														                                                                            <option value="Hong Kong">Hong Kong</option>	
														                                                                            <option value="Hungary">Hungary</option>	
														                                                                            <option value="Iceland">Iceland</option>	
														                                                                            <option value="Indonesia">Indonesia</option>	
														                                                                            <option value="Iran">Iran (Islamic Republic of)</option>	
														                                                                            <option value="Iraq">Iraq</option>	
														                                                                            <option value="Ireland">Ireland</option>	
														                                                                            <option value="Israel">Israel</option>	
														                                                                            <option value="Italy">Italy</option>	
														                                                                            <option value="Jamaica">Jamaica</option>	
														                                                                            <option value="Japan">Japan</option>	
														                                                                            <option value="Jordan">Jordan</option>	
														                                                                            <option value="Kazakhstan">Kazakhstan</option>	
														                                                                            <option value="Kenya">Kenya</option>	
														                                                                            <option value="Kiribati">Kiribati</option>	
														                                                                            <option value="Korea">Korea</option>	
														                                                                            <option value="Kuwait">Kuwait</option>	
														                                                                            <option value="Kyrgyzstan">Kyrgyzstan</option>	
														                                                                            <option value="Lao">Lao People's Democratic Republic</option>	
														                                                                            <option value="Latvia">Latvia</option>	
														                                                                            <option value="Lebanon">Lebanon</option>	
														                                                                            <option value="Lesotho">Lesotho</option>	
														                                                                            <option value="Liberia">Liberia</option>	
														                                                                            <option value="Libyan">Libyan Arab Jamahiriya</option>	
														                                                                            <option value="Liechtenstein">Liechtenstein</option>	
														                                                                            <option value="Lithuania">Lithuania</option>	
														                                                                            <option value="Luxembourg">Luxembourg</option>	
														                                                                            <option value="Macau">Macau</option>	
														                                                                            <option value="Macedonia">Macedonia, The Former Yugoslav Republic of</option>	
														                                                                            <option value="Madagascar">Madagascar</option>	
														                                                                            <option value="Malawi">Malawi</option>	
														                                                                            <option value="Malaysia">Malaysia</option>	
														                                                                            <option value="Maldives">Maldives</option>	
														                                                                            <option value="Mali">Mali</option>	
														                                                                            <option value="Malta">Malta</option>	
														                                                                            <option value="Marshall Islands">Marshall Islands</option>	
														                                                                            <option value="Martinique">Martinique</option>	
														                                                                            <option value="Mauritania">Mauritania</option>	
														                                                                            <option value="Mauritius">Mauritius</option>	
														                                                                            <option value="Mayotte">Mayotte</option>	
														                                                                            <option value="Mexico">Mexico</option>	
														                                                                            <option value="Micronesia">Micronesia, Federated States of</option>	
														                                                                            <option value="Moldova">Moldova, Republic of</option>	
														                                                                            <option value="Monaco">Monaco</option>	
														                                                                            <option value="Mongolia">Mongolia</option>	
														                                                                            <option value="143">Montserrat</option>	
														                                                                            <option value="Morocco">Morocco</option>	
														                                                                            <option value="Mozambique">Mozambique</option>	
														                                                                            <option value="Myanmar">Myanmar</option>	
														                                                                            <option value="Namibia">Namibia</option>	
														                                                                            <option value="Nauru">Nauru</option>	
														                                                                            <option value="Nepal">Nepal</option>	
														                                                                            <option value="Netherlands">Netherlands</option>	
														                                                                            <option value="Netherlands">Netherlands Antilles</option>	
														                                                                            <option value="New Caledonia">New Caledonia</option>	
														                                                                            <option value="New Zealand">New Zealand</option>	
														                                                                            <option value="Nicaragua">Nicaragua</option>	
														                                                                            <option value="Niger">Niger</option>	
														                                                                            <option value="Nigeria">Nigeria</option>	
														                                                                            <option value="Niue">Niue</option>	
														                                                                            <option value="Norfolk Island">Norfolk Island</option>	
														                                                                            <option value="Northern Mariana Islands">Northern Mariana Islands</option>	
														                                                                            <option value="Norway">Norway</option>	
														                                                                            <option value="Oman">Oman</option>	
														                                                                            <option value="Pakistan">Pakistan</option>	
														                                                                            <option value="Palau">Palau</option>	
														                                                                            <option value="Panama">Panama</option>	
														                                                                            <option value="Papua New Guinea">Papua New Guinea</option>	
														                                                                            <option value="Paraguay">Paraguay</option>	
														                                                                            <option value="Peru">Peru</option>	
														                                                                            <option value="Philippines">Philippines</option>	
														                                                                            <option value="Pitcairn">Pitcairn</option>	
														                                                                            <option value="Poland">Poland</option>	
														                                                                            <option value="Portugal">Portugal</option>	
														                                                                            <option value="Puerto Rico">Puerto Rico</option>	
														                                                                            <option value="Qatar">Qatar</option>	
														                                                                            <option value="Reunion">Reunion</option>	
														                                                                            <option value="Romania">Romania</option>	
														                                                                            <option value="Russian Federation">Russian Federation</option>	
														                                                                            <option value="Rwanda">Rwanda</option>	
														                                                                            <option value="Saint Kitts">Saint Kitts and Nevis</option>	
														                                                                            <option value="Saint Lucia">Saint Lucia</option>	
														                                                                            <option value="Saint Vincent">Saint Vincent and the Grenadines</option>	
														                                                                            <option value="Samoa">Samoa</option>	
														                                                                            <option value="San Marino">San Marino</option>	
														                                                                            <option value="Sao Tome">Sao Tome and Principe</option>	
														                                                                            <option value="Saudi Arabia">Saudi Arabia</option>	
														                                                                            <option value="Senegal">Senegal</option>	
														                                                                            <option value="Seychelles">Seychelles</option>	
														                                                                            <option value="Sierra Leone">Sierra Leone</option>	
														                                                                            <option value="Singapore">Singapore</option>	
														                                                                            <option value="Slovakia">Slovakia (Slovak Republic)</option>	
														                                                                            <option value="Slovenia">Slovenia</option>	
														                                                                            <option value="Solomon Islands">Solomon Islands</option>	
														                                                                            <option value="Somalia">Somalia</option>	
														                                                                            <option value="South Africa">South Africa</option>	
														                                                                            <option value="South Georgia">South Georgia and the South Sandwich Islands</option>	
														                                                                            <option value="Spain">Spain</option>	
														                                                                            <option value="Sri Lanka">Sri Lanka</option>	
														                                                                            <option value="St. Helen">St. Helena</option>	
														                                                                            <option value="St. Pierre">St. Pierre and Miquelon</option>	
														                                                                            <option value="Sudan">Sudan</option>	
														                                                                            <option value="Suriname">Suriname</option>	
														                                                                            <option value="Svalbard">Svalbard and Jan Mayen Islands</option>	
														                                                                            <option value="Swaziland">Swaziland</option>	
														                                                                            <option value="Sweden">Sweden</option>	
														                                                                            <option value="Switzerland">Switzerland</option>	
														                                                                            <option value="Syria">Syrian Arab Republic</option>	
														                                                                            <option value="Taiwan">Taiwan</option>	
														                                                                            <option value="Tajikistan">Tajikistan</option>	
														                                                                            <option value="Tanzania">Tanzania, United Republic of</option>	
														                                                                            <option value="Thailand">Thailand</option>	
														                                                                            <option value="Togo">Togo</option>	
														                                                                            <option value="Tokelau">Tokelau</option>	
														                                                                            <option value="Tonga">Tonga</option>	
														                                                                            <option value="Trinidad and Tobago">Trinidad and Tobago</option>	
														                                                                            <option value="Tunisia">Tunisia</option>	
														                                                                            <option value="Turkey">Turkey</option>	
														                                                                            <option value="Turkmenistan">Turkmenistan</option>	
														                                                                            <option value="Turks">Turks and Caicos Islands</option>	
														                                                                            <option value="Tuvalu">Tuvalu</option>	
														                                                                            <option value="Uganda">Uganda</option>	
														                                                                            <option value="Ukraine">Ukraine</option>	
														                                                                            <option value="United Arab Emirates">United Arab Emirates</option>	
														                                                                            <option value="United Kingdom">United Kingdom</option>	
														                                                                            <option value="United States">United States</option>	
														                                                                            <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>	
														                                                                            <option value="Uruguay">Uruguay</option>	
														                                                                            <option value="Uzbekistan">Uzbekistan</option>	
														                                                                            <option value="Vanuatu">Vanuatu</option>	
														                                                                            <option value="Vatican City">Vatican City State (Holy See)</option>	
														                                                                            <option value="Venezuela">Venezuela</option>	
														                                                                            <option value="Viet Nam">Viet Nam</option>	
														                                                                            <option value="Virgin Islands (British)">Virgin Islands (British)</option>	
														                                                                            <option value="2Virgin Islands (U.S.)32">Virgin Islands (U.S.)</option>	
														                                                                            <option value=">Wallis and Futuna Islands">Wallis and Futuna Islands</option>	
														                                                                            <option value="Western Sahara">Western Sahara</option>	
														                                                                            <option value="Yemen">Yemen</option>	
														                                                                            <option value="Yugoslavia">Yugoslavia</option>	
														                                                                            <option value="Zaire">Zaire</option>	
														                                                                            <option value="Zambia">Zambia</option>	
														                                                                            <option value="Zimbabwe">Zimbabwe</option>	

						                                                                                                   </select>

                                                                                                                            </div>
                                                                                                                        </li>
                                                                                                                        <li id="lipassport" style="display:none;">
                                                                                                                            <div class="dispaly-inline post">
                                                                                                                                <div class="inputbox uploadpassport" id="divpassport">
                                                                                                                                    <span class="fileinput-upload fileinput-new" data-provides="fileinput">
                                                                                                                                        <span class="btn btn-default btn-file">
                                                                                                                                            <em class="bbtn">Browse..</em>
                                                                                                                                            <em class="fileinput-filename">Upload Passport</em>
                                                                                                                                            <input name="passport" id="passport" type="file">
                                                                                                                                        </span>

                                                                                                                                    </span>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                        </li>

                                                                                                                    </ul>
                                                                                                                    <li>
                                                                                                                        <input type="submit" name="submit" id="btn-donate" value="DONATE" class="dispaly-inline">
                                                                                                                        <input type="hidden" name="token" value="810dd25712b69b3cc6124559afdef372">
                                                                                                                        <div class="cheque-dd-sec dispaly-inline"> <strong class="dispaly-block">Cheque/DD</strong> <span>Please make a Cheque/DD in favour of "Help Foundation" and send to us with your complete address and PAN.  <asp:Literal ID="ltrLinks" runat="server"></asp:Literal></span> 
                                                                                                                        </div>
                                                                                                                    </li>
                                                                                                            </ul>
                                                                                                        </fieldset>
                                                                                                        </form>
                                                                                                        <div class="clearfix"></div>

                                                                                                    </div>
                                                                                                </div>

                                                                                                <uc10:InsideLatestNews ID="InsideLatestNews1" runat="server" />

                                                                                            </div>
                                                                                        </div>

                                                                                        <style>
                                                                                            .lrcounter-horizontal-vertical table {
                                                                                                background: none repeat scroll 0 0 transparent !important;
                                                                                                border: medium none !important;
                                                                                                color: #000000 !important;
                                                                                                margin: 0 !important;
                                                                                                padding: 0 !important;
                                                                                                text-align: left !important;
                                                                                            }

                                                                                                .lrcounter-horizontal-vertical table tr,
                                                                                                .lrcounter-horizontal-vertical table td {
                                                                                                    background: none repeat scroll 0 0 transparent !important;
                                                                                                    border: medium none !important;
                                                                                                    color: #000000 !important;
                                                                                                    display: inline-table;
                                                                                                    margin-left: 4px !important;
                                                                                                    padding: 0 2px !important;
                                                                                                    text-align: left !important;
                                                                                                    vertical-align: bottom !important;
                                                                                                }

                                                                                            iframe,
                                                                                            svg {
                                                                                                max-width: none !important;
                                                                                            }
                                                                                        </style>
                                                                                        <section class="page-category page-category__">
                                                                                        </section>

                                                                                        <!-- Content-bottom -->

                                                                                    </main>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <script type="text/javascript">
                                                                    jQuery(document).ready(function ($) {
                                                                        $(window).load(function () {
                                                                            $('.select-sec').jqTransform({
                                                                                imgPath: 'images/'
                                                                            });
                                                                        });
                                                                    });
                                                                    jQuery(document).ready(function ($) {
                                                                        jQuery("#nationality").change(function () {
                                                                            if (jQuery(this).val() == "India") {
                                                                                jQuery("#lipassport").css("display", "none");
                                                                            }
                                                                            else {
                                                                                jQuery("#lipassport").removeAttr("style");
                                                                            }
                                                                        });
                                                                        jQuery("#btn-donate").on('click', function (event) {
                                                                            event.preventDefault();
                                                                            if (form_validation_without()) {
                                                                                if (confirm("You have chosen your Nationality as " + $("#nationality option:selected").text())) {

                                                                                    var fd = new FormData();
                                                                                    var file_data = jQuery('input[type="file"]')[0].files; // for multiple files
                                                                                    for (var i = 0; i < file_data.length; i++) {
                                                                                        fd.append("file_" + i, file_data[i]);
                                                                                    }
                                                                                    var other_data = jQuery('#formwithout').serializeArray();
                                                                                    jQuery.each(other_data, function (key, input) {
                                                                                        //alert(input.name + "_" + input.value);
                                                                                        fd.append(input.name, input.value);
                                                                                    });

                                                                                    var strurl = "";
                                                                                    if (jQuery('#nationality').val() == "India" && jQuery('#currency').val() == "INR") {
                                                                                        strurl = "donaterequest.aspx";
                                                                                    }
                                                                                    else {
                                                                                        strurl = "donaterequestint.aspx"
                                                                                    }

                                                                                    jQuery.ajax({
                                                                                        url: strurl,
                                                                                        type: "POST",
                                                                                        dataType: "html",
                                                                                        //data: $("#formwithout").serialize(),
                                                                                        cache: false,
                                                                                        data: fd,
                                                                                        contentType: false,
                                                                                        processData: false,
                                                                                        beforeSend: function () {
                                                                                            jQuery("#btn-donate").remove();
                                                                                        },
                                                                                        success: function (response) {
                                                                                            window.location.href = "" + response + "";
                                                                                        }
                                                                                    });
                                                                                }
                                                                            }
                                                                        });
                                                                    });

                                                                    function form_validation_without() {

                                                                        if (jQuery('#nationality').val() == "0" || jQuery('#nationality').val() == 'none') {
                                                                            alert("Please select your nationality to proceed");
                                                                            jQuery('#nationality').focus();
                                                                            return false
                                                                        }


                                                                        if ((jQuery('#amount').val() == "") || (jQuery('#amount').val() == "Amount")) {
                                                                            alert("Please fill the amount to be donated");
                                                                            jQuery('#amount').focus();
                                                                            return false;
                                                                        }

                                                                        if (isNaN(jQuery('#amount').val()) == true) {
                                                                            alert("The donation amount must be numeric");
                                                                            jQuery('#amount').val("");
                                                                            jQuery('#amount').focus();
                                                                            return false;
                                                                        }

                                                                        if ((jQuery('#fname').val() == "") || (jQuery('#fname').val() == "First Name")) {
                                                                            alert("Please enter your First Name");
                                                                            jQuery('#fname').focus();
                                                                            return false;
                                                                        }

                                                                        if (jQuery('#fname').val() != "") {
                                                                            if (!jQuery('#fname').val().match(/^[a-zA-Z ]*$/)) {
                                                                                alert("Invalid First Name Only letters ");
                                                                                jQuery('#fname').focus();
                                                                                return false;
                                                                            }
                                                                        }

                                                                        if ((jQuery('#lname').val() == "") || (jQuery('#lname').val() == "Last Name")) {
                                                                            alert("Please enter your Last Name");
                                                                            jQuery('#lname').focus();
                                                                            return false;
                                                                        }

                                                                        if (jQuery('#lname').val() != "") {
                                                                            if (!jQuery('#lname').val().match(/^[a-zA-Z ]*$/)) {
                                                                                alert("Invalid Last Name Only letters");
                                                                                jQuery('#lname').focus();
                                                                                return false;
                                                                            }
                                                                        }

                                                                        if ((jQuery('#email_id').val() == "") || (jQuery('#email_id').val() == "Email Address")) {
                                                                            alert("Please enter your email");
                                                                            jQuery('#email_id').focus();
                                                                            return false;
                                                                        }

                                                                        if (jQuery('#email_id').val() != "") {
                                                                            if (!jQuery('#email_id').val().match(/([\w\-]+\@[\w\-]+\.[\w\-]+)/)) {
                                                                                alert("Invalid Email Address");
                                                                                jQuery('#email_id').focus();
                                                                                return false;
                                                                            }
                                                                        }

                                                                        if ((jQuery('#phone').val() == "") || (jQuery('#phone').val() == "Telephone")) {
                                                                            alert("Please enter your Phone Number");
                                                                            jQuery('#phone').focus();
                                                                            return false;
                                                                        }

                                                                        if (jQuery('#phone').val() != "") {
                                                                            if (!jQuery('#phone').val().match('[0-9]{10}')) {
                                                                                alert("Please put 10 digit mobile number");
                                                                                jQuery('#phone').focus();
                                                                                return false;
                                                                            }
                                                                        }

                                                                        if ((jQuery('#panno').val() == "") || (jQuery('#panno').val() == "PAN No.")) {
                                                                            alert("Please enter your PAN No");
                                                                            jQuery('#panno').focus();
                                                                            return false;
                                                                        }

                                                                        if (jQuery('#panno').val().value != "") {
                                                                            if (!jQuery('#panno').val().match(/^[A-Za-z0-9 ]+$/)) {
                                                                                alert("Invalid PAN No");
                                                                                jQuery('#panno').focus();
                                                                                return false;
                                                                            }
                                                                        }

                                                                        if ((jQuery('#address').val() == "") || (jQuery('#address').val() == "Address")) {
                                                                            alert("Please enter your Address");
                                                                            jQuery('#address').focus();
                                                                            return false;
                                                                        }

                                                                        var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'pdf'];

                                                                        if (jQuery('#nationality').val() != "India") {
                                                                            if ((jQuery('#passport').val() == "")) {
                                                                                alert("Please upload Copy of the Passport file.");
                                                                                return false
                                                                            } else {
                                                                                if (jQuery.inArray(jQuery('#passport').val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                                                                                    alert("Only formats are allowed : " + fileExtension.join(', '));
                                                                                    jQuery('#passport').val('');
                                                                                    return false;
                                                                                }
                                                                            }
                                                                        }
                                                                        // For Non-Indian countries - start

                                                                        /*
                                                                        if(document.formwithout.nationality.value!="99") {

                                                                            if((document.formwithout.fname.value =="") || (document.formwithout.fname.value=="First Name")) {
                                                                                alert("Please enter your First Name for Tax Exemption---");
                                                                                document.formwithout.fname.focus();
                                                                                return false;
                                                                            }

                                                                            if(document.formwithout.fname.value !="") {
                                                                                if(!document.formwithout.fname.value.match(/^[a-zA-Z ]*$/)) {
                                                                                    alert("Invalid First Name Only letters ");
                                                                                    document.formwithout.fname.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.lname.value=="") || (document.formwithout.lname.value=="Last Name")) {		
                                                                                alert("Please enter your Last Name for Tax Exemption");
                                                                                document.formwithout.lname.focus();
                                                                                return false;
                                                                            }

                                                                            if(document.formwithout.lname.value!="") {
                                                                                if(!document.formwithout.lname.value.match(/^[a-zA-Z ]*$/)) {
                                                                                    alert("Invalid Last Name Only letters");
                                                                                    document.formwithout.lname.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.email_id.value=="") || (document.formwithout.email_id.value=="Email Address")) {
                                                                                alert("Please enter your email for Tax Exemption");
                                                                                document.formwithout.email_id.focus();
                                                                                return false;
                                                                            }		

                                                                            if(document.formwithout.email_id.value!="") {
                                                                                if(!document.formwithout.email_id.value.match(/([\w\-]+\@[\w\-]+\.[\w\-]+)/)) {
                                                                                    alert("Invalid Email Address");
                                                                                    document.formwithout.email_id.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.phone.value=="") || (document.formwithout.phone.value=="Telephone")) {
                                                                                alert("Please enter your Phone Number");
                                                                                document.formwithout.phone.focus();
                                                                                return false;
                                                                            }		

                                                                            if(document.formwithout.phone.value!="") {
                                                                                if(!document.formwithout.phone.value.match(/^[0-9 ]+$/)) {
                                                                                    alert("Invalid Phone Number");
                                                                                    document.formwithout.phone.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.panno.value=="") || (document.formwithout.panno.value=="PAN No.")) {
                                                                                alert("Please enter your PAN No");
                                                                                document.formwithout.panno.focus();
                                                                                return false;
                                                                            }		

                                                                            if(document.formwithout.panno.value!="") {
                                                                                if(!document.formwithout.panno.value.match(/^[A-Za-z0-9 ]+$/)) {
                                                                                    alert("Invalid PAN No");
                                                                                    document.formwithout.panno.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.address.value=="") || (document.formwithout.address.value=="Address")) {
                                                                                alert("Please enter your Address for Tax Exemption");
                                                                                document.formwithout.address.focus();
                                                                                return false;
                                                                            }	
                                                                        } // For Non-Indian countries - end

                                                                        */

                                                                        /*	

                                                                            if((document.formwithout.amount.value=="") || (document.formwithout.amount.value=="Amount")) {
                                                                                alert("Please fill the amount to be donated---");
                                                                                document.formwithout.amount.focus();
                                                                                return false;
                                                                            }

                                                                            if(isNaN(document.formwithout.amount.value)==true)
                                                                            {
                                                                                alert("The donation amount must be numeric");
                                                                                document.formwithout.amount.value="";
                                                                                document.formwithout.amount.focus();
                                                                                return false;
                                                                            } */

                                                                        /*if(document.formwithout.currency.value=="INR") {
                                                                            if((document.formwithout.tax_certificate[0].checked!=true)&&(document.formwithout.tax_certificate[1].checked!=true)) {
                                                                                alert("Please select whether you want a Tax Exemption Certificate or not");
                                                                                return false;
                                                                            }
                                                                        } */

                                                                        //If the user is anonymous and then also he want the tax exemption Certificate.
                                                                        /*if(document.formwithout.tax_certificate[0].checked) {
                                                                            if((document.formwithout.fname.value=="") || (document.formwithout.fname.value=="First Name")) {
                                                                                alert("Please enter your First Name for Tax Exemption");
                                                                                document.formwithout.fname.focus();
                                                                                return false;
                                                                            }

                                                                            if((document.formwithout.lname.value=="") || (document.formwithout.lname.value=="Last Name")) {		
                                                                                alert("Please enter your Last Name for Tax Exemption");
                                                                                document.formwithout.lname.focus();
                                                                                return false;
                                                                            }

                                                                            if((document.formwithout.address.value=="") || (document.formwithout.address.value=="Address")) {
                                                                                alert("Please enter your Address for Tax Exemption");
                                                                                document.formwithout.address.focus();
                                                                                return false;
                                                                            }

                                                                            /*
                                                                            if(document.formwithout.panno.value=="none"){
                                                                                alert("Please enter Pan Number.");
                                                                                document.formwithout.panno.focus();
                                                                                return false;
                                                                            }
                                                                            if(document.formwithout.bd.value=="none"){
                                                                                alert("Please Select Date of Birth.");
                                                                                document.formwithout.bd.focus();
                                                                                return false;
                                                                            }

                                                                            if(document.formwithout.bm.value=="none"){
                                                                                alert("Please Select Date of Birth.");
                                                                                document.formwithout.bm.focus();
                                                                                return false;
                                                                            }

                                                                            if(document.formwithout.by.value=="none"){
                                                                                alert("Please Select Date of Birth.");
                                                                                document.formwithout.by.focus();
                                                                                return false;
                                                                            }

                                                                        } else {*/

                                                                        /*	if((document.formwithout.fname.value!="") && (document.formwithout.fname.value!="First Name")){
                                                                                if(!document.formwithout.fname.value.match(/^[a-zA-Z ]*$/)) {
                                                                                    alert("Please enter only letters in First Name ");
                                                                                    document.formwithout.fname.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.lname.value!="") && (document.formwithout.lname.value!="Last Name")){
                                                                                if(!document.formwithout.lname.value.match(/^[a-zA-Z ]*$/)) {
                                                                                    alert("Please enter only letters in Last Name");
                                                                                    document.formwithout.lname.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.email_id.value!="") && (document.formwithout.email_id.value!="Email Address")) {
                                                                                if(!document.formwithout.email_id.value.match(/([\w\-]+\@[\w\-]+\.[\w\-]+)/)) {
                                                                                    alert("Invalid Email Address");
                                                                                    document.formwithout.email_id.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.phone.value!="") && (document.formwithout.phone.value!="Telephone")) {
                                                                                if(!document.formwithout.phone.value.match(/^[0-9 ]+$/)) {
                                                                                    alert("Invalid Phone Number");
                                                                                    document.formwithout.phone.focus();
                                                                                    return false;
                                                                                }
                                                                            }

                                                                            if((document.formwithout.panno.value!="")  && (document.formwithout.panno.value!="PAN No.")){
                                                                                if(!document.formwithout.panno.value.match(/^[A-Za-z0-9 ]+$/)) {
                                                                                    alert("Invalid PAN No ");
                                                                                    document.formwithout.panno.focus();
                                                                                    return false;
                                                                                }
                                                                            }*/
                                                                        //}

                                                                        return true;
                                                                    }
                                                                </script>

                                                           
                                                        </div>
                                                    </div>
                                                    <div id="footer-wrapper">
                                                        <form id="form2" runat="server">
                                                        <div class="footer-wrapper-inner">
                                                            <!-- Footer -->

                                                            <uc9:footer ID="footer1" runat="server" />

                                                        </div>
                                                        <div id="back-top">
                                                            <a href="#"><span></span> </a>
                                                        </div>
                                                        </form>
                                                        <script src="js/jquery.centerIn.js"></script>
                                                        <script>
                                                            jQuery(function ($) {
                                                                $('.modal.loginPopup').alwaysCenterIn(window);
                                                            });
                                                        </script>
                                                        <script src="js/jquery.modernizr.min.js"></script>
                                                        <script src="js/jquery.stellar.min.js"></script>
                                                        <script>
                                                            jQuery(function ($) {
                                                                if (!Modernizr.touch) {
                                                                    $(window).load(function () {
                                                                        $.stellar({
                                                                            responsive: true,
                                                                            horizontalScrolling: false
                                                                        });
                                                                    });
                                                                }
                                                            });
                                                        </script>
                                                        <script src="js/jquery.simplr.smoothscroll.min.js"></script>
                                                        <script>
                                                            jQuery(function ($) {
                                                                if (!Modernizr.touch) {
                                                                    $.srSmoothscroll({
                                                                        ease: 'easeOutQuart'
                                                                    });
                                                                }
                                                            });
                                                        </script>
                                                        <script src="js/jquery.fancybox.pack.js"></script>
                                                        <script src="js/jquery.fancybox-buttons.js"></script>
                                                        <script src="js/jquery.fancybox-media.js"></script>
                                                        <script src="js/jquery.fancybox-thumbs.js"></script>
                                                        <script src="js/jquery.pep.js"></script>
                                                        <script src="js/jquery.vide.min.js"></script>
                                                        <script src="js/scripts.js"></script>
                                                
                                            </body>

                                            </html>
