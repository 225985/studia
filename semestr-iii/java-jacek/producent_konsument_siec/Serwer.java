/*
 * Autor Jacek Wieczorek 181043
 * Wt/TP 13.15 - 15.00
 */

import java.net.*;
import java.io.*;
import javax.swing.*;
import javax.swing.event.*;

import java.awt.*;


public class Serwer extends JFrame implements Runnable {

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				Serwer frame = new Serwer();
				
			}

		});
	}

	static final int PORT = 10003;
	private ServerSocket serverSocket = null;
	private String host = null;
	private Bufor bufor = null;
	private JTextArea text = null;

	Serwer() {
		setSize(400, 400);
		setTitle("Producent - Konsument sieciowy");
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		setVisible(true);
		text = new JTextArea();
		bufor = new Bufor(text);

		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 1));
		panel.add(new JLabel("Rozmiar bufora"));
		JSlider slider = new JSlider(1, 11, 1);
		slider.setPaintTicks(true);
		slider.setSnapToTicks(true);
		slider.setPaintLabels(true);
		slider.setMajorTickSpacing(5);
		slider.setMinorTickSpacing(1);
		slider.addChangeListener(new ChangeListener() {

			public void stateChanged(ChangeEvent e) {
				JSlider s = (JSlider) e.getSource();
				if (!s.getValueIsAdjusting()){
					bufor.setSize(s.getValue());
				   
				}
				
				
			}
		});

		panel.add(slider);
		add(panel, BorderLayout.NORTH);

		JScrollPane pane = new JScrollPane(text);
		add(pane, BorderLayout.CENTER);
		Thread thread = new Thread(this);
		thread.start();
	}

	public void run() {
		Socket socket = null;

		try {
			host = InetAddress.getLocalHost().getHostAddress();
			serverSocket = new ServerSocket(PORT);
			message("Serwer dziala " + host);
			while (true) {
				try {
					socket = serverSocket.accept();
					if (socket != null) {
						ClientThread thread = new ClientThread(bufor, socket, text);
					}
				}

				catch (IOException e) {
					e.printStackTrace();
					message("Nie mozna dodac klienta");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			message("Serwer nie dziala");

			System.exit(0);
		}

	}

	void message(String message) {
		JOptionPane.showMessageDialog(null, message);
	}
}
