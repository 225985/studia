package pea.proj2;

class App {
    public static void main(String[] args) {
        System.out.println("PEA Projekt 2");
       
        System.out.println("=== Array ===");
        long time1 = System.currentTimeMillis();
        int [] tab = new int[]{1,2,3,4,5};
		for(int i=0; i<5; i++)
			System.out.print(tab[i] + " , ");
		System.out.println();
		Alg a = new Alg(2, 8, tab);
		System.out.println(a.run());
		System.out.println(a.printResult());
        
    }
}
