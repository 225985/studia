/*
 *  Laboratorium 1
 *
 *  Autor: Tymon Tobolski
 *  Data: 17.10.2010
 */
 
import javax.swing.JOptionPane;
 
public class Lab1 {
    private static String nazwisko;
    private static String imie;
    private static int wiek;
    private static float srednia_ocena;
    
    public static void zadanie1(){
        nazwisko = JOptionPane.showInputDialog("Nazwisko: ");
        imie = JOptionPane.showInputDialog("Imie: ");
        
        wiek = Integer.parseInt(JOptionPane.showInputDialog("Wiek: "));
        srednia_ocena = Float.parseFloat(JOptionPane.showInputDialog("Srednia ocena: "));
        
        showMessage("Nazwisko: " + nazwisko +
                     "\nImie: " + imie + 
                     "\nWiek: " + wiek + 
                     "\nSrednia ocena: " + srednia_ocena);
    }
    
    public static void zadanie2(){
        float a = Float.parseFloat(JOptionPane.showInputDialog("a = "));
        float b = Float.parseFloat(JOptionPane.showInputDialog("b = "));
        float c = Float.parseFloat(JOptionPane.showInputDialog("c = "));
        
        if(a == 0){
            showMessage("Brak rownania kwadratowego - nie mozna liczyc pierwiastkow");
            return;
        }
        
        float delta = b*b - 4*a*c;
        
        if(delta < 0){
            showMessage("Brak pierwiastkow rzeczywistych");
        } else if(delta == 0){
            float x0 = -b/(2*a);
            showMessage("Pierwiastek podwojny x1 = x2 = " + x0);
        } else {
            float x1 = (-b - (float)Math.sqrt(delta)) / (2*a);
            float x2 = (-b + (float)Math.sqrt(delta)) / (2*a);
            showMessage("Pierwiastki:\n  x1 = " + x1 + "\n  x2 = " + x2);
        }
    }
    
    public static void zadanie3(){
        for(int i=32; i<=255; i++){
            if(i%10 == 2) System.out.println();
            System.out.printf("% 4d=%c  ", i, i);
        }
        System.out.println();
    }
    
    public static void zadanie4(){
        int rows = Integer.parseInt(JOptionPane.showInputDialog("Ilosc wierszy: "));
        int columns = Integer.parseInt(JOptionPane.showInputDialog("Ilosc kolumn: "));
        
        for(int i=1; i<=rows; i++){
            for(int j=1; j<=columns; j++){
                System.out.printf("% 4d  ", i*j);
            }            
            System.out.println();
        } 
    }
    
    public static void zadanie5(){
        float a = Float.parseFloat(JOptionPane.showInputDialog("a = "));
        float b = Float.parseFloat(JOptionPane.showInputDialog("b = "));
        float c = Float.parseFloat(JOptionPane.showInputDialog("c = "));
        float d = Float.parseFloat(JOptionPane.showInputDialog("d = "));
        float x = Float.parseFloat(JOptionPane.showInputDialog("x = "));
        
        float w;
        w = a*x + b;
        w = w*x + c;
        w = w*x + d;
        
        showMessage("Wartosc wielomianu: " + w);
    }
    
    public static void zadanie6(){
        int a = Integer.parseInt(JOptionPane.showInputDialog("a = "));
        int b = Integer.parseInt(JOptionPane.showInputDialog("b = "));
        
        showMessage("NWD = " + nwd(a,b) + "\nNWW = " + nww(a,b));
    }
    
    public static void zadanie7(){
        float eps = Float.parseFloat(JOptionPane.showInputDialog("eps = "));

        float s1 = 0f;
        float s2 = 0f;
        float x;
        
        for(int k=1; ; k++){
            x = (float)Math.pow(-1, k+1) * 1/(2*k - 1);
            s1 += x;
            if(Math.abs(x) < eps) break;
        }
        
        s1 *= 4;
        
        for(int k=0; ; k++){
            x = 1f/fact(k);
            System.out.println(x);
            s2 += x;
            if(Math.abs(x) < eps) break;
        }
        
        showMessage("S1 = " + s1 + "\nS2 = " + s2);
    }
    
    public static void zadanie8(){
        int n = Integer.parseInt(JOptionPane.showInputDialog("n = "));
        if(n < 3){
            showMessage("Podaj n > 3");
            return;
        }
        
        int s = -1;
        for(int i=3; i<=n; i++){
            s += fact(i-2) - i*Math.floor(((float)fact(i-2))/i);
        }
        
        showMessage("pi(n) = " + s);
    }
    
    public static void zadanie9(){
        int n = Integer.parseInt(JOptionPane.showInputDialog("n = "));
        int next;
        
        for(int i=1; n != 1; i++){
            next = (n % 2 == 0) ? n/2 : 3*n + 1;
            System.out.printf("%d, %d, %s, %d\n", i, n, (n % 2 == 0) ? "parzyste" : "nieparzyste", next);
            n = next;
        }
    }
    
    
    // silnia
    private static int fact(int n){
        return (n <= 1) ? 1 : n*fact(n-1);
    }

    // Najwiekszy wspolny dzielnik
    private static int nwd(int a, int b){
        if(b == 0) return a;
        else return nwd(b, a % b);
    }
    
    // Najmniejsza wspolna wielokrotnosc
    private static int nww(int a, int b){
        return a*b / nwd(a,b);
    }
    
    private static void showMessage(String msg){
        System.out.println(msg);
        JOptionPane.showMessageDialog(null, msg);
    }
    
    public static void main(String[] args){
        int n = Integer.parseInt(JOptionPane.showInputDialog("Podaj numer zadania"));
        switch(n){
            case 1: zadanie1(); break;
            case 2: zadanie2(); break;
            case 3: zadanie3(); break;
            case 4: zadanie4(); break;
            case 5: zadanie5(); break;
            case 6: zadanie6(); break;
            case 7: zadanie7(); break;
            case 8: zadanie8(); break;
            case 9: zadanie9(); break;
        }
        
        // ew przy uzyciu Reflection
        // try {
        //     Class cls = Lab1.class;
        //     cls.getDeclaredMethod("zadanie" + n).invoke(cls);
        // } catch (Throwable e) {
        //     showMessage("Podano bledny numer zadania");
        // }
        
        System.exit(0);
    }
}