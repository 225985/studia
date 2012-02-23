/*
*Jacek Wieczorek 181043
*Wt/TP 13.15-15.00
*/

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;

class Bufor {
	private char contents;
	JTextArea text = null;
	Rysunek r = null;
	static int size = 1;
	static int actual = 0;
	
	Bufor(JTextArea text, Rysunek r){
		this.text = text;
		this.r = r;
	}

	public synchronized int get(int kons) {
		
		text.append("Konsument #" + kons + " chce zabrac\n");
		while (actual == 0) {
			try {
				text.append("Konsument #" + kons
						+ "   bufor pusty - czekam\n");
				wait();
			} catch (InterruptedException e) {
			}
		}
		actual--;
		r.animacja(ProdKon.pro, ProdKon.kon, 'k', kons);
		text.append("Konsument #" + kons + "      zabral: " + contents+"\n");
		notifyAll();
		return contents;
	}

	public synchronized void put(int prod, char value) {
		
		text.append("Producent #" + prod + "  chce oddac: " + value+"\n");
		while (actual >= size) {
			try {
				text.append("Producent #" + prod
						+ "   bufor zajety - czekam\n");
				wait();
			} catch (InterruptedException e) {
			}
		}
		contents = value;
		actual++;
		r.animacja(ProdKon.pro, ProdKon.kon, 'p', prod);
		text.append("Producent #" + prod + "       oddal: " + value+"\n");
		notifyAll();
	}
	
	static void setSize(int a){
		size = a;
		if(actual > size) actual = size;
	}
}

class Konsument extends Thread {
	Bufor bufor;
	int number;
	boolean suspend = false;
	boolean run = true;

	public Konsument(Bufor bufor, int number) {
		this.bufor = bufor;
		this.number = number;
	}

	public void run() {
		try {
			while (run) {
				bufor.get(number);

				Thread.sleep((int) (Math.random() * 3000));
				synchronized (this) {
					while (suspend)
						wait();
				}
			}
		} catch (InterruptedException e) {
          Thread.currentThread().interrupt();
		}
	}

	void suspendThis() {
		suspend = true;
	}

	synchronized void resumeThis() {
		suspend = false;
		notify();
	}
	
	void kill(){
		run = false;
	}
}

class Producent extends Thread {
	static char item = 'A';

	Bufor bufor;
	int number;
	boolean suspend = false;
	boolean run = true;

	public Producent(Bufor bufor, int number) {
		this.bufor = bufor;
		this.number = number;
	}

	public void run() {
		try {
			while (run) {
				bufor.put(number, '#');
				Thread.sleep((int) (Math.random() * 3000));
				synchronized (this) {
					while (suspend)
						wait();
				}
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}

	}

	void suspendThis() {
		suspend = true;
	}

	synchronized void resumeThis() {
		suspend = false;
		notify();
	}
	
	void kill(){
		run = false;
	}
}



class Rysunek extends JPanel {

	private int proCount;
	private int konCount;
	private char who;
	private int val;

	Rysunek(int proCount, int konCount) {
		setSize(400, 400);
		this.proCount = proCount;
		this.konCount = konCount;
		repaint();
	}

	void animacja(int proCount, int konCount, char who, int val) {
		this.proCount = proCount;
		this.konCount = konCount;
		this.who = who;
		this.val = val;
		repaint();
	}

	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		int y = 5;
		for (int i = 0; i < proCount; i++) {
			if (who == 'p' && val == i + 1) {
				g.setColor(Color.RED);
				g.drawLine(35, y + 5, 200, 200);
			} else {
				g.setColor(Color.BLACK);
				g.drawLine(35, y + 5, 200, 200);
			}
			
			g.setColor(Color.RED);
			g.drawString("P"+(i+1), 10, y+5);
			g.fillOval(30, y, 10, 10);

			y += 400 / (proCount + 1);
		}
		y = 5;
		for (int i = 0; i < konCount; i++) {
			if (who == 'k' && val == i + 1) {
				g.setColor(Color.ORANGE);
				g.drawLine(375, y + 5, 200, 200);
			} else {
				g.setColor(Color.BLACK);
				g.drawLine(375, y + 5, 200, 200);
			}
			g.setColor(Color.ORANGE);
			g.drawString("K"+(i+1), 390, y+5);
			g.fillOval(370, y, 10, 10);

			y += 400 / (konCount + 1);

		}
		g.setColor(Color.GREEN);
		g.fillRect(175, 175, 50, 50);
	}
}



public class ProdKon extends JFrame {

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ProdKon frame = new ProdKon();
					frame.setDefaultCloseOperation(EXIT_ON_CLOSE);
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	private ArrayList<Konsument> konsument = null;
	private ArrayList<Producent> producent = null;
	static int kon = 1;
	static int pro = 1;
	Bufor bufor = null;
	JTextArea text = null;
	JButton stopButton = null;
	JButton startButton = null;
	JButton addKonsument = null;
	JButton addProducent = null;
	JButton deleteKonsument = null;
	JButton deleteProducent = null;
	JButton bufforButton = null;
	JTextField edit = null;
	Rysunek r = null;

