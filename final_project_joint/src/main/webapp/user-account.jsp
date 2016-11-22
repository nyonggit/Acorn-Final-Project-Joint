<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <title>RE:MIND || MY INFORMATION</title>

    <!-- Essential styles -->
    <link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="resources/assets/fancybox/jquery.fancybox.css?v=2.1.5" media="screen"> 
     
    <!-- Boomerang styles -->
        <link id="wpStylesheet" type="text/css" href="resources/css/global-style.css" rel="stylesheet" media="screen">
        

    <!-- Favicon -->
    <link href="resources/images/favicon.png" rel="icon" type="image/png">

    <!-- Assets -->
    <link rel="stylesheet" href="resources/assets/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/assets/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="resources/assets/sky-forms/css/sky-forms.css">    
    <!--[if lt IE 9]>
        <link rel="stylesheet" href="resources/assets/sky-forms/css/sky-forms-ie8.css">
    <![endif]-->

    <!-- Required JS -->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>

    <!-- Page scripts -->
    
</head>
<body>
<!-- MODALS -->

<!-- MOBILE MENU - Option 2 -->
<section id="navMobile" class="aside-menu left">
    <form class="form-horizontal form-search">
        <div class="input-group">
            <input type="search" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
                <button id="btnHideMobileNav" class="btn btn-close" type="button" title="Hide sidebar"><i class="fa fa-times"></i></button>
            </span>
        </div>
    </form>
    <div id="dl-menu" class="dl-menuwrapper">
        <ul class="dl-menu"></ul>
    </div>
</section> 

<!-- SLIDEBAR -->
<section id="asideMenu" class="aside-menu right">
    <form class="form-horizontal form-search">
        <div class="input-group">
            <input type="search" class="form-control" placeholder="Search..." />
            <span class="input-group-btn">
                <button id="btnHideAsideMenu" class="btn btn-close" type="button" title="Hide sidebar"><i class="fa fa-times"></i></button>
            </span>
        </div>
    </form>
    
    <h5 class="side-section-title">Optional sidebar menu</h5>
    <div class="nav">
        <ul>
            <li>
                <a href="#">Home</a>
            </li>
            <li>
                <a href="#">About us</a>
            </li>
            <li>
                <a href="#">Blog</a>
            </li>
            <li>
                <a href="#">Work</a>
            </li>
            <li>
                <a href="#">Online shop</a>
            </li>
        </ul>
    </div>
    
    <h5 class="side-section-title">Social media</h5>
    <div class="social-media">
        <a href="#"><i class="fa fa-facebook facebook"></i></a>
        <a href="#"><i class="fa fa-google-plus google"></i></a>
        <a href="#"><i class="fa fa-twitter twitter"></i></a>
    </div>
    
    <h5 class="side-section-title">Contact information</h5>
    <div class="contact-info">
        <h5>Address</h5>
        <p>5th Avenue, New York - United States</p>
        
        <h5>Email</h5>
        <p>hello@webpixels.ro</p>
        
        <h5>Phone</h5>
        <p>+10 724 1234 567</p>
    </div>
</section>

