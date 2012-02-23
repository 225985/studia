package pl.jacbar.server_room;

import java.io.*;
//import java.util.*;

public class Device {
	
	private String name;
	private	int mtbf;
	
	Device(){
		this("no_name",0);
	}
	
	Device(String name, int mtbf){
		this.name = name;
		this.mtbf = mtbf;
	}
	
	public String getName(){
		return this.name;
	}
	
	public int getMTBF(){
		return this.mtbf;
	}
	
	public void simulate(int n, int time, int weibul, int repair) throws IOException, InterruptedException{
		

		
		PrintWriter print = new PrintWriter("tmp.m");
		print.printf("simulation(%d,%d,%d,%d,'test/out_txt/%s_%d.txt','test/out_png/%s_%d.png')", this.mtbf, repair, weibul, time, this.name, n, this.name, n);
		print.close();
		
		Runtime rtime = Runtime.getRuntime();
		Process child = rtime.exec("/bin/bash");
		
		BufferedWriter outCommand = new BufferedWriter(new OutputStreamWriter(child.getOutputStream()));
		outCommand.write("octave tmp.m");
		outCommand.flush();
		outCommand.close();
		child.waitFor();
		
		File file = new File("tmp.m");
		file.delete();
		
		System.out.println("done with " + this.name + "_" + n); 
		

	}
}
