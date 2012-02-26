package sdizo.proj3;

import java.util.*;

class Node {
    public Node parent;
    public int[] coords;
    public int task;
    public int processor;

    public Node(int[] c, int t, Node p, int pr){
        this.coords = c;
        this.task = t;
        this.parent = p;
        this.processor = pr;
    }
    
    public Node(int[] c, int t){
        this(c, t, null, -1);
    }
    
    public String toString(){
        return "("+task+", ["+Util.join(coords)+"])";
    }
}

public class Alg {
    int n;
    int c;
    int[] tasks;
    Vector<List<Integer>> processors;
    
    Node root;
    
    List<Node> leafs = new ArrayList<Node>();
    
    public Alg(int n, int c, int[] tasks){
        this.n = n;
        this.c = c+1;
        this.tasks = tasks;
        this.processors = new Vector<List<Integer>>(n);
        for(int i=0; i<n; i++){
            this.processors.insertElementAt(new ArrayList<Integer>(), i);
        }
    }
    
    public void runAlt(){
       //  System.out.println("[ALT] Number of processors = " + n + ", Cmax = " + c);
        
        int[] coords = new int[n];
        for(int i=0; i<n; i++) coords[i] = 0;
        
       // System.out.println("[ALT] tasks.length = " + tasks.length);
        
        root = new Node(coords, 0);
        branch(root);
        
        
        Node node = minimalMaximumTime(leafs);
      //  System.out.println("[ALT] minimal.maximum.time = " + node);
        
        
        
        while(node.processor != -1){
            processors.elementAt(node.processor).add(node.task);
            node = node.parent;
        }
        
        printProcessors();
    }
    
    public Node minimalMaximumTime(List<Node> list){
     //   System.out.println("[ALT] list.size = " + list.size());
        int size = list.size();
        Node minValue = list.get(0);
        int minIndex = maxMachineIndex(minValue.coords);
        
        for(int i=1; i<size; i++){
            Node node = list.get(i);
            int[] crds = node.coords;
            int max = maxMachineIndex(crds);
            if(crds[max] < minValue.coords[minIndex]){
                minValue = node;
                minIndex = max;
            }
        }
        
        return minValue;
    }
    
    
    protected void branch(Node node){
        // System.out.println("[ALT] Processing node: " + node);
        if(node.task == tasks.length){
            leafs.add(node);
        } else {
            for(int i=0; i<n; i++){
                int[] newcrds = new int[n];
                System.arraycopy(node.coords, 0, newcrds, 0, n);
                newcrds[i] += tasks[node.task];
                if(newcrds[i] < c){
                    branch(new Node(newcrds, node.task+1, node, i));
                }
            }
        }
    }
    
    
    
    
    
    public int run(){
       // System.out.println("Number of processors = " + n + ", Cmax = " + c);
        int[] tab = new int[(int)Math.pow(c,n)];
        tab[0] = 0;
        for(int i=1; i<tab.length; i++) tab[i] = -1;
        
        for(int k=0; k<tasks.length; k++){
            for(int i=0; i<tab.length; i++){
                if(tab[i] == k){
                    int[] crds = indexToCoords(i);
                    
                    for(int j=0; j<n; j++){
                        int[] newcrds = new int[n];
                        System.arraycopy(crds, 0, newcrds, 0, n);
                        newcrds[j] += tasks[k];
                        if(newcrds[j] < c){
                            int index = coordsToIndex(newcrds);
                            if(index < tab.length){
                                tab[index] = k+1;
                            }
                        }
                    }
                }
            }
        }

        
        int[] lastCrds = minimalMaximumTime(findLastTask(tab));
        
       // System.out.println("minimal.maximum.time = " + Util.join(lastCrds));
        
        for(int k=tasks.length; k>0; k--){
            for(int j=0; j<n; j++){
                int[] newcrds = new int[n];
                System.arraycopy(lastCrds, 0, newcrds, 0, n);
                newcrds[j] -= tasks[k-1];
                
                if(newcrds[j] >= 0){
                    int index = coordsToIndex(newcrds);
                    if(tab[index] == k-1){
                        lastCrds = newcrds;
                        processors.elementAt(j).add(k);
                        break;
                    }
                }
            }
        }

        return printProcessors();

    }
    
    public int printProcessors(){
        int max = 0;
        Iterator<Integer> it = processors.elementAt(0).iterator();
            while(it.hasNext()){
                int e = tasks[it.next()-1];
                max += e;
                //System.out.print(e + " ");
            }
        for(int i=1; i<n; i++){
            int sum = 0;
            it = processors.elementAt(i).iterator();
            while(it.hasNext()){
                int e = tasks[it.next()-1];
                sum += e;
                //System.out.print(e + " ");
            }
            if(sum > max)
                max = sum;
        }
        return max;
    }
        
    public int[] minimalMaximumTime(List<int[]> list){
       // System.out.println("list.size = " + list.size());
        int size = list.size();
        int[] minValue = list.get(0);
        int minIndex = maxMachineIndex(minValue);
        
        for(int i=1; i<size; i++){
            int[] crds = list.get(i);
            int max = maxMachineIndex(crds);
            if(crds[max] < minValue[minIndex]){
                minValue = crds;
                minIndex = max;
            }
        }
        
        return minValue;
    }
    
    public int maxMachineIndex(int[] crds){
        int maxValue = crds[0];
        int maxIndex = 0;
        for(int i=1; i<crds.length; i++){
            if(crds[i] > maxValue){
                maxIndex = i;
                maxValue = crds[i];
            }
        }
        return maxIndex;
    }
    
    public int minMachineIndex(int[] crds){
        int minValue = crds[0];
        int minIndex = 0;
        for(int i=1; i<crds.length; i++){
            if(crds[i] < minValue){
                minIndex = i;
                minValue = crds[i];
            }
        }
        return minIndex;
    }
    
    public ArrayList<int[]> findLastTask(int[] tab){
        ArrayList<int[]> list = new ArrayList<int[]>();
        
        for(int i=0; i<tab.length; i++){
            if(tab[i] == tasks.length){
                int[] crds = indexToCoords(i);
                list.add(crds);
            }
        }
        return list;
    }
    
    public int[] indexToCoords(int x){
        int[] crds = new int[n];
        for(int i=n-1; i>=0; i--){
            crds[i] = x % c;
            x /= c;
        }
        return crds;
    }
    
    public int coordsToIndex(int[] crds){
        int index = 0;
        for(int i=0; i<n; i++){
            index += crds[i]*(int)Math.pow(c, n-i-1);
        }
        
        return index;
    }
}
