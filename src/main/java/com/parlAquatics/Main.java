package com.parlAquatics;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;
import java.util.logging.Logger;
import org.eclipse.jetty.util.resource.Resource;

public class Main {
    private static final Logger log = Logger.getLogger(Main.class.getName());

    public static void main(String[] args) throws Exception {
        // Create Jetty server on port 8080
        Server server = new Server(8080);

        // Configure web application context
        WebAppContext context = new WebAppContext();
        context.setContextPath("/");
        context.setBaseResource(Resource.newResource("src/main/webapp"));
        context.setDescriptor("src/main/webapp/WEB-INF/web.xml");
        context.setParentLoaderPriority(true);
        context.setAttribute("org.eclipse.jetty.server.webapp.ContainerIncludeJarPattern", ".*/[^/]*taglibs.*\\.jar$|.*/.*jsp.*\\.jar$");

        server.setHandler(context);

        log.info("Starting Jetty server on http://localhost:8080/");
        server.start();
        server.join();
    }
}