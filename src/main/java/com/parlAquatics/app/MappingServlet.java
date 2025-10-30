package com.parlAquatics.app;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.logging.Logger;

public class MappingServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(MappingServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("request: " + request.getRequestURI());
        String mapType = request.getParameter("mapType");
        logger.info("mapType selected: " + mapType);

        String targetJsp;
        String pageTitle;

        switch (mapType) {
            case "terrain" -> {
                targetJsp = "/map/terrain.jsp";
                pageTitle = "Terrain Map Viewer";
            }
            case "neighbourhood" -> {
                targetJsp = "/map/neighbourhood.jsp";
                pageTitle = "Neighbourhood Explorer";
            }
            case "population density" -> {
                targetJsp = "/map/populationDensity.jsp";
                pageTitle = "Population Density Dashboard";
            }
            default -> {
                targetJsp = "/map/populationDensity.jsp";
                pageTitle = "ParlaMapper";
            }
        }

        // Inject page title into application scope
        getServletContext().setAttribute("pageTitle", pageTitle);

        // Forward to selected JSP
        request.getRequestDispatcher(targetJsp).forward(request, response);
    }
}