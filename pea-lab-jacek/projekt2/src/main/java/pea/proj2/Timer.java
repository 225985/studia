package pea.proj2;

class Timer {
    private long started;
    
    
    public void start(){
        started = System.currentTimeMillis();
    }
    
    public long stop(){
        return (System.currentTimeMillis() - started);
    }
}
