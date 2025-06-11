<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControls/Banner.ascx" TagName="Banner" TagPrefix="uc1" %>

<%@ Register Src="UserControls/mainmenu.ascx" TagName="mainmenu" TagPrefix="uc2" %>

<%@ Register Src="UserControls/HomeDetails.ascx" TagName="HomeDetails" TagPrefix="uc3" %>

<%@ Register Src="UserControls/LatestNews.ascx" TagName="LatestNews" TagPrefix="uc4" %>

<%@ Register Src="UserControls/LatestVideo.ascx" TagName="LatestVideo" TagPrefix="uc5" %>

<%@ Register Src="UserControls/Shehjar_Cat.ascx" TagName="Shehjar_Cat" TagPrefix="uc6" %>

<%@ Register Src="UserControls/OngoingProjects.ascx" TagName="OngoingProjects" TagPrefix="uc7" %>

<%@ Register Src="UserControls/topmenu.ascx" TagName="topmenu" TagPrefix="uc8" %>

<%@ Register Src="UserControls/Partners.ascx" TagName="Partners" TagPrefix="uc9" %>

<%@ Register Src="UserControls/footer.ascx" TagName="footer" TagPrefix="uc10" %>

<%@ Register Src="UserControls/LatestEvents.ascx" TagName="LatestEvents" TagPrefix="uc11" %>

