<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Your Star</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 349px;
        }
        .style4
        {
            height: 17px;
        }
        .style5
        {
            width: 56px;
        }
        .style6
        {
            height: 85px;
        }
        .style7
        {
            width: 437px;
        }
        .style11
        {
            width: 256px;
        }
    </style>
    <script type="text/javascript">
        var credentials = "AoSq1dl30s1fGKhAypdveV4davcKHxEx_blwZ5aatgXzCNEFkAQHp_GYVvE9dzZi";
        function calculateCoordinates() {
            var city = document.getElementById('<%=city.ClientID%>');
            var address = city.value;
            var geocodeRequest = "http://dev.virtualearth.net/REST/v1/Locations?query=" + encodeURI(address) + "&output=json&jsonp=GeocodeCallback&key=" + credentials;
            CallRestService(geocodeRequest);
        }

        function CallRestService(request) {
            var script = document.createElement("script");
            script.setAttribute("type", "text/javascript");
            script.setAttribute("src", request);
            document.body.appendChild(script);
        }
        function GeocodeCallback(result) {

            var latt = document.getElementById('<%=latt.ClientID%>');
            var longt = document.getElementById('<%=longt.ClientID%>');

            if (result &&
               result.resourceSets &&
               result.resourceSets.length > 0 &&
               result.resourceSets[0].resources &&
               result.resourceSets[0].resources.length > 0) {

                latt.value = result.resourceSets[0].resources[0].point.coordinates[0];
                longt.value = result.resourceSets[0].resources[0].point.coordinates[1];

            }

        }
        function ShowProcessImage() {
            var autocomplete = document.getElementById('name');
            autocomplete.style.backgroundImage = 'url(images/loading1.gif)';
            autocomplete.style.backgroundRepeat = 'no-repeat';
            autocomplete.style.backgroundPosition = 'right';
        }
        function HideProcessImage() {
            var autocomplete = document.getElementById('name');
            autocomplete.style.backgroundImage = 'none';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
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
                <li><a href="search.aspx" class="active">Search</a></li>
                <li><a href="gallery.htm">Gallery</a></li>
                <li><a href="simulation.htm">Simulation</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </div>
    <br />
    <br />
    <div id="content_box" align="left" style="background-repeat: repeat; color: #FFFFFF;
        font-weight: 600; font-family: 'Adobe Garamond Pro Bold'; font-size: 23px">
        <br />
        <table style="vertical-align: inherit">
            <tr>
                <td align="left" colspan="2">
                    Name of the Star
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="name" runat="server" Height="28px" Width="195px" Font-Bold="True"></asp:TextBox>
                    <ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
      TargetControlID="name" ServiceMethod="AutoCompletionList" 
        UseContextKey="True" MinimumPrefixLength="1" OnClientPopulating="ShowProcessImage" OnClientPopulated="HideProcessImage">
       </ajax:AutoCompleteExtender>
                    <asp:Button ID="get" runat="server" Text="Get Values" Width="75px" OnClick="get_Click"
                        BackColor="#333333" Font-Bold="True" Font-Names="Trebuchet MS" ForeColor="White" />
                    &nbsp;&nbsp;
                </td>
                <td align="left" class="style7" rowspan="10">
                    <asp:Image ID="Image1" runat="server" AlternateText="Image" BackColor="#FFFFCC" BorderColor="#336699"
                        BorderStyle="Ridge" Height="98%" Width="98%" Visible="false" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    Constellation of Star
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="constellation" runat="server" Height="28px" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    Right Ascension
                </td>
                <td align="left" class="style2" colspan="2">
                    <asp:TextBox ID="ra" runat="server" Height="28px" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    Declination
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="dect" runat="server" Height="28px" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    Date&nbsp;
                </td>
                <td align="left">
                    <asp:TextBox ID="date" runat="server" Height="28px" Width="124px"></asp:TextBox>
                </td>
                <td align="left" class="style5">
                    Time
                </td>
                <td align="left" class="style11">
                    &nbsp;<asp:TextBox ID="time" runat="server" Height="28px" Width="125px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    City
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="city" runat="server" Height="28px" Width="195px" onchange="calculateCoordinates();" OnClientPopulating="ShowProcessImage()" OnClientPopulated="HideProcessImage()"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    &nbsp;Lattitude
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="latt" runat="server" Height="28px" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    Longitude
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="longt" runat="server" Height="28px" Width="195px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="4" valign="top" class="style4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="submit" runat="server" Text="Submit" Width="105px" OnClick="submit_Click1"
                        BackColor="#999966" Font-Bold="True" Font-Names="Trebuchet MS" ForeColor="White" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="reset" runat="server" Text="Reset" Width="107px" OnClick="reset_Click"
                        BackColor="#999966" Font-Bold="True" Font-Names="Trebuchet MS" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" colspan="4" class="style6">
                    <hr />
                    Result<br />
                    <asp:TextBox ID="result" runat="server" Height="153px" TextMode="MultiLine" Width="541px"
                        BackColor="#333333" BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px"
                        Font-Bold="True" Font-Size="16pt" ForeColor="White" Style="resize: none"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
   </div>
    <br />
    <div align="center" style="background-color:ThreeDShadow" height:"2px">
    <h2>Designed by Ankit Agarwal, Prerak Garg, Ankur Kumar</h2>
    </div>
    </form>
</body>
</html>

