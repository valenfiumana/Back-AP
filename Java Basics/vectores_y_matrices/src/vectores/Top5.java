package vectores;// 4. En un vector de 23 posiciones se tienen las temperaturas máximas de las capitales de las 23 provincias argentinas en el último mes.
// A partir de esta información, un noticiero desea determinar el top 5 de las temperaturas más altas
// Se necesita un programa que sea capaz de recorrer el vector de temperaturas, determinar las 5 más altas
// y copiarlas en un nuevo vector de 5 posiciones

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Random;

public class Top5 {
    public static void main(String[] args) {
        int temperaturas[] = new int[23];
        int top5[] = new int[5];

        //CARGA VECTOR RANDOM
        Random rand = new Random();
        for (int i = 0; i < temperaturas.length; i++) {
            int randomNum = 6 + rand.nextInt((18 - 6) + 1);
            temperaturas[i] = randomNum;
        }
        System.out.println("Array original:");
        leerArray(temperaturas);

        //ORDEN MENOR A MAYOR
        Arrays.sort(temperaturas);
        System.out.println("Array de menor a mayor:");
        leerArray(temperaturas);

        //ÚLTIMOS 5 VALORES
        System.out.println("Temperaturas mas altas: ");
        for(int i=temperaturas.length-1; i>=temperaturas.length-5; i--){
            System.out.println(temperaturas[i]);
        }

        //TOP 5 EN ARRAY
        System.out.println("\nLas meto en array: ");
        top5[0]= temperaturas[22];
        top5[1]= temperaturas[21];
        top5[2]= temperaturas[20];
        top5[3]= temperaturas[19];
        top5[4]= temperaturas[18];
        leerArray(top5);
    }

    public static void leerArray (int [] array){
        System.out.print("[  ");
        for(int i=0; i<array.length; i++){
            System.out.print(array[i] + "  ");
        }
        System.out.print("]\n\n");
    }

}
