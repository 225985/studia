/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import java.io.*;
import java.net.*;

import javax.swing.JOptionPane;

class ServerClientThread implements Runnable {

	private int port;
	private int yourPort;
	private String yourHost = null;
	private String name = null;
	private Socket socket = null;
	private ObjectOutputStream out = null;
	private ObjectInputStream in = null;
	private String host = null;
	private ClientList client = null;
	private boolean run = true;

	ServerClientThread(int port, int yourPort, String host, String name,
			ClientList client) {
		this.port = port;
		this.host = host;
		this.yourPort = yourPort;
		this.name = name;
		this.client = client;
		Thread thread = new Thread(this);
		thread.start();
	}

	public void run() {
		try {
			yourHost = InetAddress.getLocalHost().getHostAddress();

			socket = new Socket(host, port);
			in = new ObjectInputStream(socket.getInputStream());
			out = new ObjectOutputStream(socket.getOutputStream());
			out.writeObject(new ClientData(yourHost, name, yourPort));
            
			while (run) {

				Object o = in.readObject();
				if (o.getClass().equals(client.getClass()))
					client.rewrite((ClientList) o, name);
				else if(o.getClass().equals(ClientData.class)){
					ClientData cd = (ClientData)o;
					new TalkWindow(name,cd.getName(),cd.getHost(),cd.getPort());
				}
			}
			out.writeObject("exit");

		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, "B³¹d po³aczenia z serwerem "
					+ host);
			
			
		} catch (ClassNotFoundException e) {
			
		}
		
	}
	
	public void tryConection(String name) throws IOException{
		out.writeObject(name);
	}
	
	public void kill(){
		run = false;
	}
}