<!-- MAIN WRAPPER -->
<div class="body-wrap">
    <!-- This section is only for demonstration purpose only. Check out the docs for more informations" -->
    <div id="divStyleSwitcher" class="style-switcher-slidebar">
    <a href="#" id="cmdShowStyleSwitcher" class="open-panel hidden-xs"><i class="fa fa-cog"></i></a>
    <div class="switch-panel">
        <h3>Boomerang - Style Builder</h3>
        <div class="panel-section">
            <h4 class="title text-uppercase font-normal">Layout options</h4>

            <div class="row">
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>I prefer it:</label> 
                        <select id="cmbLayoutStyle" class="form-control">
                            <option value="1">Fluid</option>
                            <option value="2">Boxed</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label></label>
                        <select id="cmbLayoutColor" class="form-control">
                            <option value="1">Light</option>
                            <option value="2">Dark</option>
                        </select>
                    </div>
                </div>
            </div>

            <label class="mt-10">Predefined body backgrounds</label>
            <span class="clearfix"></span>
            <span id="cmbBodyBg" class="color-switch">
                <a href="#" id="cmdBodyBg1" class="body-bg-1 ttip" data-toggle="bottom" title="Solid color"></a>
                <a href="#" id="cmdBodyBg2" class="body-bg-2 ttip" data-toggle="bottom" title="Black Lozenge"></a>
                <a href="#" id="cmdBodyBg3" class="body-bg-3 ttip" data-toggle="bottom" title="Squairy Light"></a>
                <a href="#" id="cmdBodyBg4" class="body-bg-4 ttip" data-toggle="bottom" title="Dark Dotted"></a>
                <a href="#" id="cmdBodyBg5" class="body-bg-5 ttip" data-toggle="bottom" title="Skulls"></a>
                <a href="#" id="cmdBodyBg6" class="body-bg-6 ttip" data-toggle="bottom" title="Image Background - 1"></a>
                <a href="#" id="cmdBodyBg7" class="body-bg-7 ttip" data-toggle="bottom" title="Image Background - 2"></a>
                <span class="clearfix"></span>
            </span>

            <div class="row">
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>Section title:</label>
                        <select id="cmbSectionTitleStyle" class="form-control">
                            <option value="1">Style 1</option>
                            <option value="2">Style 2</option>
                            <option value="3">Style 3</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>Color:</label>
                        <select id="cmbSectionTitleColor" class="form-control" disabled="disabled">
                            <option value="1">Base</option>
                            <option value="2">Alt Base</option>
                            <option value="3">Light</option>
                            <option value="4">Dark</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>   

        <hr> 

        <div class="panel-section">
            <h4 class="title text-uppercase font-normal">Header options</h4> 

            <div class="row">
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>Header:</label>
                        <select id="cmbHeaderStyle" class="form-control">
                            <option value="2">Header 1: Default navbar</option>
                            <option value="3">Header 2: Default navbar + Top header</option>
                            <option value="1">Header 3: Header + Navbar</option>
                            <option value="4">Header 4: Cover</option>
<!-- 
                            <option value="5">Header 1: Default + Mobile nav 2</option>
                            <option value="6">Header 2: Default + Top header + Mobile nav 2</option>
                            <option value="7">Header 3: Header + Navbar + Mobile nav 2</option>
                            <option value="8">Header 4: Cover</option> -->
                        </select>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>Top header color:</label>
                        <select id="cmbTopHeaderColor" class="form-control" disabled="disabled">
                            <option value="1">Light</option>
                            <option value="2">Dark</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>     

        <div class="panel-section">
            <div class="row">
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>Nav shadow</label>
                        <select id="cmbNavShadow" class="form-control">
                            <option value="1">No</option>
                            <option value="2">Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label>Dropdown arrow:</label>
                        <select id="cmbNavDropdownArrow" class="form-control">
                            <option value="2">Yes</option>
                            <option value="1">No</option>
                        </select>
                    </div>
                </div>          
            </div>
        </div>   

        <hr>

        <div class="panel-section">
            <h4 class="title text-uppercase font-normal">Color options</h4>

            <label>Predefined colors</label>
            <span class="clearfix"></span>
            <span class="color-switch">
                <a href="#" id="cmdSchemeRed" class="color-red" title="Red">Red</a>
                <a href="#" id="cmdSchemeViolet" class="color-violet" title="Violet">Violet</a>
                <a href="#" id="cmdSchemeBlue" class="color-blue" title="Blue">Blue</a>
                <a href="#" id="cmdSchemeGreen" class="color-green" title="Green">Green</a>
                <a href="#" id="cmdSchemeYellow" class="color-yellow" title="Yellow">Yellow</a>
                <a href="#" id="cmdSchemeOrange" class="color-orange" title="Orange">Orange</a>
            </span>
        </div>

        <hr>

        <div class="panel-section">
            <h4 class="title">
                <span class="text-uppercase font-normal">Special</span> 
                <a href="#" class="pop" title="About customization" data-content="We created some examples that show you the multitude of options you have so you make this template as you wish. <br><br>Customization is very easy and it is made in only one file.">
                    <i class="fa fa-question-circle"></i>
                </a>
                <label class="badge base pull-right">New</label>
            </h4>

            <label>Predefined schemes</label>
            <span class="clearfix"></span>
            <span class="color-switch">
                <a href="#" id="cmdSchemeBW" class="color-bw ttip" data-toggle="top" title="Black & White">Black and white</a>
                <a href="#" id="cmdSchemeDark" class="color-dark ttip" data-toggle="top" title="Dark">Dark</a>
                <a href="#" id="cmdSchemeFlat" class="color-flat ttip" data-toggle="top" title="Flat">Flat</a>
            </span>

        </div>

        <div class="panel-section mt-15 hide">
            <a href="#"><span>Reset all applied styles</span></a>
            <br><br>
        </div>

    </div>
