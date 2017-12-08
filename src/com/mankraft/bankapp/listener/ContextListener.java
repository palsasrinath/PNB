package com.mankraft.bankapp.listener;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class ContextListener implements ServletContextListener {

	static final Logger LOGGER = Logger.getLogger(ContextListener.class);

	@Override
	public void contextDestroyed(ServletContextEvent destroyEvent) {

		LOGGER.info("ServletContextEvent Destroyed Here");

	}

	@Override
	public void contextInitialized(ServletContextEvent initializeEvent) {

		LOGGER.info("ServletContextEvent Started Here");

		ServletContext context = initializeEvent.getServletContext();
		String log4jConfigFile = context.getInitParameter("log4j-config-location");
		String fullPath = context.getRealPath("") + File.separator + log4jConfigFile;
		PropertyConfigurator.configure(fullPath);

	}

}
