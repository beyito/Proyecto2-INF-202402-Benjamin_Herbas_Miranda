<%@page import="java.util.List"%>
<%@page import="Grafos_Pesados.GrafoPesadoNoDirigido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
         
        body {
            margin: 20px;
            padding: 0;
            background-color: #F2F2F2 ; /* Ruta de la imagen */
            /* Escala la imagen para que cubra toda la pantalla */
            background-position: center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
        }
    </style>
    <img src="logo.png" width="250" height="auto" />

    <style>
        .container {
            display: flex;
            justify-content: flex-start;
           
            gap: 10px; /* Espacio entre los formularios */
            margin: 20px;
             
        }

        .form-container {
            
            display: flex;
            justify-content: flex-start; /* Mueve los formularios a la derecha */
            margin-right: 10px; /* Añade un pequeño espacio a la derecha */
        }
        /* Estilo para los formularios */
        form {
            border: 2px solid black ;
            background-color: #E6F7FF ;
            border-radius: 8px;
            margin-left: 10px; /* Espacio entre los formularios */
            padding: 10px;
            
          
        }
        h1{
           color: #2C3E50;
           font-size: 50px;
           text-align: center;
        }
    #form-no-border {
        form{
            border:2 px solid #87CEEB;
            border-radius: 0px;
            margin-left: 5px; /* Espacio entre los formularios */
            padding: 0px;
     }
        
    }

    </style>
</head>

