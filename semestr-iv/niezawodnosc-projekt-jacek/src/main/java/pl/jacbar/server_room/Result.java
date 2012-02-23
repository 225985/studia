package pl.jacbar.server_room;

import java.util.*;
//import javax.swing.JOptionPane;
import java.io.*;

public class Result {
	private int n;
	private int count;
	private int time;
	ArrayList<Coordinates> tab = null;
	boolean [][] devices = null;
	
	Result(){
		this.n = 0;
		this.time = 0;
		this.count = 0;
		devices = new boolean[count][time];
		for(int i=0; i<count; i++)
			for(int j=0; j<time; j++)
				devices[i][j] = true;
	}
	
	Result(int n, int time, int count){
		this.n = n;
		this.time = time;
		this.count = count;
		devices = new boolean[count][time];
		for(int i=0; i<count; i++)
			for(int j=0; j<time; j++)
				devices[i][j] = true;
	}
	
	public void resultLoadData() throws IOException{
			
		ArrayList<String> list = new ArrayList<String>();
		
		Scanner input = new Scanner(new File("list.txt"));
		while(input.hasNext()){
			list.add(input.next());
			input.nextInt();
		}
		input.close();
		
		for(int i=0; i<list.size(); i++){
			Scanner in = new Scanner(new File("test/out_txt/"+list.get(i)+"_"+this.n+".txt"));
			while(in.hasNext()){
				int begin = in.nextInt(), end = in.nextInt();
				for(int j=begin-1; j<end; j++){
					devices[i][j] = false;
				}
			}
			in.close();
		}
		
		System.out.println("Result "+this.n+" load data");
	}
	
	ArrayList<Coordinates> simulate(){
		ArrayList<Coordinates> tab = new ArrayList<Coordinates>();
		int ups_time =0;
		for(int i=0; i<time; i++){
			int x = i;
			double y = 1;
			
			if( !devices[3][1] && !devices[4][i]) y *= 0;
			if( !devices[3][1] && devices[4][i]) y *= 0.66;
			if( devices[3][1] && !devices[4][i]) y *= 0.66;
			if(!devices[10][i] && !devices[9][1]) y *= 0;
			if(!devices[5][i] && !devices[6][i]) y *= 0.2;
			if(!devices[5][i] && !devices[6][i] && !devices[0][i]) y *= 0;
			if(!devices[5][i] && devices[6][i] && !devices[0][i]) y *= 0.2;
			if(devices[5][i] && !devices[6][i] && !devices[0][i]) y *= 0.2;
			if(devices[5][i] && !devices[6][i]) y *= 0.5;
			if(!devices[5][i] && devices[6][i]) y *= 0.5;
			if(!devices[7][i] && !devices[8][i]) y *= 0;
			if(!devices[1][i]) y *= 0;
			if(!devices[2][i]) y *= 0.45;
			if(!devices[8][i] && devices[7][i]) y *= 0.6;
			if( devices[3][1] && !devices[5][i]) y *= 0.44;
			if(!devices[10][i] && !devices[6][1]) y *= 0.3;
			if(!devices[0][i] && !devices[6][i]) y *= 0.2;
			if( devices[3][1] && !devices[5][i]) y *= 0.55;
			if(!devices[2][i] && !devices[9][1]) y *= 0.77;
			if(!devices[4][i] && !devices[2][i]) y *= 0.33;
			
			if( devices[3][1] && !devices[5][i]) y *= 0.44;
			if(!devices[10][i] && devices[6][1]) y *= 0.34;
			if(!devices[0][i] && !devices[6][i]) y *= 0.2;
			if( devices[3][1] && !devices[5][i]) y *= 0.55;
			if(!devices[2][i] && devices[9][1]) y *= 0.25;
			if(!devices[4][i] && devices[2][i]) y *= 0.66;
			
			tab.add(new Coordinates(x,y));
			
		}
		return tab;
	}
	
	public void saveAndGeneratePlot() throws FileNotFoundException, IOException, InterruptedException{
		tab = simulate();
		PrintWriter out = new PrintWriter("test/result_txt/result_"+this.n+".txt");
		for(int i=0; i<tab.size(); i++)
			out.println(tab.get(i).getX()+" "+ tab.get(i).getY());
		out.close();
		
		PrintWriter print = new PrintWriter("tmp");
		print.printf("set term png size 1600, 300 \nset output \"test/result_png/result_%d.png\" \n set xrange [ 0:%d ] \nplot \"test/result_txt/result_%d.txt\" title 'result_%d' with lines",this.n,tab.size(), this.n, this.n);
		print.close();
		
		Runtime rtime = Runtime.getRuntime();
		Process child = rtime.exec("/bin/bash");
		
		BufferedWriter outCommand = new BufferedWriter(new OutputStreamWriter(child.getOutputStream()));
		outCommand.write("gnuplot tmp");
		outCommand.flush();
		outCommand.close();
		child.waitFor();
		
		File file = new File("tmp");
		file.delete();
		
		File file2 = new File("test/result_txt/result_"+this.n+".txt");
		file2.delete();
		
		
		double [] tests = new double[] {1, 0.9, 0.85, 0.75, 0.50};
		
		for(double a : tests){
			PrintWriter p = new PrintWriter(new FileWriter(new File("test/results/A"+(int)(a*100)+".txt"), true));
			p.printf("%1.2f   %1.2f   %1.2f   %1.2f\n",countA(a, 0, 43200),countA(a, 12*43200, 13*43200), countA(a, 60*43200, 61*43200), countA(a, 96*43200, 97*43200));
			p.close();
		}
		
		int [] times = new int[] {0, 12, 60, 96};
		for(double a : tests){
			for(int b : times){
				ArrayList<Integer> t = countD(a, b*43200, (b+1)*43200);
				PrintWriter p = new PrintWriter(new FileWriter(new File("test/results/D"+(int)(a*100)+"_"+b+".txt"), true));
				for(int i=0; i<t.size(); i++)
					p.printf("%d ",t.get(i).intValue());
				p.println(";");
				p.close();
			}
		}
		
		System.out.println("done with result" + "_" + this.n); 
	}

	
	double countA(double level, int timeBegin, int timeEnd){
		int result = 0;
		for(int i=timeBegin; i<=timeEnd; i++){
			if(tab.get(i).getY() >= level)
				result++;
		}
		return 1.0 * result / (timeEnd - timeBegin);
	}
	
	
	ArrayList<Integer> countD(double level, int timeBegin, int timeEnd){
		int counter = 0, i = timeBegin;
		double a;
		Boolean d = false;
		ArrayList<Integer> result = new ArrayList<Integer>();
		
		while( i <= timeEnd){
			if(tab.get(i).getY() <= level){
				a = tab.get(i).getY();
				i++;
				counter++;
				d = true;
				while(a == tab.get(i).getY()){
					counter++;
					i++;
				}
				if(d){
					result.add(new Integer(counter));
					counter = 0;
					d = false;
				}
			}
			i++;
		}
		
		return result;
	}
	
	
}
