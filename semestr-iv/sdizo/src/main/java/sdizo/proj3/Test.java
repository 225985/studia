package sdizo.proj3;

public class Test{
    private Timer timer = null;
    private int n;
    private int range;
    private int m_begin;
    private int m_end;
    private int [] tab = null;
    private int cmax;
    private int tab_begin;
    private int tab_end;
    private Table t = null;
    
    Test(int n, int range, int m_begin, int m_end, int tab_begin, int tab_end){
        this.n = n;
        this.range = range;
        this.m_begin = m_begin;
        this.m_end = m_end;
        timer = new Timer();
        t = new Table(this.n, this.range);
        tab = t.getTab();
        this.tab_begin = tab_begin;
        this.tab_end = tab_end;
    }
    
    Test(){
        this(0,0,0,0,0,0);
    }
    
    public void testChangingM(){
         long[] t = new long[m_end - m_begin +1];
         for(int j=0; j<10; j++){   
            for(int i=m_begin; i<= m_end; i++){ 
                NaiveAlgo n = new NaiveAlgo(this.n, i, tab);
                n.distributeTasks();
                timer.start();
                new Alg(i ,Util.max(n.getMachines()),tab).run();
                t[i - m_begin] += timer.stop();
            }
         }
         for(int i=m_begin; i<= m_end; i++)
            System.out.println(i+" "+t[i-m_begin]);
    }
    
    public void testChangingTab(){
        int proc = 3;
        long[] time = new long[tab_end - tab_begin +1];
        for(int j=0; j<10; j++){ 
            for(int i=tab_begin; i<=tab_end; i++){
                
                t = new Table(i, this.range);
                tab = t.getTab();
                NaiveAlgo n = new NaiveAlgo(i, proc, tab);
                
                n.distributeTasks();

               timer.start();
               new Alg(proc ,Util.max(n.getMachines()),tab).run();
                time[i-tab_begin] += timer.stop();
                
            }
        }
        for(int i=tab_begin; i<=tab_end; i++)
            System.out.println(i+" "+time[i-tab_begin]);
    }
    
    public void testRelativity() {
        for(int i=m_begin; i<= m_end; i++){ 
            NaiveAlgo n = new NaiveAlgo(this.n, i, tab);
            n.distributeTasks();
            int d = new Alg(i ,Util.max(n.getMachines()),tab).run();
            System.out.println(i+" "+100.0*Math.abs(Util.max(n.getMachines())- d)/d);
            
        }
        
    }
    
    public static void main(String [] args){
           System.out.println("chujnia");
            Test t = new Test(5, 20, 2, 6,5,15);
            t.testChangingM();
            System.out.println("======================");
            t.testChangingTab();
            System.out.println("wlasciwy");
            t = new Test(5, 20, 2, 6,5,15);
            t.testChangingM();
            System.out.println("======================");
            t.testChangingTab();       
            
    }
    
}