</div>
            <!-- HEADER -->
        <div id="divHeaderWrapper">
            <header class="header-standard-2">     
    <!-- MAIN NAV -->
    <div class="navbar navbar-wp navbar-arrow mega-nav" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle navbar-toggle-aside-menu">
                    <i class="fa fa-outdent icon-custom"></i>
                </button>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <i class="fa fa-bars icon-custom"></i>
                </button>

                <a class="navbar-brand" href="index.html" title="Boomerang | One template. Infinite solutions">
                    <img src="resources/images/boomerang-logo-black.png" alt="Boomerang | One template. Infinite solutions">
                </a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-md hidden-lg">
                        <div class="bg-light-gray">
                            <form class="form-horizontal form-light p-15" role="form">
                                <div class="input-group input-group-lg">
                                    <input type="text" class="form-control" placeholder="I want to find ...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-white" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </li>
                    <li class="dropdown dropdown-meganav mega-dropdown-fluid">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home</a>
                        <ul class="dropdown-menu">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3 mega-nav-section-wr">
                                        <div class="mega-nav-section">
                                            <img src="resources/images/prv/wk-big-img-9.jpg" class="img-responsive img-thumbnail hidden-xs hidden-sm" alt="">
                                            <h3 class="mega-nav-section-title">Business &amp; Other</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="homepage-business-1.html">Homepage: Business 1</a></li>
                                                <li><a href="homepage-business-2.html">Homepage: Business 2</a></li>
                                                <li><a href="homepage-cover.html">Homepage: Cover</a></li>
                                                <li><a href="homepage-shop-1.html">Homepage: Boomerang Shop</a></li>
                                                <li><a href="homepage-fashion-1.html">Homepage: Fashion Shop</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mega-nav-section-wr">
                                        <div class="mega-nav-section"> 
                                            <img src="resources/images/prv/wk-big-img-10.jpg" class="img-responsive img-thumbnail hidden-xs hidden-sm hidden-xs hidden-sm" alt="">
                                            <h3 class="mega-nav-section-title">Agencies &amp; Creatives</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="homepage-agency-1.html">Homepage: Agency</a></li>
                                                <li><a href="homepage-estate-1.html">Homepage: Real Estate</a></li>
                                                <li><a href="homepage-jobs-1.html">Homepage: Jobs</a></li>
                                                <li><a href="homepage-models-1.html">Homepage: Models</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mega-nav-section-wr">
                                        <div class="mega-nav-section">
                                            <img src="resources/images/prv/wk-big-img-11.jpg" class="img-responsive img-thumbnail hidden-xs hidden-sm" alt="">
                                            <h3 class="mega-nav-section-title">News &amp; Media</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="homepage-magazine-1.html">Homepage: Magazine</a></li>
                                                <li><a href="homepage-newspaper-1.html">Homepage: Newspaper</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="mega-nav-section">
                                            <img src="resources/images/prv/wk-big-img-12.jpg" class="img-responsive img-thumbnail hidden-xs hidden-sm" alt="">
                                            <h3 class="mega-nav-section-title">Institutions</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="homepage-school-1.html">Homepage: School</a></li>
                                                <li><a href="homepage-medical-1.html">Homepage: Medical</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">About us</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="about-1.html">About us: 1</a></li>
                                    <li><a tabindex="-1" href="about-2.html">About us: 2</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Team</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="team-list-1.html">Team members: 1</a></li>
                                    <li><a tabindex="-1" href="team-list-2.html">Team members: 2</a></li>
                                    <li><a tabindex="-1" href="team-member-1.html">Single team member: 1</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Services</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="services-1.html">Services: 1</a></li>
                                    <li><a tabindex="-1" href="services-2.html">Services: 2</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Jobs</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="jobs-listing-1.html">Jobs listing: 1</a></li>
                                    <li><a tabindex="-1" href="job-description-1.html">Job description</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Pricing plans</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="pricing-1.html">Pricing: 1</a></li>
                                    <li><a tabindex="-1" href="pricing-2.html">Pricing: 2</a></li>
                                    <li><a tabindex="-1" href="pricing-3.html">Pricing: 3</a></li>
                                    <li><a tabindex="-1" href="pricing-4.html">Pricing: 4</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Sign in</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="sign-in-1.html">Sign in: 1</a></li>
                                    <li><a tabindex="-1" href="sign-in-2.html">Sign in: 2</a></li>
                                    <li><a tabindex="-1" href="sign-in-3.html">Sign in: 3 (translucent)</a></li>
                                    <li><a tabindex="-1" href="sign-in-4.html">Sign in variations</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Sign up</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="sign-up-1.html">Sign up: 1</a></li>
                                    <li><a tabindex="-1" href="sign-up-2.html">Sign up: 2</a></li>
                                    <li><a tabindex="-1" href="sign-up-3.html">Sign up: 3 (translucent)</a></li>
                                    <li><a tabindex="-1" href="sign-up-4.html">Sign up variations</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Contact</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="contact-1.html">Contact: Fluid</a></li>
                                    <li><a tabindex="-1" href="contact-2.html">Contact: Two cols</a></li>
                                </ul>
                            </li>
                            <li><a href="timeline.html">Timeline</a></li>
                            <li><a href="listings.html">Listings</a></li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Helpful pages</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="404.html">Error 404</a></li>
                                    <li><a tabindex="-1" href="faq.html">FAQ</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Real Estate</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="homepage-estate-1.html">Homepage</a></li>
                                    <li><a tabindex="-1" href="estate-listing-1.html">Listing: List </a></li>
                                    <li><a tabindex="-1" href="estate-listing-2.html">Listing: Grid</a></li>
                                    <li><a tabindex="-1" href="estate-property.html">Property</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Jobs</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="homepage-jobs-1.html">Homepage</a></li>
                                    <li><a tabindex="-1" href="jobs-listing-1.html">Jobs listing</a></li>
                                    <li><a tabindex="-1" href="job-description-1.html">Job description</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Magazine &amp; Newspaper</a>
                                <ul class="dropdown-menu">
                                    <li class="divider">Magazine</li>
                                    <li><a tabindex="-1" href="homepage-magazine-1.html">Homepage</a></li>
                                    <li><a tabindex="-1" href="magazine-listing-1.html">Category listing: List</a></li>
                                    <li><a tabindex="-1" href="magazine-listing-2.html">Category listing: Grid</a></li>
                                    <li><a tabindex="-1" href="magazine-article-1.html">Magazine article</a></li>
                                    <li class="divider">Newspaper</li>
                                    <li><a tabindex="-1" href="homepage-newspaper-1.html">Newspaper homepage</a></li>
                                    <li><a tabindex="-1" href="newspaper-listing-1.html">Newspaper listing: List</a></li>
                                    <li><a tabindex="-1" href="newspaper-listing-2.html">Newspaper listing: Grid</a></li>
                                    <li><a tabindex="-1" href="magazine-article-1.html">Newspaper article</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Features</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Newsletter template</a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-submenu"><a tabindex="-1" href="#">Default</a>
                                        <ul class="dropdown-menu">
                                            <li><a tabindex="-1" href="newsletter/default/newsletter-default-1.html" target="_blank">Newsletter Default: Red</a></li>
                                            <li><a tabindex="-1" href="newsletter/default/newsletter-default-2.html" target="_blank">Newsletter Default: Purple</a></li>
                                            <li><a tabindex="-1" href="newsletter/default/newsletter-default-3.html" target="_blank">Newsletter Default: Blue</a></li>
                                            <li><a tabindex="-1" href="newsletter/default/newsletter-default-4.html" target="_blank">Newsletter Default: Green</a></li>
                                            <li><a tabindex="-1" href="newsletter/default/newsletter-default-5.html" target="_blank">Newsletter Default: Yellow</a></li>
                                            <li><a tabindex="-1" href="newsletter/default/newsletter-default-6.html" target="_blank">Newsletter Default: Orange</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown-submenu"><a tabindex="-1" href="#">Flat</a>
                                        <ul class="dropdown-menu">
                                            <li><a tabindex="-1" href="newsletter/flat/newsletter-flat-1.html" target="_blank">Newsletter Flat: Alizarin</a></li>
                                            <li><a tabindex="-1" href="newsletter/flat/newsletter-flat-2.html" target="_blank">Newsletter Flat: Amethyst</a></li>
                                            <li><a tabindex="-1" href="newsletter/flat/newsletter-flat-3.html" target="_blank">Newsletter Flat: Belize Hole</a></li>
                                            <li><a tabindex="-1" href="newsletter/flat/newsletter-flat-4.html" target="_blank">Newsletter Flat: Emerald</a></li>
                                            <li><a tabindex="-1" href="newsletter/flat/newsletter-flat-5.html" target="_blank">Newsletter Flat: Sun Flower</a></li>
                                            <li><a tabindex="-1" href="newsletter/flat/newsletter-flat-6.html" target="_blank">Newsletter Flat: Carrot</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown-submenu"><a tabindex="-1" href="#">Shop</a>
                                        <ul class="dropdown-menu">
                                            <li><a tabindex="-1" href="newsletter/shop/newsletter-shop-1.html" target="_blank">Newsletter Shop: Red</a></li>
                                            <li><a tabindex="-1" href="newsletter/shop/newsletter-shop-2.html" target="_blank">Newsletter Shop: Purple</a></li>
                                            <li><a tabindex="-1" href="newsletter/shop/newsletter-shop-3.html" target="_blank">Newsletter Shop: Blue</a></li>
                                            <li><a tabindex="-1" href="newsletter/shop/newsletter-shop-4.html" target="_blank">Newsletter Shop: Green</a></li>
                                            <li><a tabindex="-1" href="newsletter/shop/newsletter-shop-5.html" target="_blank">Newsletter Shop: Yellow</a></li>
                                            <li><a tabindex="-1" href="newsletter/shop/newsletter-shop-6.html" target="_blank">Newsletter Shop: Orange</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Components</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="wp-accordion.html">Accordion</a></li>
                                    <li><a tabindex="-1" href="wp-alerts.html">Alerts</a></li>
                                    <li><a tabindex="-1" href="wp-badges.html">Badges</a></li>
                                    <li><a tabindex="-1" href="wp-blocks-default.html">Blocks</a></li>
                                    <li><a tabindex="-1" href="wp-buttons-boomerang.html">Buttons</a></li>
                                    <li><a tabindex="-1" href="wp-callouts.html">Callouts</a></li>
                                    <li><a tabindex="-1" href="wp-carousels.html">Carousels</a></li>
                                    <li><a tabindex="-1" href="wp-counters.html">Counters</a></li>
                                    <li><a tabindex="-1" href="wp-pagination.html">Pagination</a></li>
                                    <li><a tabindex="-1" href="wp-progress-bars.html">Progress bars</a></li>
                                    <li><a tabindex="-1" href="wp-range-sliders.html">Range sliders</a></li>
                                    <li><a tabindex="-1" href="wp-rating-stars.html">Rating stars</a></li>
                                    <li><a tabindex="-1" href="wp-ribbons.html">Ribbons</a></li>
                                    <li><a tabindex="-1" href="wp-tabs.html">Tabs</a></li>
                                </ul>
                            </li> 
                            <li><a href="wp-typography-general.html">Typography</a></li>
                            <li><a href="wp-features.html">Features</a></li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-meganav mega-dropdown-fluid">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio</a>
                        <ul class="dropdown-menu">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3 mega-nav-section-wr">
                                        <div class="mega-nav-section">
                                            <h3 class="mega-nav-section-title">Gallery with no space</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="portfolio-two-col-boxed.html">Two columns grid: Boxed</a></li>
                                                <li><a href="portfolio-three-col-boxed.html">Three columns grid: Boxed</a></li>
                                                <li><a href="portfolio-four-col-boxed.html">Four columns grid: Boxed</a></li>
                                                <li><a href="portfolio-two-col-fluid.html">Two columns grid: Fluid</a></li>
                                                <li><a href="portfolio-three-col-fluid.html">Three columns grid: Fluid</a></li>
                                                <li><a href="portfolio-four-col-fluid.html">Four columns grid: Fluid</a></li>
                                                <li><a href="portfolio-five-col-fluid.html">Five columns grid: Fluid</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mega-nav-section-wr">
                                        <div class="mega-nav-section">
                                            <h3 class="mega-nav-section-title">Gallery with space n/text</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="portfolio-two-col-space-boxed.html">Two columns grid: Boxed</a></li>
                                                <li><a href="portfolio-three-col-space-boxed.html">Three columns grid: Boxed</a></li>
                                                <li><a href="portfolio-four-col-space-boxed.html">Four columns grid: Boxed</a></li>
                                                <li><a href="portfolio-two-col-space-fluid.html">Two columns grid: Fluid</a></li>
                                                <li><a href="portfolio-three-col-space-fluid.html">Three columns grid: Fluid</a></li>
                                                <li><a href="portfolio-four-col-space-fluid.html">Four columns grid: Fluid</a></li> 
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mega-nav-section-wr">
                                        <div class="mega-nav-section">
                                            <h3 class="mega-nav-section-title">Gallery with space w/ text</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="portfolio-two-col-text-boxed.html">Two columns grid with text</a></li>
                                                <li><a href="portfolio-three-col-text-boxed.html">Three columns grid with text</a></li>
                                                <li><a href="portfolio-four-col-text-boxed.html">Four columns grid with text</a></li>
                                                <li><a href="portfolio-two-col-header-boxed.html">Two columns grid with header</a></li>
                                                <li><a href="portfolio-three-col-header-boxed.html">Three columns grid with header</a></li> 
                                                <li><a href="portfolio-four-col-header-boxed.html">Four columns grid with header</a></li> 
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="mega-nav-section">
                                            <h3 class="mega-nav-section-title">Single project</h3>
                                            <ul class="mega-nav-ul">
                                                <li><a href="portfolio-single-project-horizontal.html">Single project: Horizontal</a></li>
                                                <li><a href="portfolio-single-project-vertical.html">Single project: Vertical</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog</a>
                        <ul class="dropdown-menu">
                            <li><a href="blog-grid-1.html">Blog: Grid one column</a></li>
                            <li><a href="blog-grid-2.html">Blog: Grid two columns</a></li>
                            <li><a href="blog-list-1.html">Blog: List one</a></li>
                            <li><a href="blog-fluid-1.html">Blog: Full width </a></li>
                            <li><a href="blog-masonry-1.html">Blog: Masonry w/ sidebar</a></li>
                            <li><a href="blog-masonry-2.html">Blog: Masonry three columns</a></li>
                            <li><a href="blog-masonry-3.html">Blog: Masonry four colums</a></li>
                            <li><a href="blog-post-1.html">Post: Standard</a></li>
                            <li><a href="blog-post-2.html">Post: Full width</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop</a>
                        <ul class="dropdown-menu">
                            <li><a href="homepage-shop-1.html">Homepage</a></li>
                            <li><a href="shop-product-list-1.html">Products: Full width</a></li>
                            <li><a href="shop-product-list-2.html">Products: With sidebar</a></li>
                            <li><a href="shop-product-single.html">Single product</a></li>
                            <li><a href="shop-cart.html">Cart</a></li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Checkout progress</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="shop-checkout-method.html">Checkout: Login-Register</a></li>
                                    <li><a tabindex="-1" href="shop-checkout-shipping.html">Checkout: Shipping</a></li>
                                    <li><a tabindex="-1" href="shop-checkout-payment.html">Checkout: Payment method</a></li>
                                    <li><a tabindex="-1" href="shop-checkout-order.html">Checkout: Order review</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Invoice</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="invoice-1.html">Invoice: New</a></li>
                                    <li><a tabindex="-1" href="invoice-2.html">Invoice: Paid</a></li>
                                    <li><a tabindex="-1" href="invoice-3.html">Invoice: Unpaid</a></li>
                                </ul>
                            </li>
                            <li><a href="user-account.html">User account</a></li>                            
                        </ul>
                    </li>
                    <li class="dropdown dropdown-aux animate-click" data-animate-in="animated bounceInUp" data-animate-out="animated fadeOutDown" style="z-index:500;">
                        <a href="#" class="dropdown-form-toggle" data-toggle="dropdown"><i class="fa fa-search"></i></a>
                        <ul class="dropdown-menu dropdown-menu-user animate-wr">
                            <li id="dropdownForm">
                                <div class="dropdown-form">
                                    <form class="form-horizontal form-light p-15" role="form">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="I want to find ...">
                                            <span class="input-group-btn">
                                                <button class="btn btn-base" type="button">Go</button>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown-aux">
                        <a href="#" id="cmdAsideMenu" class="dropdown-toggle dropdown-form-toggle" title="Open slidebar">
                            <i class="fa fa-outdent"></i>
                        </a>
                    </li>
                </ul>
               
            </div><!--/.nav-collapse -->
        </div>
    </div>
