/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompany.proyectoed2;
import org.apache.catalina.startup.Tomcat;

import java.io.File;
import org.apache.catalina.LifecycleException;
/**
 *
 * @author cobu-
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) throws LifecycleException {
         Tomcat tomcat = new Tomcat();
        tomcat.setPort(8080);

        // Configura la ruta a los archivos del proyecto (webapp)
        String webappDir = "src/main/webapp";
        tomcat.addWebapp("/", new File(webappDir).getAbsolutePath());

        tomcat.start();
        tomcat.getServer().await();
    }
    
}
