package matrices;

//2. Una escuela primaria utiliza una matriz para calcular los promedios de sus alumnos.
// Para ello tienen una matriz de 10 filas, donde cada fila representa a un alumno y 4 columnas.
// Las primeras 3 columnas representan las notas de cada uno de los alumnos, mientras que la 4 es el promedio de las mismas.
// Se desea un programa que sea capaz de permitir la carga por teclado de las 3 notas de cada alumno,
// de realizar el cálculo automático del promedio, de guardar el mismo en la 4 columna
// y luego mostrar por pantalla cada una de las notas y el promedio obtenido

import java.util.Scanner;

public class Promedio {
    public static void main(String[] args) {
        double notas[][] = new double[10][4];
        Scanner teclado = new Scanner(System.in);
        double prom = 0;

        for(int f=0; f<10; f++){
            prom = 0;
            for(int c=0; c<4; c++){
               if(c!=3){
                   System.out.println("Ingrese nota de alumno "+(f+1)+" en examen "+(c+1)+ ":");
                   notas[f][c] = teclado.nextDouble();
                   prom += notas[f][c];
               }
               else{
                   notas[f][c]=prom/3;
               }
            }
        }

        //LECTURA
        System.out.println("NOTA 1     NOTA 2      NOTA 3   PROMEDIO");
        for(int f=0; f<10; f++){
            for(int c=0; c<4; c++){
                System.out.print(notas[f][c] + "        ");
            }
            System.out.println("");
        }
    }
}