</header>        </div>

        <!-- Optional header components (ex: slider) -->
            
    <!-- MAIN CONTENT -->
        <div class="pg-opt">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>User account</h2>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Pages</a></li>
                        <li class="active">User account</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <section class="slice bg-white">
        <div class="wp-section user-account">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="user-profile-img">
                            <img src="resources/images/prv/team/team-agency-2.jpg" alt="">
                        </div>
                        <ul class="categories mt-20">
                            <li><a href="#">Personal informations</a></li>
                            <li><a href="#">Settings</a></li>
                            <li><a href="#">My orders</a></li>
                            <li><a href="#">Wishlist</a></li>
                        </ul>
                    </div>
                    <div class="col-md-9">                     
                        <div class="tabs-framed">
                            <ul class="tabs clearfix">
                                <li class="active"><a href="#tab-1" data-toggle="tab">About me</a></li>
                                <li><a href="#tab-2" data-toggle="tab">Order history</a></li>
                                <li><a href="#tab-3" data-toggle="tab">Whishlist</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="tab-1">
                                    <div class="tab-body">
                                        <dl class="dl-horizontal style-2">
                                            <h3 class="title title-lg">Personal information</h3>
                                            <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                                            
                                            <dt>Your name</dt>
                                            <dd>
                                                <span class="pull-left">Alexander Smith</span>
                                                <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right"><span>Edit</span></a>
                                            </dd>
                                            <hr>
                                            <dt>Email</dt>
                                            <dd>
                                            <span class="pull-left">name@example.com</span>
                                                <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right"><span>Edit</span></a>
                                            </dd>
                                            <hr>
                                            <dt>Phone</dt>
                                            <dd>
                                                <span class="pull-left">+40-722.123.456</span>
                                                <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right"><span>Edit</span></a>
                                            </dd>
                                            <hr>
                                            <dt>Address</dt>
                                            <dd>
                                                <span class="pull-left">Bucharest, Romania</span>
                                                <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right"><span>Edit</span></a>
                                            </dd>
                                            <hr>
                                            <dt>Company</dt>
                                            <dd>
                                                <span class="pull-left">Web Pixels</span>
                                                <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right"><span>Edit</span></a>
                                            </dd>
                                            
                                        </dl>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="tab-2">
                                    <div class="tab-body" style="padding-bottom: 0;">
                                        <h3 class="title title-lg">My orders</h3>
                                        <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                                    
                                    <table class="table table-orders table-bordered table-striped table-responsive no-margin">
                                        <tbody>
                                            <tr>
                                                <th>Order Number</th>
                                                <th>Date</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                                <th>Tracking</th>
                                            </tr>
                                        
                                            <tr>
                                                <td><a href="#">230320</a></td>
                                                <td>23-08-2014</td>
                                                <td>RON 2000.99</td>
                                                <td><i class="fa fa-check"></i> Shipped out</td>
                                                <td>
                                                    230320-x
                                                    <br>
                                                    <strong>via Fan Curier - Romania</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">230320</a></td>
                                                <td>23-08-2014</td>
                                                <td>RON 2000.99</td>
                                                <td><i class="fa fa-check"></i> Shipped out</td>
                                                <td>
                                                    230320-x
                                                    <br>
                                                    <strong>via Fan Curier - Romania</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">230320</a></td>
                                                <td>23-08-2014</td>
                                                <td>RON 2000.99</td>
                                                <td><i class="fa fa-check"></i> Shipped out</td>
                                                <td>
                                                    230320-x
                                                    <br>
                                                    <strong>via Fan Curier - Romania</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">230320</a></td>
                                                <td>23-08-2014</td>
                                                <td>RON 2000.99</td>
                                                <td><i class="fa fa-check"></i> Shipped out</td>
                                                <td>
                                                    230320-x
                                                    <br>
                                                    <strong>via Fan Curier - Romania</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">230320</a></td>
                                                <td>23-08-2014</td>
                                                <td>RON 2000.99</td>
                                                <td><i class="fa fa-check"></i> Shipped out</td>
                                                <td>
                                                    230320-x
                                                    <br>
                                                    <strong>via Fan Curier - Romania</strong>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="tab-3">
                                    <div class="tab-body">
                                        <h3 class="title title-lg">My wishlist</h3>
                                        <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>

                                        <div class="row">
                                            <!-- Product list -->
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Product list -->
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Product list -->
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="col">
                       <h4>Contact us</h4>
                       <ul>
                            <li>5th Avenue, New York - United States</li>
                            <li>Phone: +10 724 1234 567 | Fax: +10 724 1234 567 </li>
                            <li>Email: <a href="mailto:hello@example.com" title="Email Us">hello@example.com</a></li>
                            <li>Skype: <a href="skype:my.business?call" title="Skype us">my-business</a></li>
                            <li>Creating great templates is our passion</li>
                        </ul>
                     </div>
                </div>
                
                <div class="col-md-3">
                    <div class="col">
                        <h4>Mailing list</h4>
                        <p>Sign up if you would like to receive occasional treats from us.</p>
                        <form class="form-horizontal form-light">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Your email address...">
                                <span class="input-group-btn">
                                    <button class="btn btn-base" type="button">Go!</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="col col-social-icons">
                        <h4>Follow us</h4>
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-skype"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                        <a href="#"><i class="fa fa-youtube-play"></i></a>
                        <a href="#"><i class="fa fa-flickr"></i></a>
                    </div>
                </div>

                 <div class="col-md-3">
                    <div class="col">
                        <h4>About us</h4>
                        <p class="no-margin">
                        Boomerang MultiPurpose Template is a multi-solution product made with simplicity in mind so you can benefit as much as possible from it.
                        <br><br>
                        <a href="#" class="btn btn-block btn-base btn-icon fa-check"><span>Try it now</span></a>
                        </p>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-lg-9 copyright">
                    2014 Â© Web Pixels. All rights reserved.
                    <a href="#">Terms and conditions</a>
                </div>
                <div class="col-lg-3">
                    <a href="http://www.webpixels.ro" title="Made with love by Web Pixels" target="_blank" class="">
                        <img src="resources/images/webpixels-footer-logo.png" alt="Web Pixels - Designing Forward | Logo" class="pull-right">
                    </a>
                </div>
            </div>
        </div>
    </footer>
