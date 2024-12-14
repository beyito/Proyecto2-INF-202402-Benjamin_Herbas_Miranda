/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Grafos_Pesados;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 *
 * @author cobu-
 */
public class DijkstraNoDirigido<G extends Comparable<G>> {

    private final GrafoPesadoNoDirigido<G> grafo;
    private final ControlMarcados controlMarcados;
    private final G verticeDestino;
    private final G verticeOrigen;
    private final List<Double> costos;
    private final List<Integer> predecesores;

    public DijkstraNoDirigido(GrafoPesadoNoDirigido<G> unGrafo, G verticeOrigen, G verticeDestino) {
        this.verticeOrigen = verticeOrigen;
        this.verticeDestino = verticeDestino;
        predecesores = new ArrayList<>();
        grafo = unGrafo;
        costos = new ArrayList<>();
        for (int i = 0; i < grafo.cantidadDeVertices(); i++) {
            costos.add(Double.POSITIVE_INFINITY);
            predecesores.add(-1);
        }
        controlMarcados = new ControlMarcados(grafo.cantidadDeVertices());

        int nroVerticeOrigen = grafo.nroVertice(verticeOrigen);
        costos.set(nroVerticeOrigen, 0.0);
        this.ejecutarDijkstra();
    }

    public void ejecutarDijkstra() {
        int nroVerticeOrigen = grafo.nroVertice(verticeOrigen);
        int nroVerticeDestino = grafo.nroVertice(verticeDestino);

        if (nroVerticeOrigen == -1) {
            throw new IllegalArgumentException("El vertice " + verticeOrigen + " no se encuentra en el grafo");
        } else if (nroVerticeDestino == -1) {
            throw new IllegalArgumentException("El vertice " + nroVerticeDestino + " no se encuentra en el grafo");

        }
        while (!controlMarcados.estaMarcadoVertice(nroVerticeDestino)) {

            int nroVerticeActual = nroVerticeMenorCostoSinMarcar();
            G verticeActual = grafo.listaDeVertices.get(nroVerticeActual);
            controlMarcados.marcarVertice(nroVerticeActual);
            if (controlMarcados.estaMarcadoVertice(nroVerticeActual)) {
                System.out.println("hola");
            }

            System.out.println(verticeActual);
            List<AdyacenteConPeso> listaAdyacencia = grafo.listaDeAdyacencias.get(nroVerticeActual);

            for (AdyacenteConPeso adyacente : listaAdyacencia) {

                if (!controlMarcados.estaMarcadoVertice(adyacente.getNroVertice())) {

                    G verticeAControlar = grafo.listaDeVertices.get(adyacente.getNroVertice());

                    double costoAComparar = costos.get(nroVerticeActual) + grafo.peso(verticeActual, verticeAControlar);

                    if (costos.get(adyacente.getNroVertice()) > costoAComparar) {
                        costos.set(adyacente.getNroVertice(), costoAComparar);
                        predecesores.set(adyacente.getNroVertice(), nroVerticeActual);
                    }
                }
            }
        }

    }

    public double costoMinimo() {
        int nroVerticeDestino = grafo.nroVertice(verticeDestino);

        if (costos.get(nroVerticeDestino) == Double.POSITIVE_INFINITY) {
            throw new IllegalArgumentException("No se puede ir de " + verticeOrigen + " a " + "verticeDestino");
        }
        return costos.get(nroVerticeDestino);
    }

    public List<G> caminoCostoMinimo() {
        Stack<Integer> camino = new Stack<>();
        int nroVerticeDestino = grafo.nroVertice(verticeDestino);
        if (costos.get(nroVerticeDestino) == Double.POSITIVE_INFINITY) {
            throw new IllegalArgumentException("No se puede ir de " + verticeOrigen + " a " + "verticeDestino");
        }
        int predecesor = nroVerticeDestino;
        while (predecesor != -1) {
            camino.push(predecesor);
            predecesor = predecesores.get(predecesor);
        }
        List<G> caminoCostoMinimo = new ArrayList<>();
        int cantidad = camino.size();
        for (int i = 0; i < cantidad; i++) {
            G vertice = grafo.listaDeVertices.get(camino.pop());
            caminoCostoMinimo.add(vertice);
        }
        return caminoCostoMinimo;
    }

    public int nroVerticeMenorCostoSinMarcar() {

        int posicionVerticeMenor = controlMarcados.nroVerticeNoMarcado();

        double costoMenor = costos.get(posicionVerticeMenor);
        for (int i = 0; i < grafo.cantidadDeVertices(); i++) {
            if (!controlMarcados.estaMarcadoVertice(i) && costos.get(i) < costoMenor) {
                costoMenor = costos.get(i);
                posicionVerticeMenor = i;
            }
        }
        System.out.println(costoMenor);
        return posicionVerticeMenor;
    }

}
