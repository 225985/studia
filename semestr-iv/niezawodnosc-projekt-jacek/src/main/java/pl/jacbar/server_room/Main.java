package pl.jacbar.server_room;

import java.io.*;
import java.util.*;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws IOException, InterruptedException {
		
		int n = args.length > 0 ? Integer.parseInt(args[0]) : 5;
		int time = args.length > 0 ? Integer.parseInt(args[1]) : 100000;
		int repair = args.length > 0 ? Integer.parseInt(args[2]) : 10;
		int weibul = args.length > 0 ? Integer.parseInt(args[3]) : 2;
		
		ArrayList<Device> tab = new ArrayList<Device>();
		
		Scanner in = new Scanner(new File("list.txt"));
		while( in.hasNext() )
			tab.add(new Device(in.next(), in.nextInt()));
		in.close();
				
		
		
		for(int i=0; i<n; i++)
			for(int j=0; j<tab.size(); j++)
				tab.get(j).simulate(i, time, weibul, repair);
			
		
		for(int i=0; i<n; i++){
			Result r1 = new Result(i, time, tab.size());
			r1.resultLoadData();
			r1.saveAndGeneratePlot();
		}
		
		
		
	}

}
