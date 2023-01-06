package matrices;
// 1. Una matriz de 5 filas x 3 columnas almacena el total de goles de 5 jugadores de futbol en los últimos 3 partidos que jugaron,
// donde cada fila representa a un jugador y cada columna a la cantidad de goles que hizo.
// Se necesita un programa que sea capaz de permitir la carga de los goles, calcular el promedio de goles realizado
// por cada jugador y almacenar el resultado en un vector de 5 posiciones, donde cada posición representará a un jugador.

import java.util.Scanner;

public class CargaYPromedio {
    public static void main(String[] args) {
        int matriz[][] = new int[5][3];

        //CARGA MATRIZ
        Scanner teclado = new Scanner(System.in);
        for(int f=0; f<5; f++){
            for(int c=0; c<3; c++){
                System.out.println("Ingrese numero de goles del jugador " + (f+1) + " para el partido " + (c+1));
                matriz[f][c] = teclado.nextInt();
            }
        }

        //LECTURA
        for(int f=0; f<5; f++){
            for(int c=0; c<3; c++){
                System.out.print(matriz[f][c] + "   ");
            }
            System.out.println("");
        }

        //PROMEDIO POR FILA
        double promedios[] = new double[5];
        double prom = 0;
        for(int f=0; f<5; f++){
            prom = 0;
            for(int c=0; c<3; c++) {
                prom += matriz[f][c];
            }
            promedios[f]=prom/3;
        }

        leerArray(promedios);
    }

    public static void leerArray (double [] array){
        System.out.print("[  ");
        for(int i=0; i<array.length; i++){
            System.out.print(array[i] + "  ");
        }
        System.out.print("]\n\n");
    }
}
