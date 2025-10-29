# ParlaMapper 🗺️

ParlaMapper is a lightweight, Java-powered web application that renders interactive Leaflet maps within a Jetty servlet environment. It allows users to explore dynamic map layers like population density, terrain, and satellite views through a clean, responsive UI.

## 🚀 Features

- Jetty-based servlet architecture with JSP rendering
- Leaflet.js integration for interactive map tiles
- Dynamic tile switching via dropdown menu
- Thunderforest tile support with secure API key injection
- Custom logging via `java.util.logging`
- Stylized landing page with CSS overlay and background image
- Clean static resource handling (CSS, images, JS)

## 🧰 Tech Stack

- Java (Servlets + JSP)
- Jetty (embedded server)
- Maven (build and dependency management)
- Leaflet.js (map rendering)
- HTML/CSS (frontend styling)

## 📸 Demo

![screenshot](images/map-bg.jpg)
_Stylized landing page with map type selector and Leaflet integration._

## 🔧 Setup

1. Clone the repo:
   ```bash
      git clone https://github.com/samparlatore/ParlaMapper.git
      cd ParlaMapper

2. Create a a config.properties file in the root directory and add your Thunderforest API key to it in the following format:
   ```bash
        mapbox.token=pk.your-secret-token-here
        thunderforest.token={Thunderforest API key}

3. Build:
     ```bash
        mvn clean package dependency:copy-dependencies -DoutputDirectory=lib
4. Run
    ```bash
        java -cp "target/ParlaMapper-1.0-SNAPSHOT.jar;lib/*" com.parlAquatics.Main

      (On macOS/Linux, use `:` instead of `;` in the classpath)


