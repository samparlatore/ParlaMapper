<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.logging.Logger" %>
<%
  Logger log = Logger.getLogger("JSPLogger");
  log.info("Leaflet page rendered for " + request.getRemoteAddr());
%>
<html>
<head>
  <title><%= application.getAttribute("pageTitle") %></title>
  <link rel="stylesheet" href="css/base.css" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
  <script src="https://unpkg.com/leaflet/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
</head>
<body>
    <div id="map"></div>
    <script>
        var map = L.map('map').setView([48.8310, -121.6029], 13);

    var token = '<%= application.getAttribute("thunderforestToken") %>';
    var mapTileSource = 'https://tile.thunderforest.com/landscape/{z}/{x}/{y}.png?apikey=' + token;
    var tiles = L.tileLayer(mapTileSource, {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.thunderforest.com">Thunderforest</a>'
    }).addTo(map);

    </script>
    <div class="attribution">
        Maps © <a href="https://www.thunderforest.com/">Thunderforest</a>,
        Data © <a href="https://www.openstreetmap.org/copyright">OpenStreetMap contributors</a>
    </div>
</body>
</html>