package matrices;

//  4. Una casa de comida rápida utiliza una matriz de 20 filas y 5 columnas para determinar cada plato del menú y sus correspondientes ingredientes que contiene.
//  Para ello, cada fila representa un plato principal en donde en la primera columna se especifica su nombre (por ejemplo: Milanesa),
//  y en las demás los posibles acompañamientos que puede tener el plato (por ejemplo, puré, ensalada rusa, papas fritas, ensalada de lechuga y tomate, ensalada de zanahoria, etc).
//  En caso de que tenga el plato menos de 4 tipos de acompañamiento, en la matriz se cargará la palabra Ninguno en las posiciones que queden vacías.
//  Se desea un programa que sea capaz de permitir la carga de la matriz, de buscar un plato en particular que un cliente ingrese por teclado
//  y mostrarle de forma automática los posibles acompañamientos del mismo.

import java.util.Scanner;

public class Busqueda {
    public static void main(String[] args) {
        String matriz[][] = new String[3][3];

        //CARGA MATRIZ
        Scanner teclado = new Scanner(System.in);
        for(int f=0; f<3; f++){
            for(int c=0; c<3; c++){
                if(c==0){
                    System.out.println("Ingrese comida "+(f+1)+ ":");
                    matriz[f][c] = teclado.next();
                }
                else{
                    System.out.println("Ingrese guarnicion para "+matriz[f][0]+ ":");
                    matriz[f][c] = teclado.next();
                }
            }
        }

        //LECTURA
        System.out.println("COMIDA       GUARNICIONES");
        for(int f=0; f<3; f++){
            for(int c=0; c<3; c++){
                System.out.print(matriz[f][c] + "       ");
            }
            System.out.println("");
        }

        //BUSQUEDA
        System.out.println("Ingrese comida a buscar:");
        String buscar = teclado.next();
        String rta = "";
        for(int f=0; f<3; f++){
            if(matriz[f][0]==buscar){
                rta = "Las guarniciones posibles son "+matriz[f][1]+" y "+matriz[f][2];
            }
        }
        if(rta==null){
            System.out.println("No se ha encontrado la comida "+buscar);
        }
    }
}
