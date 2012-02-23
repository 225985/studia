/*
 * Autor Jacek Wieczorek 181043
 * Wt/TP 13.15 - 15.00
 */
import java.awt.EventQueue;
import java.awt.event.*;
import javax.swing.*;

public class tester extends JFrame {

	
	public static void main(String[] args) {
		
		EventQueue.invokeLater(new Runnable(){
			public void run(){
				new Serwer();
				new tester();
			}
		});

	}
	
	private int k = 1;
	private int p = 1;
	tester(){
		setSize(300,100);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		JPanel pan = new JPanel();
		JButton kon = new JButton("Konsument");
		kon.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				 
				 Konsument kon = new Konsument("kon"+k);
				 k++;
			}
		});
		pan.add(kon);
		JButton pro = new JButton("Producent");
		pro.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				 
				Producent pro = new Producent("pro"+p);
				 p++;
			}
		});
		pan.add(pro);
		add(pan);
	}

}
