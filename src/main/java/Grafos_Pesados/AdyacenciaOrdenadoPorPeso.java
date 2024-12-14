/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Grafos_Pesados;

/**
 *
 * @author cobu-
 */
public class AdyacenciaOrdenadoPorPeso implements Comparable<AdyacenciaOrdenadoPorPeso> {

    int verticeOrigen;
    int verticeDestino;
    double peso;

    public AdyacenciaOrdenadoPorPeso() {
    }

    public AdyacenciaOrdenadoPorPeso(int verticeOrigen, int verticeDestino) {
        this.verticeOrigen = verticeOrigen;
        this.verticeDestino = verticeDestino;
    }

    public AdyacenciaOrdenadoPorPeso(int verticeOrigen, int verticeDestino, double peso) {
        this.verticeOrigen = verticeOrigen;
        this.verticeDestino = verticeDestino;
        this.peso = peso;
    }

    public int getVerticeOrigen() {
        return verticeOrigen;
    }

    public int getVerticeDestino() {
        return verticeDestino;
    }

    public double getPeso() {
        return peso;
    }

    public void setVerticeOrigen(int verticeOrigen) {
        this.verticeOrigen = verticeOrigen;
    }

    public void setVerticeDestino(int verticeDestino) {
        this.verticeDestino = verticeDestino;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
 
    @Override
    public int compareTo(AdyacenciaOrdenadoPorPeso o) {
        if (this.peso > o.getPeso()) {
            return 1;
        } 
        if (this.peso < o.getPeso()) {
            return -1;
        }

        return 0;
    }
    
    @Override 
    public boolean equals(Object obj){
      AdyacenciaOrdenadoPorPeso o= (AdyacenciaOrdenadoPorPeso) obj;
      return this.compareTo(o) == 0;
    }

}
