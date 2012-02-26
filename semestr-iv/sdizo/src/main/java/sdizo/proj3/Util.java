package sdizo.proj3;

class Util {
    public static String join(int[] tab){
        StringBuffer sb = new StringBuffer();
        for(int i=0; i<tab.length-1; i++){
            sb.append(tab[i]);
            sb.append(",");
        }
        sb.append(tab[tab.length-1]);
        return sb.toString();
    }
    
    public static int max(int [] tab){
        int max = tab[0];
        for(int i=1; i<tab.length; i++)
            if(tab[i] > max)
                max = tab[i];
        return max;
    }
    
    public static int min(int [] tab){
       int min = tab[0];
        for(int i=1; i<tab.length; i++)
            if(tab[i] < min)
                min = tab[i];
        return min;
    }
    
     public static int maxIndex(int [] tab){
        int max = tab[0], index = 0;
        for(int i=1; i<tab.length; i++)
            if(tab[i] > max){
                max = tab[i];
                index = i;
            }
        return index;
    }
    
    public static int minIndex(int [] tab){
       int min = tab[0], index = 0;
        for(int i=1; i<tab.length; i++)
            if(tab[i] < min){
                min = tab[i];
                index = i;
            }
        return index;
    }
    
    public static int sum(int [] tab){
        int sum = 0;
        for(int e : tab)
            sum += e;
        return sum;
    }
    
    
}
