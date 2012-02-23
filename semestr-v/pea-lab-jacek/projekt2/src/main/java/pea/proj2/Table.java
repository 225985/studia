package pea.proj2;

import java.util.*;

class Table {
    private int n;
    private int range;
    private int[] tab = null;
    
    Table(int n, int range){
        this.n = n;
        this.range = range;
        tab = new int[this.n];
        Random rd = new Random();
        for(int i=0; i<n; i++)
            tab[i] = rd.nextInt(this.range) + 1;
    }
    
    Table(){
        this(5,10);
    }
    
    public int getN(){
        return this.n;
    }
    
    public int [] getTab(){
        return this.tab;
    }
}
