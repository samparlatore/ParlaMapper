package com.parlAquatics.util;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;
import java.util.logging.LogManager;
import java.util.logging.Logger;

@WebListener
public class ConfigLoader implements ServletContextListener {
    private static final Logger logger = Logger.getLogger(ConfigLoader.class.getName());

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            // Load custom logging configuration
            String loggingPath = "src/main/resources/logging.properties"; // adjust if needed
            File loggingFile = new File(loggingPath);
            if (loggingFile.exists()) {
                LogManager.getLogManager().readConfiguration(new FileInputStream(loggingFile));
                logger.info("Loaded logging config from " + loggingFile.getAbsolutePath());
            } else {
                logger.warning("Logging config file not found at " + loggingFile.getAbsolutePath());
            }

            // Load tokens from config.properties
            Properties props = new Properties();
            props.load(new FileInputStream("config.properties"));
            String token = props.getProperty("mapbox.token");
            sce.getServletContext().setAttribute("mapboxToken", token);
            logger.info("Mapbox Token: " + token);
            token = props.getProperty("thunderforest.token");
            sce.getServletContext().setAttribute("thunderforestToken", token);
            logger.info("Thunderforest Token: " + token);


        } catch (Exception e) {
            logger.severe("Startup failed: " + e.getMessage());
            throw new RuntimeException("Failed to initialize ConfigLoader", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Optional cleanup
    }
}