<%@ Register Src="UserControls/downloads.ascx" TagName="downloads" TagPrefix="uc12" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb">
<head>


    <link rel="shortcut icon" href="images/logo.png">

    <title>Ehsaase-e-Insaniyat Trust</title>

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
        window.setInterval(function () { var r; try { r = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP") } catch (e) { } if (r) { r.open("GET", "./", true); r.send(null) } }, 840000);
        jQuery(document).ready(function () {
            jQuery('.hasTooltip').tooltip({ "html": true, "container": "body" });
        });
        jQuery(function ($) {
            SqueezeBox.initialize({});
            SqueezeBox.assign($('a.modal').get(), {
                parse: 'rel'
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



</head>
<body class="com_content view-category task- itemid-134 body__">
    <form id="form1" runat="server">
        <!-- Body -->
        <div id="wrapper">
            <div class="wrapper-inner">
                <!-- Top -->
                <div id="top-row" style="background-color: #00A6D6">
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
                                            <img src="images/logo.png" alt="Logo Here" width="100px">
                                            <h1>Ehsaase-e-Insaniyat Trust</h1>
                                            <span class="hightlight"></span>
                                        </a>
                                    </div>

                                    <div class="moduletable   span8a">
                                        <div class="icemegamenu">
                                            <div class="ice-megamenu-toggle">
                                                <a data-toggle="collapse" data-target=".nav-collapse">Menu</a>
                                            </div>
                                            <div class="nav-collapse icemegamenu collapse  " style="float: right">

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
                                                    $('#icemegamenu').parents('[id*="-row"]').scrollToFixed({ minWidth: 768 });
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
                <!-- Showcase -->
                <div id="showcase-row">
                    <div class="moduletable ">
                        <div id="camera-slideshow_92" class="  camera_wrap pattern_1">

                            <uc1:Banner ID="Banner1" runat="server" />

                        </div>
                        <script>
                            jQuery(function () {
                                jQuery('#camera-slideshow_92').camera({
                                    alignment: "topCenter", //topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
                                    autoAdvance: true,	//true, false
                                    mobileAutoAdvance: true, //true, false. Auto-advancing for mobile devices
                                    barDirection: "leftToRight",	//'leftToRight', 'rightToLeft', 'topToBottom', 'bottomToTop'
                                    barPosition: "bottom",	//'bottom', 'left', 'top', 'right'
                                    cols: 6,
                                    easing: "swing",	//for the complete list https://jqueryui.com/demos/effect/easing.html
                                    mobileEasing: "swing",	//leave empty if you want to display the same easing on mobile devices and on desktop etc.
                                    fx: "simpleFade",
                                    mobileFx: "simpleFade",		//leave empty if you want to display the same effect on mobile devices and on desktop etc.
                                    gridDifference: 250,	//to make the grid blocks slower than the slices, this value must be smaller than transPeriod
                                    height: "27.60416666666667%",	//here you can type pixels (for instance '300px'), a percentage (relative to the width of the slideshow, for instance '50%') or 'auto'
                                    // imagePath					: 'images/',	//the path to the image folder (it serves for the blank.gif, when you want to display videos)
                                    hover: true,	//true, false. Puase on state hover. Not available for mobile devices
                                    loader: "none",	//pie, bar, none (even if you choose "pie", old browsers like IE8- can't display it... they will display always a loading bar)
                                    loaderColor: "#eeeeee",
                                    loaderBgColor: "#222222",
                                    loaderOpacity: .8,	//0, .1, .2, .3, .4, .5, .6, .7, .8, .9, 1
                                    loaderPadding: 2,	//how many empty pixels you want to display between the loader and its background
                                    loaderStroke: 7,	//the thickness both of the pie loader and of the bar loader. Remember: for the pie, the loader thickness must be less than a half of the pie diameter
                                    minHeight: "450px",	//you can also leave it blank
                                    navigation: false,	//true or false, to display or not the navigation buttons
                                    navigationHover: false,	//if true the navigation button (prev, next and play/stop buttons) will be visible on hover state only, if false they will be 	visible always
                                    mobileNavHover: false,	//same as above, but only for mobile devices
                                    opacityOnGrid: false,	//true, false. Decide to apply a fade effect to blocks and slices: if your slideshow is fullscreen or simply big, I recommend to set it false to have a smoother effect 
                                    overlayer: false,	//a layer on the images to prevent the users grab them simply by clicking the right button of their mouse (.camera_overlayer)
                                    pagination: true,
                                    playPause: false,	//true or false, to display or not the play/pause buttons
                                    pauseOnClick: false,	//true, false. It stops the slideshow when you click the sliders.
                                    pieDiameter: 38,
                                    piePosition: "rightTop",	//'rightTop', 'leftTop', 'leftBottom', 'rightBottom'
                                    portrait: false, //true, false. Select true if you don't want that your images are cropped
                                    rows: 4,
                                    slicedCols: 6,	//if 0 the same value of cols
                                    slicedRows: 4,	//if 0 the same value of rows
                                    // slideOn				: "",	//next, prev, random: decide if the transition effect will be applied to the current (prev) or the next slide
                                    thumbnails: false,
                                    time: 7000,	//milliseconds between the end of the sliding effect and the start of the nex one
                                    transPeriod: 1500	//lenght of the sliding effect in milliseconds
                                    // onEndTransition		: function() {  },	//this callback is invoked when the transition effect ends
                                    // onLoaded					: function() {  },	//this callback is invoked when the image on a slide has completely loaded
                                    // onStartLoading		: function() {  },	//this callback is invoked when the image on a slide start loading
                                    // onStartTransition	: function() {  }	//this callback is invoked when the transition effect starts
                                });
                            });
                        </script>

                    </div>

                    <div class="moduletable center">
                        <div class="mod-newsflash-adv services mod-newsflash-adv__center cols-3" id="module_129">
                            <div class="row-fluid">

                                <%-- <img src="images/fn.png" /> --%>



                                <uc3:HomeDetails ID="HomeDetails1" runat="server" />

                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                    <div class="moduletable center">
                        <div class="mod-newsflash-adv services mod-newsflash-adv__center cols-3" id="Div3">
                            <div class="row-fluid">

                                <img src="images/bg.png" style="width: 100%" />

                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                </div>
                <!-- Feature -->
                <div id="feature-row" data-stellar-background-ratio="0.5">
                    <div class="row-container">
                        <div class="container">
                            <div class="row">
                                <div class="moduletable type  span6">
                                    <header>
                                        <h3 class="moduleTitle ">
                                            <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Latest </span>
                                            <span class="item_title_part3 item_title_part_even item_title_part_first_half">News</span></h3>
                                        </h3>
                                    </header>
                                    <div class="mod-newsflash-adv type mod-newsflash-adv__type cols-1" id="module_128">


                                        <uc4:LatestNews ID="LatestNews1" runat="server" />



                                        <div class="clearfix"></div>


                                        <div class="mod-newsflash-adv_custom-link">
                                            <a class="btn btn-info" href="newslist.aspx">view all</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="moduletable   span6">
                                    <header>
                                        <h3 class="moduleTitle "><span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Videos</span> </h3>
                                    </header>
                                    <div class="mod_caroufredsel mod_caroufredsel__" id="module_91">
                                        <div id="list_carousel_91" class="list_carousel">
                                            <ul id="caroufredsel_91">

                                                <uc5:LatestVideo ID="LatestVideo1" runat="server" />

                                            </ul>
                                        </div>

                                        <div id="carousel_91_prev" class="caroufredsel_prev"><span>&nbsp;</span></div>
                                        <div id="carousel_91_next" class="caroufredsel_next"><span>&nbsp;</span></div>

                                        <div id="carousel_91_pag" class="caroufredsel_pagination"></div>
                                        <div class="clearfix"></div>

                                    </div>

                                    <script>
                                        jQuery(function ($) {
                                            var carousel = $("#caroufredsel_91")
                                            carousel.carouFredSel({
                                                responsive: true,
                                                width: '100%',
                                                items: {
                                                    width: 768,
                                                    height: 'variable',
                                                    visible: {
                                                        min: 1,
                                                        max: 1
                                                    },
                                                    minimum: 1
                                                },
                                                scroll: {
                                                    items: 1,
                                                    fx: "scroll",
                                                    easing: "swing",
                                                    duration: 500,
                                                    queue: true
                                                },
                                                auto: false,
                                                next: "#carousel_91_next",
                                                prev: "#carousel_91_prev",
                                                swipe: {
                                                    onTouch: true
                                                }
                                            });
                                            $(window).load(function () {
                                                setTimeout(function () {
                                                    carousel.trigger('configuration', { reInit: true })
                                                }, 100);
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Navigation -->

                <!-- Maintop -->
                <div id="maintop-row">
                    <div class="row-container">
                        <div class="container">
                            <header>
                                <h3 class="moduleTitle color">
                                    <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">PILLARS OF </span>
                                    <span class="item_title_part3 item_title_part_even item_title_part_first_half">CHANGE</span></h3>
                            </header>
                            <div id="maintop" class="row">
                                <div class="moduletable center icons  span12">
                                    <div class="mod-newsflash-adv mod-newsflash-adv__center icons cols-4" id="module_126">
                                        <div class="row-fluid">

                                            <uc6:Shehjar_Cat ID="Shehjar_Cat1" runat="server" />
                                        </div>

                                        <div class="clearfix"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-container">
                    <div class="container">
                        <div id="system-message-container">
                        </div>

                    </div>
                </div>
                <!-- Main Content row -->
                <div id="content-row">
                    <div class="row-container">
                        <div class="container">
                            <div class="content-inner row">

                                <div id="component" class="span12">
                                    <main role="main">


                                        <style>
                                            .lrcounter-horizontal-vertical table {
                                                background: none repeat scroll 0 0 transparent !important;
                                                border: medium none !important;
                                                color: #000000 !important;
                                                margin: 0 !important;
                                                padding: 0 !important;
                                                text-align: left !important;
                                            }


                                                .lrcounter-horizontal-vertical table tr, .lrcounter-horizontal-vertical table td {
                                                    background: none repeat scroll 0 0 transparent !important;
                                                    border: medium none !important;
                                                    color: #000000 !important;
                                                    display: inline-table;
                                                    margin-left: 4px !important;
                                                    padding: 0 2px !important;
                                                    text-align: left !important;
                                                    vertical-align: bottom !important;
                                                }

                                            iframe, svg {
                                                max-width: none !important;
                                            }
                                        </style>
                                        <section class="page-category page-category__">
                                        </section>

                                        <!-- Content-bottom -->
                                        <div id="content-bottom-row" class="row">
                                            <div id="content-bottom">
                                                <div class="moduletable   span12">
                                                    <header>
                                                        <h3 class="moduleTitle color">
                                                            <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">ONGOING </span>
                                                            <span class="item_title_part3 item_title_part_even item_title_part_first_half">PROJECTS</span></h3>
                                                    </header>
                                                    <div class="mod-newsflash-adv gallery mod-newsflash-adv__ cols-4" id="module_125">
                                                        <div class="row-fluid">

                                                            <uc7:OngoingProjects ID="OngoingProjects1" runat="server" />


                                                        </div>
                                                        <div class="row-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </main>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Bottom -->



                <div class="moduletable ">
                </div>

                <div>




                    <div id="bottom-row">
                        <div class="row-container">
                            <div class="container">
                            </div>
                        </div>
                    </div>


                    <div class="container">
                        <div class="content-inner row">

                            <div id="Div4" class="span12">
                                <main role="main">


                                    <!-- Content-top -->
                                    <div id="content-top-row" class="row">
                                        <div id="content-top">

                                            <div class="moduletable   span12">
                                                <div class="mod-newsflash-adv posts mod-newsflash-adv__ cols-2" id="module_123">
                                                    <br></br>
                                                    <div class="row-fluid">

                                                        <article class="span6 item item_num0 item__module   visible-first" id="item_79">
                                                            <header>
                                                                <h3 class="moduleTitle color">
                                                                    <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Events </span>
                                                                    <a class="btn btn-info readmore custom_hover" href="Events.aspx" style="float: right"><span><span><span>view more</span></span><strong><span>view more</span></strong></span></a>
                                                            </header>

                                                            <uc11:LatestEvents ID="LatestEvents1" runat="server" />

                                                            <div class="clearfix"></div>

                                                        </article>

                                                        <article class="span6 item item_num1 item__module   visible-first" id="item_80">
                                                            <header>
                                                                <h3 class="moduleTitle color">
                                                                    <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">RESOURCES </span>
                                                            </header>
                                                            <div class="item_content">

                                                                <div class="row-container visible visible-first">
                                                                    <div class="container">
                                                                        <div class="content-inner row">

                                                                            <div id="Div2" class="span12">
                                                                                <main role="main">

                                                                                    <div id="Kunena" class="layout container-fluid">

                                                                                        <div class="kunena_body">

                                                                                            <uc12:downloads ID="downloads1" runat="server" />

                                                                                        </div>
                                                                                    </div>
                                                                                </main>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </article>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>





                                </main>
                            </div>
                        </div>
                    </div>




                    <div style="background-image: url(images/donate.png); width: 100%">
                        <div class="row-container">
                            <div class="container">
                                <div id="bottom" class="row">
                                    <div class="moduletable   span12">
                                        <div class="mod-menu">
                                            <ul class="nav menu partners">
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

                                                        .button:hover {
                                                            background-color: #FC6A00;
                                                        }

                                                        .button:active {
                                                            background-color: #3e8e41;
                                                            box-shadow: 0 5px #666;
                                                            transform: translateY(4px);
                                                        }
                                                </style>
                                                <li style="padding-top: 170px; padding-bottom: 25px; text-align: right">
                                                    <b style="font-size: 20px; color: white">SUPPORT US THROUGH YOUR CONTRIBUTION</b><br></br>
                                                    <br></br>
                                                    <a href="donate.aspx" class="button">DONATE NOW</a>

                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>










                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3306.713286597445!2d74.9629697!3d34.0255698!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38e189511ea674fb%3A0x58bd83f3b9316cf1!2sEhsaas-e-Insaniyat%20Trust!5e0!3m2!1sen!2sin!4v1742102174138!5m2!1sen!2sin" width="100%" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                    <div id="push"></div>
                </div>
            </div>
            <div id="footer-wrapper">
                <div class="footer-wrapper-inner">
                    <!-- Footer -->

                    <uc10:footer ID="footer1" runat="server" />


                </div>
                <div id="back-top">
                    <a href="#"><span></span></a>
                </div>




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
                                $.stellar({ responsive: true, horizontalScrolling: false });
                            });
                        }
                    });
                </script>
                <script src="js/jquery.simplr.smoothscroll.min.js"></script>
                <script>
                    jQuery(function ($) {
                        if (!Modernizr.touch) {
                            $.srSmoothscroll({ ease: 'easeOutQuart' });
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
    </form>
</body>
</html>
