package pea.proj2;

class App {
    public static void main(String[] args) {
        System.out.println("PEA Projekt 2");
       
        System.out.println("=== Array ===");
        long time1 = System.currentTimeMillis();
        int [] tab = new int[]{2,3,6,3,5,7,4,6,4};
		for(int i=0; i<9; i++)
			System.out.print(tab[i] + " , ");
		System.out.println();
		Alg a = new Alg(3, 70, tab);
		a.run();
		a.printResult();
        
    }
}
