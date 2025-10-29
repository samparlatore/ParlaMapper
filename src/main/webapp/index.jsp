<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.logging.Logger" %>
<%
  Logger log = Logger.getLogger("JSPLogger");
  log.info("Leaflet page rendered for " + request.getRemoteAddr());
%>
<!DOCTYPE html>
<html>
<head>
    <title>ParlaMapper</title>
    <link rel="stylesheet" href="css/base.css" />
</head>
<body>
  <div class="overlay">
    <h1>Explore ParlaMapper</h1>
    <form action="map" method="get">
        <select name="mapType">
            <option value="population density">Population Density</option>
            <option value="terrain">Terrain Map</option>
            <option value="neighbourhood">Neighbourhoods</option>
        </select>
        <button type="submit">Go</button>
    </form>
  </div>
  <div class="attribution">
    <a href="http://parlAquatics.com">Webpage by sam</a>
    <a href="http://www.freepik.com">Background Image by macrovector_official / Freepik</a>
  </div>
</body>
</html>
