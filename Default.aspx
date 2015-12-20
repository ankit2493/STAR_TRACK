<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Star Track </title>
    <link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div id="banner" align="center">
        <object type="application/x-shockwave-flash" data="images/bannernow.swf" width="900" height="150">
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
                <li><a href="Default.aspx" class="active">Home</a></li>
                <li><a href="search.aspx">Search</a></li>
                <li><a href="gallery.htm">Gallery</a></li>
                <li><a href="simulation.htm">Simulation</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </div>
   
    <br />
    <br />
    
    <div id="content_box" align="center" style="background-repeat: repeat">
    <hr />
    <br />
    <p style="top: 3px; right: 3px; bottom: 3px; left: 3px;  margin-left:40px;margin-right:40px">
            <strong style="font-family: 'Tekton Pro'; line-height: normal; vertical-align: top; text-align: justify; text-indent: 2pt; white-space: normal; word-spacing: normal; letter-spacing: normal; position: relative; float: left; font-weight: bold; top: 0px; left: 0px;">This website is simple tracking software to track celestial bodies. As standard
                local time at any time varies we need a uniform time which can help in tracking
                the motion of the sky. This uniform time is called sidereal or astronomical time,<img src="images/intro.jpg" float="right" 
                alt="" align="right" style="height: 249px; width: 294px; position: relative; float: right; top: 5px; right: 20px; bottom: 3px; left: 10px; clip: rect(auto, auto, auto, auto);"/>
                it is calculated based on local date and time at any place and is independent of
                the coordinates of the place unlike local time. Just as any point on earth can be
                specified using two values namely latitude and longitude, points in the sky or the
                celestial sphere, as it is called in technical terms, can be specified used declination
                and right ascension. Declination of an object specifies its height in the sky where
                as with the help of right ascension we can calculate its lateral location or how
                west or east an object is. We have used the bright star catalogue for taking data
                of coordinates of some of the well known objects. User has to just enter the location,
                local time and date together with the object they want to track, using all these
                details our software will calculate sidereal time which together with the object
                celestial coordinates will tell its precise location at that time in the sky.</strong></p>
                
    <br />
    
    </div>
    
    <br />
    <div align="center" style="background-color:ThreeDShadow" height:"2px">
    <h2>Designed by Ankit Agarwal, Prerak Garg, Ankur Kumar</h1>
    </div>
    </form>
</body>
</html>
