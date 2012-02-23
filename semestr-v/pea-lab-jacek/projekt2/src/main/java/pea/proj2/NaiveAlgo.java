package pea.proj2;

import java.util.*;

class NaiveAlgo {
    private int n;
    private int m;
    private int [] tab = null;
    private int [] machines = null;
    
    NaiveAlgo(int n, int m,  int [] tab){
        this.n = n; // count of tasks
        this.m = m; // count of machines
        this.tab = tab; // tasks
        machines = new int[this.m]; //cost on each machine
    }
    
    NaiveAlgo(){
        this(0,0,new int[]{0});
    }
    
    public void distributeTasks(){
        Arrays.sort(tab);
        for(int i=n-1; i>=0; i--){
            machines[Util.minIndex(machines)] += tab[i];     
        }
        //for(int i=0; i<m; i++){
       //     System.out.println("machines["+i+"] = " + machines[i]);
       // }
    }
    
    public int [] getMachines(){
        return this.machines;
    }
    
    public int [] getTab(){
        return this.tab;
    }
    
    public void setTab(int [] tab,int n){
        this.tab = null;
        this.tab = tab;
        this.n = n;
    }
    
    public static void main(String[] args){
        NaiveAlgo a = new NaiveAlgo(0,0,new int[]{0});
        
       
        a.distributeTasks();
        int [] t = a.getTab();
        int [] m = a.getMachines();
        System.out.print("tab : ");
        for(int e : t)
            System.out.print(e+" "); 
        System.out.print("\nmachines : "); 
        for(int e : m)
            System.out.print(e+" "); 
        System.out.println("\nsum tab : "+Util.sum(t));
        System.out.println("sum mach : "+Util.sum(m));  
    }  
}
