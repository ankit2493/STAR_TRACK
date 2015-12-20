<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" type="text/css" href="css/slicebox.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/custom.css" />
	<link href="styles.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="js/modernizr.custom.46884.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.slicebox.js"></script>
		<script type="text/javascript">
		    $(function () {
		        var Page = (function () {

		            var $navArrows = $('#nav-arrows').hide(),
						$navDots = $('#nav-dots').hide(),
						$nav = $navDots.children('span'),
						$shadow = $('#shadow').hide(),
						slicebox = $('#sb-slider').slicebox({
						    onReady: function () {

						        $navArrows.show();
						        $navDots.show();
						        $shadow.show();

						    },
						    onBeforeChange: function (pos) {

						        $nav.removeClass('nav-dot-current');
						        $nav.eq(pos).addClass('nav-dot-current');

						    }
						}),

						init = function () {

						    initEvents();

						},
						initEvents = function () {

						    // add navigation events
						    $navArrows.children(':first').on('click', function () {

						        slicebox.next();
						        return false;

						    });

						    $navArrows.children(':last').on('click', function () {

						        slicebox.previous();
						        return false;

						    });

						    $nav.each(function (i) {

						        $(this).on('click', function (event) {

						            var $dot = $(this);

						            if (!slicebox.isActive()) {

						                $nav.removeClass('nav-dot-current');
						                $dot.addClass('nav-dot-current');

						            }

						            slicebox.jump(i + 1);
						            return false;

						        });

						    });

						};

		            return { init: init };

		        })();

		        Page.init();

		    });
		</script>
</head>
<body>
     <div id="banner" align="center">
        <object type="application/x-shockwave-flash" data="images/bannernow.swf" width="900"
            height="150">
            <param name="movie" value="bannernow.swf" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <param name="play" value="true" />
            <param name="loop" value="true" />
            <param name="wmode" value="window" />
            <param name="scale" value="showall" />
            <param name="menu" value="true" />
            <param name="devicefont" value="false" />
            <param name="salign" value="" />
            <param name="allowScriptAccess" value="sameDomain" />
        </object>
    </div>
    <div id="wrapper1">
        <div id="cssmenu">
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="search.aspx">Search</a></li>
                <li><a href="gallery.aspx" class="active">Gallery</a></li>
                <li><a href="#">Algorithm</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </div>
    <br />
    <br />
    <div class="wrapper">
     <ul id="sb-slider" class="sb-slider">
					<li>
					<img src="gallery/a.jpg" alt="image1"/>
					</li>
					<li>
					<img src="gallery/b.jpg" alt="image2"/>
					</li>
					<li>
					<img src="gallery/c.jpg" alt="image1"/>
					</li>
					<li>
					<img src="gallery/d.jpg" alt="image1"/>
					</li>
					<li>
					<img src="gallery/e.jpg" alt="image1"/>
					</li>
					<li>
					<img src="gallery/f.jpg" alt="image1"/>
					</li>
				</ul>
              <div id="shadow" class="shadow"></div>
               <div id="nav-arrows" class="nav-arrows">
					<a href="#">Next</a>
					<a href="#">Previous</a>
				</div>

				<div id="nav-dots" class="nav-dots">
					<span class="nav-dot-current"></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</div>

			</div>
</body>
</html>
