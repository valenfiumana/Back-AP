package vectores;// 3. Se tienen tres vectores. En el primero se guarda un dni, en el segundo un nombre y en el tercero un apellido.
// Se desea un programa que sea capaz de recorrer los tres vectores AL MISMO TIEMPO y mostrar estos datos por pantalla.

public class RecorridoMúltiple {
    public static void main(String[] args) {
        int dni [] = new int[2];
        String nombres [] = new String[2];
        String apellidos [] = new String[2];

        dni[0]=43626420;
        dni[1]=73626420;
        nombres[0]="Valentina";
        nombres[1]="Opal";
        apellidos[0]="Fiumana";
        apellidos[1]="Petrolati";

        for(int i=0; i<nombres.length; i++){
            System.out.print(nombres[i]);
            System.out.print(" "+apellidos[i]+ ", ");
            System.out.print("DNI "+dni[i]+"\n");
        }

    }
}
