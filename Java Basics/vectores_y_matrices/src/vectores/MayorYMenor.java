package vectores;//2. En un vector de 15 posiciones se almacenan las edades de 15 alumnos.
// Determinar cuál es la mayor edad y cuál es la menor edad que se encuentra entre los estudiantes.

import java.util.Collections;
import java.util.Random;

public class MayorYMenor {
    public static void main(String[] args) {
        int edades[] = new int[15];

        //CARGA VECTOR RANDOM
        Random rand = new Random();
        for (int i = 0; i < edades.length; i++) {
            int randomNum = 6 + rand.nextInt((18 - 6) + 1);
            edades[i] = randomNum;
        }

        //LECTURA VECTOR
        System.out.print("El vector es: [  ");
        for (int i = 0; i < edades.length; i++) {
            System.out.print(edades[i] + "  ");
        }
        System.out.print("]");

        //MAYOR Y MENOR 1
        int max = edades[0];
        int min = edades[0];
        for (int i = 1; i < edades.length; i++) {
            if (edades[i] > max) {
                max = edades[i];
            }
            if (edades[i] < min) {
                min = edades[i];
            }
        }
        System.out.println("\n El minimo es " + min);
        System.out.println("El maximo es " + max);
    }
}
