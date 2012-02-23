/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import javax.swing.*;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.*;
import java.util.ArrayList;
import java.net.*;
import java.io.*;

class Client extends JFrame implements Runnable {

	private ClientList list = new ClientList();
	private ServerSocket serverSocket = null;
	private String name = null;
	private String serverAddress = null;
	private int servPort;
	private int yourPort;
	private ArrayList<TalkWindow> talkList = new ArrayList<TalkWindow>();
	private ServerClientThread t = null;
	private boolean run = true;

	Client() {
		setSize(200, 400);
		setVisible(true);
		
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		
		list = new ClientList();
		add(list, BorderLayout.CENTER);

		name = JOptionPane.showInputDialog("Podaj twój nick");
		serverAddress = JOptionPane.showInputDialog("Podaj adres serwera");
		servPort = readPort("Podaj numer portu serwera");
		yourPort = readPort("Podaj numer twojego portu");
		setTitle(name);
	    t = new ServerClientThread(servPort, yourPort,
				serverAddress, name, list);
		list.setThread(t);
		Thread t1 = new Thread(this);
		t1.start();
	}

	public int readPort(String message) {
		while (true) {
			try {
				return Integer.parseInt(JOptionPane.showInputDialog(message));
			} catch (NumberFormatException e) {
				JOptionPane.showMessageDialog(null, "B³êdny numer portu");
			}
		}
	}

	public void addToList(String a) {
		list.add(a);
	}

	public void clearList() {
		list.clear();
	}

	public void run() {
		Socket s = null;
		try {
			serverSocket = new ServerSocket(yourPort);
			while (run) {
				s = serverSocket.accept();
				if (s != null) {
					talkList.add(new TalkWindow(name, "", s));
				}
			}
		} catch (IOException e) {
			Server.message("B³¹d przy po³aczeniu z klientem");
		} finally {
			for (TalkWindow tw : talkList) {
				tw.kill();
			}
			t.kill();
		}

	}
	
	public void remove(TalkWindow tw){
		talkList.remove(tw);
		talkList.trimToSize();
	}
	
	public void kill(){
		run = false;
	}

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				new Client();
			}
		});
	}
}