<body>

    <%!
        // Variable global
        GrafoPesadoNoDirigido<String> grafo = new GrafoPesadoNoDirigido<>();
        GrafoPesadoNoDirigido<String> grafoDistancia = new GrafoPesadoNoDirigido<>();

        // Método para cargar datos de mi proyecto al grafo
        public void cargarGrafoPredefinido() {
            grafo = new GrafoPesadoNoDirigido<>();
            grafoDistancia = new GrafoPesadoNoDirigido<>();
            grafo.insertarVertice("Rusia");
            grafo.insertarVertice("Argentina");
            grafo.insertarVertice("Brasil");
            grafo.insertarVertice("Chile");
            grafo.insertarVertice("Bolivia");
            grafo.insertarVertice("Peru");
            grafo.insertarVertice("Ecuador");
            grafo.insertarVertice("Colombia");
            grafo.insertarVertice("Venezuela");
            grafo.insertarVertice("Mexico");
            grafo.insertarVertice("Estados Unidos");
            grafo.insertarVertice("China");
            grafo.insertarVertice("Japon");
            grafo.insertarVertice("Corea del Sur");
            grafo.insertarVertice("Egipto");

            grafo.insertarArista("Rusia", "Argentina", 800);
            grafo.insertarArista("Rusia", "Chile", 500);
            grafo.insertarArista("Rusia", "Bolivia", 400);
            grafo.insertarArista("Argentina", "Brasil", 300);
            grafo.insertarArista("Argentina", "Peru", 400);
            grafo.insertarArista("Argentina", "Bolivia", 1200);
            grafo.insertarArista("Brasil", "Peru", 900);
            grafo.insertarArista("Brasil", "Ecuador", 1100);
            grafo.insertarArista("Chile", "Bolivia", 900);
            grafo.insertarArista("Chile", "Colombia", 600);
            grafo.insertarArista("Bolivia", "Peru", 300);
            grafo.insertarArista("Bolivia", "Venezuela", 800);
            grafo.insertarArista("Bolivia", "Mexico", 500);
            grafo.insertarArista("Peru", "Ecuador", 100);
            grafo.insertarArista("Peru", "Estados Unidos", 800);
            grafo.insertarArista("Ecuador", "Estados Unidos", 800);
            grafo.insertarArista("Ecuador", "China", 700);
            grafo.insertarArista("Colombia", "Venezuela", 200);
            grafo.insertarArista("Colombia", "Japon", 700);
            grafo.insertarArista("Venezuela", "Mexico", 1000);
            grafo.insertarArista("Venezuela", "Japon", 600);
            grafo.insertarArista("Mexico", "Estados Unidos", 600);
            grafo.insertarArista("Mexico", "Corea del Sur", 900);
            grafo.insertarArista("Estados Unidos", "China", 500);
            grafo.insertarArista("Estados Unidos", "Egipto", 700);
            grafo.insertarArista("China", "Egipto", 600);
            grafo.insertarArista("Japon", "Corea del Sur", 200);
            grafo.insertarArista("Corea del Sur", "Egipto", 1200);
       
            grafoDistancia.insertarVertice("Rusia");
            grafoDistancia.insertarVertice("Argentina");
            grafoDistancia.insertarVertice("Brasil");
            grafoDistancia.insertarVertice("Chile");
            grafoDistancia.insertarVertice("Bolivia");
            grafoDistancia.insertarVertice("Peru");
            grafoDistancia.insertarVertice("Ecuador");
            grafoDistancia.insertarVertice("Colombia");
            grafoDistancia.insertarVertice("Venezuela");
            grafoDistancia.insertarVertice("Mexico");
            grafoDistancia.insertarVertice("Estados Unidos");
            grafoDistancia.insertarVertice("China");
            grafoDistancia.insertarVertice("Japon");
            grafoDistancia.insertarVertice("Corea del Sur");
            grafoDistancia.insertarVertice("Egipto");

            grafoDistancia.insertarArista("Rusia", "Argentina", 17500); // Moscú - Buenos Aires
            grafoDistancia.insertarArista("Rusia", "Chile", 18000); // Moscú - Santiago
            grafoDistancia.insertarArista("Rusia", "Bolivia", 17000); // Moscú - La Paz
            grafoDistancia.insertarArista("Argentina", "Brasil", 3000); // Buenos Aires - Brasilia
            grafoDistancia.insertarArista("Argentina", "Peru", 4500); // Buenos Aires - Lima
            grafoDistancia.insertarArista("Argentina", "Bolivia", 3500); // Buenos Aires - La Paz
            grafoDistancia.insertarArista("Brasil", "Peru", 4000); // Brasilia - Lima
            grafoDistancia.insertarArista("Brasil", "Ecuador", 5000); // Brasilia - Quito
            grafoDistancia.insertarArista("Chile", "Bolivia", 3000); // Santiago - La Paz
            grafoDistancia.insertarArista("Chile", "Colombia", 5500); // Santiago - Bogotá
            grafoDistancia.insertarArista("Bolivia", "Peru", 2000); // La Paz - Lima
            grafoDistancia.insertarArista("Bolivia", "Venezuela", 5000); // La Paz - Caracas
            grafoDistancia.insertarArista("Bolivia", "Mexico", 8000); // La Paz - Ciudad de México
            grafoDistancia.insertarArista("Peru", "Ecuador", 2500); // Lima - Quito
            grafoDistancia.insertarArista("Peru", "Estados Unidos", 9000); // Lima - Washington D.C.
            grafoDistancia.insertarArista("Ecuador", "Estados Unidos", 7500); // Quito - Washington D.C.
            grafoDistancia.insertarArista("Ecuador", "China", 20000); // Quito - Beijing
            grafoDistancia.insertarArista("Colombia", "Venezuela", 1500); // Bogotá - Caracas
            grafoDistancia.insertarArista("Colombia", "Japon", 17500); // Bogotá - Tokio
            grafoDistancia.insertarArista("Venezuela", "Mexico", 5000); // Caracas - Ciudad de México
            grafoDistancia.insertarArista("Venezuela", "Japon", 18000); // Caracas - Tokio
            grafoDistancia.insertarArista("Mexico", "Estados Unidos", 4000); // Ciudad de México - Washington D.C.
            grafoDistancia.insertarArista("Mexico", "Corea del Sur", 14500); // Ciudad de México - Seúl
            grafoDistancia.insertarArista("Estados Unidos", "China", 13500); // Washington D.C. - Beijing
            grafoDistancia.insertarArista("Estados Unidos", "Egipto", 11000); 
            grafoDistancia.insertarArista("China", "Egipto", 9500); 
            grafoDistancia.insertarArista("Japon", "Corea del Sur", 2000); 
            grafoDistancia.insertarArista("Corea del Sur", "Egipto", 11500); 

        }

    %>
   <h1>CONSIGUE EL MEJOR VUELO!</h1>
        </style>

    <!-- Botón para cargar grafo predefinido -->
    <div class="form-container" id ="form-no-border" >
    <form method="post"  >
        <button type="submit" name="accion" value="cargar"><h3> Cargar Grafo Predefinido </h3></button>
    </form>
    </div>

    <!-- Contenedor para los formularios de insertar vértice y eliminar vértice -->
    <div class="form-container">
        <!-- Formulario para agregar vértice -->
        <form method="post">
            <h2>Insertar Vertice</h2>
            <p>
                <label>Vértice a Ingresar:</label>
                <input type="text" name="vertice">
            </p>
            <button type="submit" name="accion" value="agregarVertice">Agregar Vértice</button>
        </form>

        <!-- Formulario para agregar arista -->
        <form method="post">
            <h2>Insertar Costo</h2>
            <p>
                <label>Vértice Origen:</label>
                <input type="text" name="verticeOrigen">
            </p>
            <p>
                <label>Vértice Destino:</label>
                <input type="text" name="verticeDestino">
            </p>
            <p>
                <label>Costo de la Arista:</label>
                <input type="text" name="pesoArista">
            </p>
            <button type="submit" name="accion" value="agregarCosto">Agregar Costo</button>
            <button type="submit" name="accion" value="actualizarCosto">Actualizar Costo</button>
        </form>

        <form method="post">
            <h2>Insertar Distancia</h2>
            <p>
                <label>Vértice Origen:</label>
                <input type="text" name="verticeOrigen">
            </p>
            <p>
                <label>Vértice Destino:</label>
                <input type="text" name="verticeDestino">
            </p>
            <p>
                <label>Distancia de la Arista en Km:</label>
                <input type="text" name="pesoArista">
            </p>
            <button type="submit" name="accion" value="agregarDistancia">Agregar Distancia</button>
            <button type="submit" name="accion" value="actualizarDistancia">Actualizar Distancia</button>
        </form>

        <!-- Formulario para eliminar vértice -->
        <form method="post">
            <h2>Eliminar Vertice</h2>
            <p>
                <label>Vértice a Eliminar:</label>
                <input type="text" name="verticeAEliminar">
            </p>
            <button type="submit" name="accion" value="eliminarVertice">Eliminar Vértice</button>
        </form>
        <!-- Formulario para eliminar arista -->
        <form method="post">
            <h2>Eliminar Arista:</h2>
            <p>
                <label>Vértice Origen:</label>
                <input type="text" name="verticeOrigen">
            </p>
            <p>
                <label>Vértice Destino:</label>
                <input type="text" name="verticeDestino">
            </p>

            <button type="submit" name="accion" value="eliminarCosto">Eliminar Costo</button>
            <button type="submit" name="accion" value="eliminarDistancia">Eliminar Distancia</button>
        </form>
        <!-- Formulario para hallar el costoMinimo -->
        <form method="post">
            <h2>Buscar Trayectoria Mas Barata </h2>
            <p>
                <label>Vértice Origen:</label>
                <input type="text" name="verticeOrigen">
            </p>
            <p>
                <label>Vértice Destino:</label>
                <input type="text" name="verticeDestino">
            </p>
            <button type="submit" name="accion" value="caminoMinimo">Buscar Vuelo Más Barato</button>
        </form>
        <!-- Formulario para buscar distancia minima -->
        <form method="post">
            <h2>Buscar Trayectoria Mas Corta </h2>
            <p>
                <label>Vértice Origen:</label>
                <input type="text" name="verticeOrigen">
            </p>
            <p>
                <label>Vértice Destino:</label>
                <input type="text" name="verticeDestino">
            </p>
            <button type="submit" name="accion" value="distanciaMinima"> Buscar Vuelo Más Corto</button>
        </form>
    </div>

    <br>
    <!-- Código Java -->
    <%
        String accion = request.getParameter("accion");

        if ("cargar".equals(accion)) {
            cargarGrafoPredefinido();
            out.println("<p>Grafo cargado exitosamente.</p>");
        } else if ("agregarVertice".equals(accion)) {
            String vertice = request.getParameter("vertice");
            if (vertice != null && !vertice.isEmpty()) {
                try {
                    grafo.insertarVertice(vertice);
                    grafoDistancia.insertarVertice(vertice);
                    out.println("<p>Vértice agregado: " + vertice + "</p>");
                } catch (IllegalArgumentException e) {
                    out.println("<p>Error: El vértice ya existe.</p>");
                }
            }
        } else if ("agregarCosto".equals(accion)) {
            String verticeOrigen = request.getParameter("verticeOrigen");
            String verticeDestino = request.getParameter("verticeDestino");
            String pesoStr = request.getParameter("pesoArista");
            if (verticeOrigen != null && verticeDestino != null && pesoStr != null) {
                try {
                    double peso = Double.parseDouble(pesoStr);
                    grafo.insertarArista(verticeOrigen, verticeDestino, peso);
                    out.println("<p>Arista agregada: " + verticeOrigen + " - " + verticeDestino + " (Peso: " + peso + ")</p>");
                } catch (NumberFormatException e) {
                    out.println("<p>Error: El peso debe ser un número válido.</p>");
                }
            }
        } else if ("eliminarVertice".equals(accion)) {
            try {
                String verticeAEliminar = request.getParameter("verticeAEliminar");
                grafo.eliminarVertice(verticeAEliminar);
                grafoDistancia.eliminarVertice(verticeAEliminar);
                out.println("<p>Vértice eliminado: " + verticeAEliminar + "</p>");
            } catch (IllegalArgumentException e) {
                out.println("<p>Error: No se pudo eliminar el vértice </p>");
            }
        } else if ("caminoMinimo".equals(accion)) {
            try {
                String verticeOrigen = request.getParameter("verticeOrigen");
                String verticeDestino = request.getParameter("verticeDestino");

                out.println("<h3>Camino de menor costo: " + grafo.caminoCostoMinimo(verticeOrigen, verticeDestino) + "</h3>");
                out.println("<h3>Costo total del viaje: " + grafo.costoMinimo(verticeOrigen, verticeDestino) + "$</h3>");
            } catch (IllegalArgumentException e) {
                out.println("<p>No se puede ir de " + request.getParameter("verticeOrigen") + " a " + request.getParameter("verticeDestino") + "</p>");
            }
        } else if ("eliminarCosto".equals(accion)) {
            try {
                String verticeOrigen = request.getParameter("verticeOrigen");
                String verticeDestino = request.getParameter("verticeDestino");
                grafo.eliminarArista(verticeOrigen, verticeDestino);
                out.println("<p> Arista eliminada correctamente</p");
            } catch (IllegalArgumentException e) {
                out.println("<p>No se puede eliminar la arista que seleccionaste</p");
            }
        } else if ("distanciaMinima".equals(accion)) {
            try {
                String verticeOrigen = request.getParameter("verticeOrigen");
                String verticeDestino = request.getParameter("verticeDestino");

                out.println("<h3>Camino de menor distancia " + grafoDistancia.caminoCostoMinimo(verticeOrigen, verticeDestino) + "</h3>");
                out.println("<h3>distancia total del viaje: " + grafoDistancia.costoMinimo(verticeOrigen, verticeDestino) + "Km</h3>");
            } catch (IllegalArgumentException e) {
                out.println("<p>No se puede ir de " + request.getParameter("verticeOrigen") + " a " + request.getParameter("verticeDestino") + "</p>");
            }
        }else if("actualizarCosto".equals(accion)){
       
            String verticeOrigen = request.getParameter("verticeOrigen");
            String verticeDestino = request.getParameter("verticeDestino");
            String pesoStr = request.getParameter("pesoArista");
            if (verticeOrigen != null && verticeDestino != null && pesoStr != null) {
            double peso;
                try {
                     peso= Double.parseDouble(pesoStr);
                    } catch (NumberFormatException e) {
                    out.println("<p>Error: El costo debe ser un número válido.</p>");
                    return;
                }
                 try {
                    grafo.setPeso(verticeOrigen,verticeDestino,peso);
                    out.println("<p>Arista actualizada -> " + verticeOrigen + " - " + verticeDestino + " (Nuevo Costo: " + peso + ")</p>");
                } catch (IllegalArgumentException h) {
                    out.println("<p>Error: El costo debe ser un número válido.</p>");
                }
            }     
        }else if("actualizarDistancia".equals(accion)){
       
            String verticeOrigen = request.getParameter("verticeOrigen");
            String verticeDestino = request.getParameter("verticeDestino");
            String pesoStr = request.getParameter("pesoArista");
            if (verticeOrigen != null && verticeDestino != null && pesoStr != null) {
            double peso;
                try {
                     peso= Double.parseDouble(pesoStr);
                    } catch (NumberFormatException e) {
                    out.println("<p>Error: La distancia debe ser un número válido.</p>");
                    return;
                }
                 try {
                    grafoDistancia.setPeso(verticeOrigen,verticeDestino,peso);
                    out.println("<p>Distancia actualizada -> " + verticeOrigen + " - " + verticeDestino + " (Nueva Distancia: " + peso + ")</p>");
                } catch (IllegalArgumentException h) {
                    out.println("<p> No hay arista entre : "+verticeOrigen+" y "+verticeDestino+"  </p>");
                }
            }     
        }else if ("agregarDistancia".equals(accion)) {
            String verticeOrigen = request.getParameter("verticeOrigen");
            String verticeDestino = request.getParameter("verticeDestino");
            String pesoStr = request.getParameter("pesoArista");
            if (verticeOrigen != null && verticeDestino != null && pesoStr != null) {
                try {
                    double peso = Double.parseDouble(pesoStr);
                    grafoDistancia.insertarArista(verticeOrigen, verticeDestino, peso);
                    out.println("<p>Distancia agregada: " + verticeOrigen + " - " + verticeDestino + " (Distancia: " + peso + ")</p>");
                } catch (NumberFormatException e) {
                    out.println("<p>Error: La distancia debe ser un número válido.</p>");
                }
            }
        }else if ("eliminarDistancia".equals(accion)) {
            String verticeOrigen = request.getParameter("verticeOrigen");
            String verticeDestino = request.getParameter("verticeDestino");
            if (verticeOrigen != null && verticeDestino != null ) {
                try {
                    
                    grafoDistancia.eliminarArista(verticeOrigen, verticeDestino);
                    out.println("<p>Distancia eliminada: (" + verticeOrigen + " - " + verticeDestino + ")</p>");
                } catch (IllegalArgumentException e) {
                    out.println("<p> No hay arista entre : "+verticeOrigen+" y "+verticeDestino+"  </p>");
                }
            }
        }
        

        // Mostrar grafo
       
       out.println("<b><i><div style='white-space: pre; font-size: 1.7em; font-family: monospace;'>"
        + "Número de Vértices: " + grafo.cantidadDeVertices() + "</i></div></b>");

        
        out.println("<div style='white-space: pre; font-size: 2.7em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>"+ "Grafo de Costos" + "</div>");
        out.println("<div style='white-space: pre; font-size: 1.3em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>" + grafo + "</div>");
        out.println("<div style='white-space: pre; font-size: 2.7em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>"+ "Grafo de Distancias" + "</div>");
        out.println("<div style='white-space: pre; font-size: 1.3em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>"+ grafoDistancia + "</div>");
        out.println("<div style='white-space: pre; font-size: 2.7em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>"+ "Grafo de Expansión de Costos Mínimos" + "</div>");
        out.println("<div style='white-space: pre; font-size: 1.3em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>" + grafo.expansionDeCostoMinimo() + "</div>");
        out.println("<div style='white-space: pre; font-size: 2.7em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>"+ "Grafo de Expansión de Distancias Mínimas" + "</div>");
        out.println("<div style='white-space: pre; font-size: 1.3em; font-family: monospace;margin-left: 20px;line-height: 2.0em;'>" + grafoDistancia.expansionDeCostoMinimo() + "</div>");
    %>

</body>
</html>