<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.logging.Logger" %>
<%
  Logger log = Logger.getLogger("JSPLogger");
  log.info("Leaflet page rendered for " + request.getRemoteAddr());
%>
<html>
<head>
  <title><%= application.getAttribute("pageTitle") %></title>
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
  <link rel="stylesheet" href="css/base.css" />
  <script src="https://unpkg.com/leaflet/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
  <script src="js/us-states.js"></script>
</head>
<body>
  <div id="map"></div>
    <script>
        var map = L.map('map').setView([37.8, -96], 5);

        var tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);


        function getColor(d) {
            return d > 1000 ? '#800026' :
                   d > 500  ? '#BD0026' :
                   d > 200  ? '#E31A1C' :
                   d > 100  ? '#FC4E2A' :
                   d > 50   ? '#FD8D3C' :
                   d > 20   ? '#FEB24C' :
                   d > 10   ? '#FED976' :
                              '#FFEDA0';
        }

        function style(feature) {
          return {
            fillColor: getColor(feature.properties.density),
            weight: 2,
            opacity: 1,
            color: 'white',
            dashArray: '3',
            fillOpacity: 0.45
          };
        }

        function highlightFeature(e) {
            var layer = e.target;
            layer.setStyle({
                weight: 2,
                color: '#4249ad',
                dashArray: '',
                fillOpacity: 0.0,
            });
            layer.bringToFront();
            info.update(layer.feature.properties);
        }

        function resetHighlight(e) {
            const layer = e.target;
            // Delay the reset by 100ms
            resetTimeout = setTimeout(() => {
                geojson.resetStyle(layer);
                resetTimeout = null;
            }, 100);
        }

        function zoomToFeature(e) {
            const layer = e.target;
            const bounds = layer.getBounds();
            map.flyToBounds(bounds, {
                animate: true,
                duration: 0.75 // seconds
            });
            const center = bounds.getCenter();
            L.popup()
                .setLatLng(center)
                .setContent(layer.feature.properties.name + "<br>Density: " + layer.feature.properties.density)
                .openOn(map);
        }

        function onEachFeature(feature, layer) {
            layer.on({
                mouseover: highlightFeature,
                mouseout: resetHighlight,
                click: zoomToFeature
            });
            layer.bindPopup(
                "<div class='state-popup'>" +
                    "<h1>" + feature.properties.name + "</h1>" +
                    "<p>Density: " + feature.properties.density + ' people / mi<sup>2</sup>' + "</p>" +
                "</div>"
            );
        }


        var geojson = L.geoJSON(statesData, { style: style, onEachFeature: onEachFeature }).addTo(map);

        //Add information box to the upper right corner
        var info = L.control();

        info.onAdd = function (map) {
            this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
            this.update();
            return this._div;
        };

        // method that we will use to update the control based on feature properties passed
        info.update = function (props) {
            this._div.innerHTML = '<h4>US Population Density</h4>' +  (props ?
                '<b>' + props.name + '</b><br />' + props.density + ' people / mi<sup>2</sup>'
                : 'Hover over a state');
        };
        info.addTo(map);

        //Add legend to lower right corner
        var legend = L.control({position: 'bottomright'});
        legend.onAdd = function (map) {
            var div = L.DomUtil.create('div', 'info legend'),
                grades = [0, 10, 20, 50, 100, 200, 500, 1000],
                labels = [];
            // loop through our density intervals and generate a label with a colored square for each interval
            for (var i = 0; i < grades.length; i++) {
                div.innerHTML +=
                    '<i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
                    grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '<br>' : '+');
            }
            return div;
        };
        legend.addTo(map);
  </script>
</body>
</html>