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

![screenshot](src/main/webapp/images/map-bg3.jpg)
_Stylized landing page with map type selector and Leaflet integration._

## ⚡ Quickstart

    Windows
```bash
        git clone https://github.com/samparlatore/ParlaMapper.git
        cd ParlaMapper
        echo "mapbox.token=pk.your-secret-token-here`nthunderforest.token=Thunderforest API key" > config.properties
        mvn clean package
        mvn dependency:copy-dependencies -DoutputDirectory=lib
        java -cp "target/ParlaMapper-1.0-SNAPSHOT.jar;lib/*" com.parlAquatics.Main
```
    MacOS/Linux
```bash
        git clone https://github.com/samparlatore/ParlaMapper.git
        cd ParlaMapper
        echo "mapbox.token=pk.your-secret-token-here\nthunderforest.token=Thunderforest API key" > config.properties
        mvn clean package
        mvn dependency:copy-dependencies -DoutputDirectory=lib
        java -cp "target/ParlaMapper-1.0-SNAPSHOT.jar:lib/*" com.parlAquatics.Main
```

## 🔧 Setup

1. Clone the repo:
   ```bash
      git clone https://github.com/samparlatore/ParlaMapper.git
      cd ParlaMapper
   ```
   
2. Create a a config.properties file in the root directory and add your Thunderforest API key to it in the following format:
   ```bash
        echo "mapbox.token=pk.your-secret-token-here\`nthunderforest.token=Thunderforest API key" > config.properties
   ```
      (On macOS/Linux, use \n instead of \`n in the classpath)

3. Build:
     ```bash
        mvn clean package
   ```
4. Run
    ```bash
        java -cp "target/ParlaMapper-1.0-SNAPSHOT.jar;lib/*" com.parlAquatics.Main
   ```
      (On macOS/Linux, use `:` instead of `;` in the classpath)


