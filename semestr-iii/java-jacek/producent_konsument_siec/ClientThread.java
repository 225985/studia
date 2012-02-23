/*
 * Autor Jacek Wieczorek 181043
 * Wt/TP 13.15 - 15.00
 */
import java.io.*;
import java.net.*;
import javax.swing.JTextArea;

import javax.swing.JOptionPane;

class ClientThread implements Runnable {

	private Bufor bufor = null;
	private Socket socket = null;
	private String name = null;
	private JTextArea text = null;
	private ObjectOutputStream output = null;
	private ObjectInputStream input = null;

	ClientThread(Bufor bufor, Socket socket, JTextArea text) throws IOException {
		this.bufor = bufor;
		this.socket = socket;
		this.text = text;
		Thread thread = new Thread(this);
		thread.start();
	}

	public void run() {
		try {
			output = new ObjectOutputStream(socket.getOutputStream());
			input = new ObjectInputStream(socket.getInputStream());
			name = (String) input.readObject();
			while (socket.isConnected()) {
				String msg = (String) input.readObject();
				if (msg.equals("get"))
					bufor.getProduct(output, name);
				else if (msg.equals("put"))
					bufor.addProduct(output, name);
			}
		} catch (Exception e) {
			try {
				input.close();
				output.close();
				output = null;
				socket.close();
				socket = null;
			} catch (IOException ex) {
				Thread.currentThread().interrupt();
			} finally {
				text.append(name + " rozlaczyl sie!!!!!!!!!!!!!!!!!!!!!\n");
			}
		}

	}
}