</div>

<!-- Essentials -->
<script src="resources/js/modernizr.custom.js"></script>
<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="resources/js/jquery.easing.js"></script>
<script src="resources/js/jquery.metadata.js"></script>
<script src="resources/js/jquery.hoverup.js"></script>
<script src="resources/js/jquery.hoverdir.js"></script>
<script src="resources/js/jquery.stellar.js"></script>

<!-- Boomerang mobile nav - Optional  -->
<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.js"></script>
<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.autofill.js"></script>

<!-- Forms -->
<script src="resources/assets/ui-kit/js/jquery.powerful-placeholder.min.js"></script> 
<script src="resources/assets/ui-kit/js/cusel.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.form.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.validate.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.maskedinput.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.modal.js"></script>

<!-- Assets -->
<script src="resources/assets/hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script src="resources/assets/page-scroller/jquery.ui.totop.min.js"></script>
<script src="resources/assets/mixitup/jquery.mixitup.js"></script>
<script src="resources/assets/mixitup/jquery.mixitup.init.js"></script>
<script src="resources/assets/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
<script src="resources/assets/waypoints/waypoints.min.js"></script>
<script src="resources/assets/milestone-counter/jquery.countTo.js"></script>
<script src="resources/assets/easy-pie-chart/js/jquery.easypiechart.js"></script>
<script src="resources/assets/social-buttons/js/rrssb.min.js"></script>
<script src="resources/assets/nouislider/js/jquery.nouislider.min.js"></script>
<script src="resources/assets/owl-carousel/owl.carousel.js"></script>
<script src="resources/assets/bootstrap/js/tooltip.js"></script>
<script src="resources/assets/bootstrap/js/popover.js"></script>

<!-- Sripts for individual pages, depending on what plug-ins are used -->

<!-- Boomerang App JS -->
<script src="resources/js/wp.app.js"></script>
<!--[if lt IE 9]>
    <script src="resources/js/html5shiv.js"></script>
    <script src="resources/js/respond.min.js"></script>
<![endif]-->

<!-- Temp -- You can remove this once you started to work on your project -->
<script src="resources/js/jquery.cookie.js"></script>
<script src="resources/js/wp.switcher.js"></script>
<script type="text/javascript" src="resources/js/wp.ga.js"></script>


</body>
</html>