	ProdKon() {
		konsument = new ArrayList<Konsument>();
		producent = new ArrayList<Producent>();

		setSize(1050, 470);
		setTitle("ProducentKonsument");

		
		
		// JtextArea
		JPanel centerPanel = new JPanel();
		text = new JTextArea(10,10);
		text.setEditable(false);
		text.setSize(0,0);
		JScrollPane textPane = new JScrollPane(text);
		
		JPanel rysPanel = new JPanel();
		rysPanel.setLayout(null);
		
		r = new Rysunek(10,10);
		
		centerPanel.setLayout(new GridLayout(1,2));
		centerPanel.add(textPane);
		centerPanel.add(r);
		add(centerPanel, BorderLayout.CENTER);
		// koniec JTextArea

		bufor = new Bufor(text,r);

		// Akcje start i stop
		JPanel actionPanel = new JPanel();
		startButton = new JButton("Start");
		startButton.setEnabled(false);
		stopButton = new JButton("Stop");
		startButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				stopButton.setEnabled(true);
				startButton.setEnabled(false);
				text.append("Start\n");
				for (Konsument tab : konsument) {
					tab.resumeThis();
				}
				for (Producent tab : producent) {
					tab.resumeThis();
				}
			}
		});
		actionPanel.add(startButton);

		stopButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				startButton.setEnabled(true);
				stopButton.setEnabled(false);
				text.append("Stop\n");
				for (Konsument tab : konsument) {
					tab.suspendThis();
				}
				for (Producent tab : producent) {
					tab.suspendThis();
				}
			}
		});
		actionPanel.add(stopButton);
		add(actionPanel, BorderLayout.NORTH);
		// koniec akcje start i stop

		// threadPanel
		JPanel threadPanel = new JPanel();
		JPanel konPanel = new JPanel();
		addKonsument = new JButton("Dodaj Kon.");
		deleteKonsument = new JButton("Usun Kon.");

		addKonsument.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				konsument.add(new Konsument(bufor, konsument.size() + 1));
				konsument.get(konsument.size() - 1).start();
				kon = konsument.size();
				if (!deleteKonsument.isEnabled())
					deleteKonsument.setEnabled(true);
			}
		});

		deleteKonsument.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				try {
					konsument.get(konsument.size() - 1).kill();
				} catch (Exception ex) {
				} finally {
					konsument.remove(konsument.size() - 1);
					konsument.trimToSize();
					kon = konsument.size();
					if (konsument.size() == 0)
						deleteKonsument.setEnabled(false);
				}

			}
		});

		konPanel.add(addKonsument);
		konPanel.add(deleteKonsument);

		JPanel proPanel = new JPanel();
		addProducent = new JButton("Dodaj Pro.");
		deleteProducent = new JButton("Usun Pro.");

		addProducent.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				producent.add(new Producent(bufor, producent.size() + 1));
				producent.get(producent.size() - 1).start();
				pro = producent.size();
				if (!deleteProducent.isEnabled())
					deleteProducent.setEnabled(true);
			}
		});

		deleteProducent.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				try {
					producent.get(producent.size() - 1).kill();
				} catch (Exception ex) {
				} finally {
					producent.remove(producent.size() - 1);
					producent.trimToSize();
					pro = producent.size();
					if (producent.size() == 0)
						deleteProducent.setEnabled(false);
				}

			}
		});
		proPanel.add(addProducent);
		proPanel.add(deleteProducent);

		JPanel buforPanel = new JPanel();
		bufforButton = new JButton("Bufor");
		edit = new JTextField(3);
		edit.setText("1");
		bufforButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if(Integer.parseInt(edit.getText()) < 1)
						JOptionPane.showMessageDialog(null,"Rozmiar bufor >=1");
					else
						Bufor.setSize(Integer.parseInt(edit.getText()));
				} catch (NumberFormatException ex) {
					JOptionPane.showMessageDialog(null,
							"To nie liczba calkowita");
				}
			}
		});
		buforPanel.add(bufforButton);
		buforPanel.add(edit);

		threadPanel.setLayout(new GridLayout(3, 1));
		threadPanel.add(konPanel);
		threadPanel.add(proPanel);
		threadPanel.add(buforPanel);
		add(threadPanel, BorderLayout.WEST);
		// koniec threadPanel
		
		
		

		konsument.add(new Konsument(bufor, kon));
		producent.add(new Producent(bufor, pro));
		konsument.get(0).start();
		producent.get(0).start();
		
	}
	
}
