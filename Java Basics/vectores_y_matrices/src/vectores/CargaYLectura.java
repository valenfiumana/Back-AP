package vectores;

import java.util.Scanner;

public class CargaYLectura {
    public static void main(String[] args) {
        // 1. Se necesita de un vector que sea capaz de almacenar 10 números enteros entre 1 y 100
        // Realizar un programa que permita la carga por teclado de los 10 números solicitados.
        int vector [] = new int [9];

        //CARGA VECTOR
        Scanner teclado = new Scanner(System.in);
        for(int i=0; i<vector.length; i++){
            System.out.println("Ingrese el valor para el indice "+i);
            vector[i] = teclado.nextInt();
        }

        //LECTURA VECTOR
        System.out.print("El vector es: [  ");
        for(int i=0; i<vector.length; i++){
            System.out.print(vector[i] + "  ");
        }
        System.out.print("]");
    }
}
