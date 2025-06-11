<%@ Page Title="Photos" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content-row">
        <div class="row-container visible visible-first">
          <div class="container">
            <div class="content-inner row">   
                      
              <div id="component" class="span12">
                <main role="main">
                         
                          
                  <div class="gallery">
                <h3 class="visible-first"><span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Images</span></h3>  <div class="jg_pathway">
                <a href="#" class="jg_pathitem"><asp:Label ID="lblSubCatName" runat="server"></asp:Label></a>
                </div>
 
<script>
    jQuery(document).ready(function ($) {
        $(window).load(function () {

            var $container = $('#jg_gallery');

            $container.mixitup({
                targetSelector: '.jg_element_cat',
                filterSelector: '.filter',
                sortSelector: '.sort',
                buttonEvent: 'click',
                effects: ['fade', 'scale', 'rotateZ'],
                listEffects: null,
                easing: 'smooth',
                layoutMode: 'grid',
                targetDisplayGrid: 'inline-block',
                targetDisplayList: 'block',
                gridClass: 'grid',
                listClass: 'list',
                transitionSpeed: 600,
                showOnLoad: 'all',
                sortOnLoad: false,
                multiFilter: false,
                filterLogic: 'or',
                resizeContainer: true,
                minHeight: 0,
                failClass: 'fail',
                perspectiveDistance: '3000',
                perspectiveOrigin: '50% 50%',
                animateGridList: true,
                onMixLoad: function () {
                    $container.addClass('loaded');
                },
                onMixStart: function (config) {
                    if (config.layoutMode == 'list') {
                        config.effects = ['fade', 'scale']
                    }
                    else {
                        config.effects = []
                        $container.find('.jg_element_cat').removeClass('gallery-list').addClass('gallery-grid');
                    }
                },
                onMixEnd: function (config) {
                    if (config.layoutMode == 'list') {
                        $container.find('.jg_element_cat').addClass('gallery-list').removeClass('gallery-grid');
                    }
                }
            });

            var click = true;
            $('a[data-fancybox="fancybox"]').fancybox({
                padding: 0,
                margin: 0,
                loop: true,
                openSpeed: 500,
                closeSpeed: 500,
                nextSpeed: 500,
                prevSpeed: 500,
                afterLoad: function () {
                    $('.fancybox-inner').click(function () {
                        if (click == true) {
                            $('body').toggleClass('fancybox-full');
                        }
                    })
                },
                beforeShow: function () {
                    $('body').addClass('fancybox-lock');
                },
                afterClose: function () {
                    $('body').removeClass('fancybox-lock');
                },
                tpl: {
                    image: '<div class="fancybox-image" style="background-image: url(\'{href}\');"></div>'
                },
                helpers: {
                    title: null,
                    thumbs: {
                        height: 50,
                        width: 80
                    },
                    overlay: {
                        css: {
                            'background': '#191919'
                        }
                    }
                }
            });
            $('#sort .sort').click(function () {
                $('#sort .sort').removeClass('selected');
                $(this).addClass('selected');
                $('#order .sort').attr('data-sort', $(this).attr('data-sort'))
            })
            $('#order .sort').click(function () {
                $('#order .sort').removeClass('selected');
                $(this).addClass('selected');
                $('#sort .sort').attr('data-order', $(this).attr('data-order'))
            })
        });
    });
</script>

<div class="jg_gallery" id="jg_gallery">
  <div class="jg_displaynone">
    </div>    
    <asp:Literal ID="ltrimgs" runat="server"></asp:Literal>
      <%--  <div class="jg_element_cat mix gallery-grid gallery-item" data-date="20140903135719" data-value="0" data-name="Suspendisse">
          <div class="jg_imgalign_catimgs">
              <span class="lazy lazy_container" style="width: 347px;">
              <span class="lazy lazy_preloader" style="padding-top: 80.691642651297%;"></span>
                  <img src="https://livedemo00.template-help.com/joomla_52178/plugins/system/tmlazyload/blank.gif" data-src="https://livedemo00.template-help.com/joomla_52178/images/joomgallery/thumbnails/what_we_do_2/first_category_3/first_category_1_20140903_1689763756.jpg" class="lazy jg_photo" width="347" height="280" alt="Suspendisse" />
              </span>
          <div class="jg_catelem_txt">
            <ul>
              <li class="gallery_desc">
                <p>Suspendisse ac magna facilisis diam varius vestibulum sed ac eros. Morbi eleifend turpis non risus sagittis nec feugiat arcu sollicitudin. </p>
              </li>
              <li class="jg_links">
                <a class="fancybox-thumb" data-title="Suspendisse" href="https://livedemo00.template-help.com/joomla_52178/plugins/system/tmlazyload/blank.gif" data-fancybox="fancybox" data-fancybox-group="joomgallery" data-fancybox-type="image"><i class="fa fa-search-plus"></i><span class="lazy lazy_container" style="width: 347px;"><span class="lazy lazy_preloader" style="padding-top: 80.691642651297%;"></span><img src="https://livedemo00.template-help.com/joomla_52178/plugins/system/tmlazyload/blank.gif" data-src="https://livedemo00.template-help.com/joomla_52178/images/joomgallery/thumbnails/what_we_do_2/first_category_3/first_category_1_20140903_1689763756.jpg" class="lazy jg_photo" width="347" height="280" alt="Suspendisse" /></span></a>
              </li>
            </ul>
          </div>
          </div>
        </div>--%>

    </div>
        <div class="jg_displaynone">
    </div></div>   
                                  </main>
              </div>        
                          </div>
          </div>
        </div>
      </div>
</asp:Content>

