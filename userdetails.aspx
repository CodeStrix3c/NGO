<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userdetails.aspx.cs" Inherits="userdetails" %>


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
                                                <title>Ehsaase-e-Insaniyat Trustn</title>

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

                                                      <!-- //Accordian -->
                                                     <link href="dist/css/accordion.min.css" rel="stylesheet">

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

                                                                    <div class="row-container">
                                                                        <div class="container">
                                                                            <div class="content-inner row">

                                                                                <div id="component" class="span12">
                                                                                    <main role="main">

                                                                                        <!-- Content-top -->
                                                                                        <div id="content-top-row" class="row">
                                                                                            <div id="content-top">
                                                                                                <div class="moduletable">
                                                                                                    <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">
                                                                                                        <%--<form id="formwithout" method="post" action="donaterequest.aspx">--%>
                                                                                                         <form id="formwithout" method="post" class="search-form" >
                                                                                                            <fieldset>
                                                                                                                 <input type="hidden" name="merchant_id" id="merchant_id" value="179737"/>
                                                                                                                 <input type="hidden" name="order_id" value="<% Response.Write(RandomDigits(10)); %>"/>
                                                                                                                 <input type="hidden" name="redirect_url" value="http://localhost:49493/HelpFoundation_PaymentGatway/paynowresponse.aspx"/>
                                                                                                                 <input type="hidden" name="cancel_url" value="http://localhost:49493/HelpFoundation_PaymentGatway/userlogin.aspx"/>
                                                                                                                  <ul class="form-sec-inner">                                                                  
                                                                                                                           <li>                                                                
                                                                                                                           <ul class="regis-form-sec">                                                                 
                                                                                                                           <li>
                                                                                                                                <input type="hidden" name="merchant_param2" id="merchant_param2" runat="server"/>
                                                                                                                                <input type="hidden" name="currency" id="currency"  value="INR"/>

                                                                                                                                <input type="hidden" name="amount" id="amount" runat="server"/>
                                                                                                                                <input type="hidden" name="billing_name" id="billing_name" runat="server"/>
                                                                                                                                <input type="hidden" name="billing_name" id="lname" runat="server" />
                                                                                                                                <input type="hidden" name="billing_email" id="billing_email" runat="server" />
                                                                                                                                <input type="hidden" name="billing_tel" id="billing_tel" runat="server" />
                                                                                                                                <input type="hidden" name="billing_address" id="billing_address" runat="server"/>
                                                                                                                                <input type="hidden" name="billing_city" id="billing_city" runat="server" />
                                                                                                                                <input type="hidden" name="billing_zip" id="billing_zip" runat="server"/>
                                                                                                                                <input type="hidden" name="merchant_param1" id="merchant_param1" runat="server"/>

                                                                                                                                <input type="hidden" name="billing_state" id="txtstate" value="Jammu and Kashmir"/>
                                                                                                                               
                                                                                                                                <input type="hidden" name="billing_country" id="nationality" value="India"/>
                                                                                                                           </li>
                                                                                                                           </ul> 
                                                                                                                           <li>
                                                                                                                           <li> 
                                                                                                                           <input type="submit" name="submit" id="btn-paynow" value="PayNow" class="dispaly-inline">
                                                                                                                           <input type="hidden" name="token" value="810dd25712b69b3cc6124559afdef372">
                                                                                                                           </li>
                                                                                                                   </ul>
                                                                                                               </fieldset>
                                                                                                           </form>
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
                                                                                                                   jQuery("#btn-paynow").on('click', function (event) {

                                                                                                                       event.preventDefault();

                                                                                                                       var fd = new FormData();

                                                                                                                       var other_data = jQuery('#formwithout').serializeArray();
                                                                                                                       jQuery.each(other_data, function (key, input) {
                                                                                                                          // alert(input.name + "_" + input.value);
                                                                                                                           fd.append(input.name, input.value);
                                                                                                                       });
                                                                                                                       var strurl = "";
                                                                                                                       if (jQuery('#nationality').val() == "India" && jQuery('#currency').val() == "INR") {
                                                                                                                           strurl = "paynowrequest.aspx";
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
                                                                                                                               jQuery("#btn-paynow").remove();
                                                                                                                           },
                                                                                                                           success: function (response) {
                                                                                                                               window.location.href = "" + response + "";
                                                                                                                           }
                                                                                                                       });

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
                                                                                                                   return true;
                                                                                                               }</script>

                                                                                                           
                                                                                                            
                                                                                                           
                                                                                                     

                                                                                                    </div>
                                                                                                </div>


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
                                                    </div>

                                                     <form id="frm" runat="server">
                                                      <div class="row-container">
                                                                        <div class="container">
                                                                            <div class="content-inner row">

                                                                                <div id="Div1" class="span12">
                                                                                    <main role="main">
                                                                <asp:GridView ID="Grid" runat="server"  AutoGenerateColumns="False"
                                                                                                             DataKeyNames="ID" ShowFooter="True"  CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" OnRowDataBound="Grid_RowDataBound">
                                                                                                             <Columns>
                                                                                                                <asp:TemplateField>
                                                                                                                    <ItemStyle VerticalAlign="Top" />
                                                                                                                    <ItemTemplate>

                                                                                                                        <h3>Please pay : 
                                                                                                                        <asp:Label ID="Label83" forecolor="Black" runat="server" Text='<%# Bind("FeePay") %>'></asp:Label>
                                                                                                                        </h3>

                                                                                                                        <div class="accordion-container">

                                                                                                                            <div class="panel">
                                                                                                                                <div class="heading" style="font-size:20px">PROFILE</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Name: </b>  <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label> 
                                                                                                                                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("middleName") %>'></asp:Label>
                                                                                                                                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Email: </b> <asp:Label ID="Label4" runat="server" Text='<%# Bind("emailid") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Contact No: </b> <asp:Label ID="Label5" runat="server" Text='<%# Bind("contactNo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <img alt="" src="Upload/<%#(Eval("OImageUrl"))%>" style="float:left; padding-right:10px"/> 
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Alternate No: </b>  <asp:Label ID="Label31" runat="server" Text='<%# Bind("AlternateNo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Occupation: </b><br><br>
                                                                                                                                              <asp:Label ID="occupation" runat="server" Text='<%# Bind("occupation") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> How you came to know about BtW?: </b><br><br>
                                                                                                                                              <asp:Label ID="Label43" runat="server" Text='<%# Bind("btw") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                             <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <a href="Upload/<%#(Eval("OCVFileUrl"))%>" target="_blank">Your CV</a>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel">
                                                                                                                                <div class="heading" style="font-size:20px">ADDRESS</div>
                                                                                                                                <div class="content">
                                                                                                                                    <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> House/Villa: </b> <asp:Label ID="Label9" runat="server" Text='<%# Bind("jform_house_villa") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Street/Village: </b> <asp:Label ID="Label10" runat="server" Text='<%# Bind("jform_street_Village") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                            <b> Tehsil/Town: </b> <asp:Label ID="Label11" runat="server" Text='<%# Bind("jform_tehsil_town") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                            <b> City: </b> <asp:Label ID="Label12" runat="server" Text='<%# Bind("jform_City") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b> District: </b><asp:Label ID="Label13" runat="server" Text='<%# Bind("jform_District") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Pin Code: </b><asp:Label ID="Label14" runat="server" Text='<%# Bind("jform_PinCode") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Land Mark: </b> <asp:Label ID="Label15" runat="server" Text='<%# Bind("jform_Land_Mark") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel">
                                                                                                                                <div class="heading" style="font-size:20px">CORROSPONDANCE ADDRESS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> House/Villa: </b><asp:Label ID="Label16" runat="server" Text='<%# Bind("jform_CHouse_Villa") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                            <b> Street/Village: </b><asp:Label ID="Label17" runat="server" Text='<%# Bind("jform_CStreet_Village") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Tehsil/Town: </b><asp:Label ID="Label18" runat="server" Text='<%# Bind("jform_CTehsil_town") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> City: </b><asp:Label ID="Label19" runat="server" Text='<%# Bind("jform_CCity") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b> District: </b><asp:Label ID="Label20" runat="server" Text='<%# Bind("jform_CDistrict") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b> Pin Code: </b><asp:Label ID="Label21" runat="server" Text='<%# Bind("jform_CPinCode") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b> Land Mark: </b><asp:Label ID="Label22" runat="server" Text='<%# Bind("jform_CLand_Mark") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>
                                          
                                                                                                                            <div class="panel" id="studentEducation" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">EDUCATION</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Your highest qualification</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label23" runat="server" Text='<%# Bind("jform_SQualification") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Course</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label24" runat="server" Text='<%# Bind("jform_SCourse") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Year</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label25" runat="server" Text='<%# Bind("jform_SYear") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you persuing a degree</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label26" runat="server" Text='<%# Bind("jform_SPersuing_Degree") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Course</b> <br> <br>
                                                                                                                                                   <asp:Label ID="Label27" runat="server" Text='<%# Bind("jform_SPCourse") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>For the period From</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label28" runat="server" Text='<%# Bind("jform_SPeriodFrom") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>To</b> <br> <br>
                                                                                                                                               <asp:Label ID="Label29" runat="server" Text='<%# Bind("jform_SPeriodTo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="studentACHIEVEMENTS" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">ACADEMIC/OTHER ACHIEVEMENTS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Graduation Score</b> <br> <br>
                                                                                                                                                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("jform_SGraduationScore") %>'></asp:Label>
                                                      
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Post Graduation Score</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label30" runat="server" Text='<%# Bind("jform_SPostGraduationScore") %>'></asp:Label>
                                                      
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Any other degree Score</b> <br> <br>
                                                                                                                                               <asp:Label ID="Label32" runat="server" Text='<%# Bind("jform_SOtherDegreeScore") %>'></asp:Label>
                                                          
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Skill acquired</b> <br> <br>
                                                                                                                                              <asp:Label ID="Label33" runat="server" Text='<%# Bind("jform_SSkillAcquired") %>'></asp:Label>
                                                          
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Tech skills </b> <br> <br>
                                                                                                                                                    <asp:Label ID="Label34" runat="server" Text='<%# Bind("jform_STechSkills") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>Social Media Activism</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label35" runat="server" Text='<%# Bind("jform_SSocialMediaActivism") %>'></asp:Label>
                                                                                                                                            </td>
                                                          
                                                                                                                                       </tr>

                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Internship? Where</b> <br> <br>
                                                                                                                                                   <asp:Label ID="Label36" runat="server" Text='<%# Bind("SInternship") %>'></asp:Label>
                                                            
                                                      
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>On job training? Where</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label37" runat="server" Text='<%# Bind("SjobTraining") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Volunteerism? Where</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label38" runat="server" Text='<%# Bind("SVolunteerism") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>

                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Awards and acomplishments</b> <br> <br>
                                                                                                                                                   <asp:Label ID="Label39" runat="server" Text='<%# Bind("SAwards") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Certificate of Excellence</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label40" runat="server" Text='<%# Bind("SCertificateofExcellence") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Honourary doctorate/citizenship</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label41" runat="server" Text='<%# Bind("SHonourary") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="studentEducationExpanses" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">COURSE FEES AND EDUCATION EXPANSES</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b>Do you have a fellowship</b> <br> <br>
                                                                                                                                               <asp:Label ID="Label6" runat="server" Text='<%# Bind("Sfellowship") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b>if not, how much you pay annualy</b> <br> <br>
                                                                                                                                              <asp:Label ID="Label42" runat="server" Text='<%# Bind("SPayAnnualy") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b>Have you got any scholorship</b> <br> <br>
                                                                                                                                               <asp:Label ID="Label44" runat="server" Text='<%# Bind("SScholorship") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b>Do you manage your course fee</b> <br> <br>
                                                                                                                                               <asp:Label ID="Label45" runat="server" Text='<%# Bind("SManageCourseFee") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="otherEducation" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">EDUCATION</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Your highest qualification</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label46" runat="server" Text='<%# Bind("OHighestQualification") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Course</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label47" runat="server" Text='<%# Bind("OCourse") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Year</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label48" runat="server" Text='<%# Bind("OYear") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Skill training/diploma</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label49" runat="server" Text='<%# Bind("OSkillTraining") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Certificate course</b> <br> <br>
                                                                                                                                                   <asp:Label ID="Label50" runat="server" Text='<%# Bind("OCertificateCourse") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>Volunteerism</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label51" runat="server" Text='<%# Bind("OVolunteerism") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                             <div class="panel" id="otherWorkExperience" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">WORK EXPERIENCE</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Organization/Department</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("ODepartment") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Position</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label52" runat="server" Text='<%# Bind("OPosition") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Period From</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label53" runat="server" Text='<%# Bind("OPeriodFrom") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Period To</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label57" runat="server" Text='<%# Bind("OPeriodTo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label54" runat="server" Text='<%# Bind("ODepartmentSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                   <asp:Label ID="Label55" runat="server" Text='<%# Bind("OPositionSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label56" runat="server" Text='<%# Bind("OPeriodFromSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label58" runat="server" Text='<%# Bind("OPeriodToSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label59" runat="server" Text='<%# Bind("ODepartmentThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                   <asp:Label ID="Label60" runat="server" Text='<%# Bind("OPositionThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label61" runat="server" Text='<%# Bind("OPeriodFromThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label62" runat="server" Text='<%# Bind("OPeriodToThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>
                                        
                                                                                                                            <div class="panel" id="otherAchievements" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">ACADEMIC/OTHER ACHIEVEMENTS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Graduation Score</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label63" runat="server" Text='<%# Bind("OGraduationScore") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Post Graduation Score</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label64" runat="server" Text='<%# Bind("OPostGraduationScore") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Any other degree Score</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label65" runat="server" Text='<%# Bind("OotherDegreeScore") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Skill acquired</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label66" runat="server" Text='<%# Bind("OSkillAcquired") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Tech skills</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label67" runat="server" Text='<%# Bind("OTechSkills") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Social Media Activism</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label68" runat="server" Text='<%# Bind("OSocialMediaActivism") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                      
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="otherBudgets" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">YOUR BUDGETS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you satisfied with the earnings?</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label69" runat="server" Text='<%# Bind("Oearnings") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you able to manage the expenses?</b> <br> <br>
                                                                                                                                             <asp:Label ID="Label70" runat="server" Text='<%# Bind("Oexpenses") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Do you save/invest your excess earnings?</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label71" runat="server" Text='<%# Bind("OexcessEarnings") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Age</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label72" runat="server" Text='<%# Bind("OAge") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you married? </b> <br> <br>
                                                                                                                                             <asp:Label ID="Label73" runat="server" Text='<%# Bind("Omarried") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you the only earning hand in your family?</b> <br> <br>
                                                                                                                                                <asp:Label ID="Label74" runat="server" Text='<%# Bind("OEarningHand") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>

                                                                                                                                         <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Who is in your family?</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label75" runat="server" Text='<%# Bind("OFamilyOne") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label76" runat="server" Text='<%# Bind("OFamilyTwo") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label77" runat="server" Text='<%# Bind("OFamilyThree") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>
                                                                                                                                         <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <asp:Label ID="Label78" runat="server" Text='<%# Bind("OFamilyFour") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label79" runat="server" Text='<%# Bind("OFamilyFive") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label80" runat="server" Text='<%# Bind("OFamilySix") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>
                                                        
                                                                                                                                         <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Do you face any health issue?</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label81" runat="server" Text='<%# Bind("OhealthIssue") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>

                                                                                                                                          <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>What do you expect from this workshop?</b> <br> <br>
                                                                                                                                                 <asp:Label ID="Label82" runat="server" Text='<%# Bind("OexpectFromWorkshop") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>
                                                        
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                        </div>

                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                                                                                            <EditRowStyle BackColor="#999999" HorizontalAlign="Left" />
                                                                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                                                                                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" />
                                                                                                        </asp:GridView>
                                                                 
                                                                                   </main>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                       <div id="footer-wrapper">
                                                       
                                                        <div class="footer-wrapper-inner">
                                                            <!-- Footer -->

                                                            <uc9:footer ID="footer1" runat="server" />

                                                        </div>
                                                        <div id="back-top">
                                                            <a href="#"><span></span> </a>
                                                        </div>

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
                                          <script src="dist/js/accordion.min.js"></script>
                                            <script>
                                                var accordion = new Accordion('.accordion-container');
                                            </script>
                                            </html>

