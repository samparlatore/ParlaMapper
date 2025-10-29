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

        // Inject page title into application scope
        getServletContext().setAttribute("pageTitle", "ParlaMapper");

        String targetJsp = switch (mapType) {
            case "terrain" -> "/map/terrain.jsp";
            case "neighbourhood" -> "/map/neighbourhood.jsp";
            case "population density" -> "/map/populationDensity.jsp";
            default -> "/map/populationDensity.jsp";
        };
        // Forward to JSP
        request.getRequestDispatcher(targetJsp).forward(request, response);
    }
}