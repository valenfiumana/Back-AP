package matrices;

//3. Se desea un programa que sea capaz de rellenar completamente con números 1 una matriz de 4 x 4
// a excepción de su diagonal principal, la cual debe ser rellenada con números 0.
// Una vez realizada la carga, se desea mostrar la matriz de forma ordenada por pantalla.

public class DiagonalYOrden {
    public static void main(String[] args) {
        int matriz[][] = new int[4][4];

        //DIAGONAL PPAL CON CEROS
        for(int f=0; f<4; f++){
            for(int c=0; c<4; c++){
                if(f==c){
                    matriz[f][c]=0;
                }
                else{
                    matriz[f][c]=1;
                }
            }
        }

        //LECTURA
        for(int f=0; f<4; f++){
            for(int c=0; c<4; c++){
                System.out.print(matriz[f][c] + "   ");
            }
            System.out.println("");
        }

    }
}
