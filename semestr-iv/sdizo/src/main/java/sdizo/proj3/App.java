package sdizo.proj3;

class App {
    public static void main(String[] args) {
        System.out.println("SDIZO Projekt 3");
        
        System.out.println("=== Array ===");
        long time1 = System.currentTimeMillis();
        new Alg(3, 70, new int[]{2,3,6,3,5,7,4,6,70}).run();
        time1 = System.currentTimeMillis() - time1;
        
        System.out.println("=== Tree ===");
        long time2 = System.currentTimeMillis();
        new Alg(3, 70, new int[]{2,3,6,3,5,7,4,6,70}).runAlt();
        time2 = System.currentTimeMillis() - time2;
        
        System.out.println("=== Time ===");
        System.out.println("Array: " + time1);
        System.out.println("Tree : " + time2);

        // new Alg(2, 5, new int[]{1,2,3,4}).run();
        // new Alg(2, 5, new int[]{1,2,3,4}).runAlt();
    }
}
