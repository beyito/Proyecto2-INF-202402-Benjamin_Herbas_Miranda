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
            background-image: url(fondo.jpg); /* Ruta de la imagen */
            background-size: cover; /* Escala la imagen para que cubra toda la pantalla */
            background-position: center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
        }
    </style>   
    <img src="logo.png" width="250" height="150" />
    
    <style>
        /* Contenedor para los formularios */
        .form-container {
            display: flex;
            justify-content: flex-start; /* Mueve los formularios a la derecha */
            margin-right: 20px; /* Añade un pequeño espacio a la derecha */
        }

        /* Estilo para los formularios */
        form {
            margin-left: 20px; /* Espacio entre los formularios */
            padding: 10px;
            
          
        }
    </style>
</head>

<body>
    
    <%!
        // Variable global
        GrafoPesadoNoDirigido<String> grafo = new GrafoPesadoNoDirigido<>();

        // Método para cargar datos de mi proyecto al grafo
        public void cargarGrafoPredefinido() {
            grafo = new GrafoPesadoNoDirigido<>();
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
        }
    %>

    <h1>CONSIGUE EL MEJOR VUELO!</h1>

    <!-- Botón para cargar grafo predefinido -->
    <form method="post">
        <button type="submit" name="accion" value="cargar"><h3> Cargar Grafo Predefinido </h3></button>
    </form>

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
            <h2>Insertar Arista:</h2>
            <p>
                <label>Vértice Origen:</label>
                <input type="text" name="verticeOrigen">
            </p>
            <p>
                <label>Vértice Destino:</label>
                <input type="text" name="verticeDestino">
            </p>
            <p>
                <label>Peso de la Arista:</label>
                <input type="text" name="pesoArista">
            </p>
            <button type="submit" name="accion" value="agregarArista">Agregar Arista</button>
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

            <button type="submit" name="accion" value="eliminarArista">Eliminar Arista</button>
        </form>
        <!-- Formulario para hallar el costoMinimo -->
        <form method="post">
            <h2>Escoger Vuelos Mas baratos:</h2>
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
    </div>


    <!-- Procesar lógica en el servidor -->
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
                    out.println("<p>Vértice agregado: " + vertice + "</p>");
                } catch (IllegalArgumentException e) {
                    out.println("<p>Error: El vértice ya existe.</p>");
                }
            }
        } else if ("agregarArista".equals(accion)) {
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
        } else if ("eliminarArista".equals(accion)) {
            try {
                String verticeOrigen = request.getParameter("verticeOrigen");
                String verticeDestino = request.getParameter("verticeDestino");
                grafo.eliminarArista(verticeOrigen, verticeDestino);
                out.println("<p> Arista eliminada correctamente</p");
            } catch (IllegalArgumentException e) {
                out.println("<p>No se puede eliminar la arista que seleccionaste</p");
            }
        }

        // Mostrar grafo
        out.println("<h2>      Grafo Actual:</h2>");
        out.println("<i><pre>" + grafo + "<pre></i>");
    %>

</body>
</html>