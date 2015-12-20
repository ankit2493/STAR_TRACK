
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/slicebox.css" />
		<link rel="stylesheet" type="text/css" href="css/custom.css" />
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
    <div class="wrapper">

				<ul id="sb-slider" class="sb-slider">
					<li>
						<a href="#" target="_blank"><img src="gallery/a.jpg" alt="image1"/></a>
					</li>
					<li>
						<a href="#" target="_blank"><img src="gallery/b.jpg" alt="image2"/></a>
					</li>
					<li>
						<a href="#" target="_blank"><img src="gallery/c.jpg" alt="image1"/></a>
					</li>
					<li>
						<a href="#" target="_blank"><img src="gallery/d.jpg" alt="image1"/></a>
											</li>
					<li>
						<a href="#" target="_blank"><img src="gallery/e.jpg" alt="image1"/></a>
						</li>
					<li>
						<a href="#" target="_blank"><img src="gallery/f.jpg" alt="image1"/></a>
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

			</div><!-- /wrapper -->

     <form id="form1" runat="server">
     
    </form>
</body>
</html>
