/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Grafos_Pesados;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author cobu-
 */
public class Kruskal<G extends Comparable<G>> {

    GrafoPesadoNoDirigido<G> grafo;
    GrafoPesadoNoDirigido<G> grafoOriginal;
    List<AdyacenciaOrdenadoPorPeso> listaOrdenados;

    public Kruskal(GrafoPesadoNoDirigido<G> grafoOriginal) {
        
        this.grafoOriginal = grafoOriginal;
        listaOrdenados = new ArrayList<>();
        grafo = new GrafoPesadoNoDirigido<>();
        for (G vertice : grafoOriginal.getVertices()) {
            grafo.insertarVertice(vertice);
        }
        crearListaOrdenados();
        ejecutarKruskal();
    }

    private void crearListaOrdenados() {

        for (G vertice : grafo.getVertices()) {
            int nroVerticeOrigen = grafo.nroVertice(vertice);
            for (G adyacente : grafoOriginal.getAdyacentesDelVertice(vertice)) {

                int nroVerticeDestino = grafo.nroVertice(adyacente);
                double peso = grafoOriginal.peso(vertice, adyacente);

                AdyacenciaOrdenadoPorPeso ady = new AdyacenciaOrdenadoPorPeso(nroVerticeDestino, nroVerticeOrigen);
                if (!listaOrdenados.contains(ady)) {

                    AdyacenciaOrdenadoPorPeso adyConPeso = new AdyacenciaOrdenadoPorPeso(nroVerticeOrigen, nroVerticeDestino, peso);

                    listaOrdenados.add(adyConPeso);
                    Collections.sort(listaOrdenados);
                }

            }
        }

    }

    public void ejecutarKruskal() {
        for (int i = 0; i < listaOrdenados.size(); i++) {
            AdyacenciaOrdenadoPorPeso adyacenciaActual = listaOrdenados.get(i);
            int nroVerticeOrigen = adyacenciaActual.getVerticeOrigen();
            int nroVerticeDestino = adyacenciaActual.getVerticeDestino();
            G verticeOrigen = grafo.listaDeVertices.get(nroVerticeOrigen);
            G verticeDestino = grafo.listaDeVertices.get(nroVerticeDestino);
            if (!grafo.existeAdyacencia(verticeOrigen, verticeDestino)) {
                double peso = grafoOriginal.peso(verticeOrigen, verticeDestino);
                System.out.println(verticeOrigen + "," + verticeDestino + "," + peso);
                grafo.insertarArista(verticeOrigen, verticeDestino, peso);
                if (grafo.hayCiclo()) {
                    grafo.eliminarArista(verticeOrigen, verticeDestino);
                }
            }
        }
    }

    public GrafoPesadoNoDirigido<G> getGrafo() {
        return grafo;
    }

}
