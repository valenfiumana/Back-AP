package vectores;//5. Se necesita un vector que permita cargar por teclado el nombre de 10 animales.
// A partir de esta carga, se desea otro vector que copie los mismos nombres pero en el orden inverso.
// Una vez realizado el cambio, mostrar por pantalla ambos vectores para compararlos.

import java.util.Scanner;

public class OrdenInverso {
    public static void main(String[] args) {
        String animales [] = new String [10];
        String animalesInvertidos [] = new String [10];

        //CARGA VECTOR
        Scanner teclado = new Scanner(System.in);
        for(int i=0; i<animales.length; i++){
            System.out.println("Ingrese el valor para el indice "+i);
            animales[i] = teclado.next();
        }

        //NUEVO ARRAY INVERTIDO
        int j = animales.length -1;
        for(int i=0; i<animales.length; i++){
            animalesInvertidos[i]=animales[j];
            j--;
        }

        System.out.println("Array al derecho: ");
        leerArray(animales);
        System.out.println("Array al reves: ");
        leerArray(animalesInvertidos);
    }

    public static void leerArray (String [] array){
        System.out.print("[  ");
        for(int i=0; i<array.length; i++){
            System.out.print(array[i] + "  ");
        }
        System.out.print("]\n\n");
    }
}
