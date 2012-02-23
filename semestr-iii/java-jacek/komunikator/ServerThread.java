/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import java.io.*;
import java.net.*;
import java.util.*;

import javax.swing.JOptionPane;

class ServerThread implements Runnable {
	private ObjectInputStream in = null;
	private ObjectOutputStream out = null;
	private Socket socket = null;
	private ClientData data = null;
	private ArrayList<ClientData> clientList = null;
	private Server server;
	private boolean life = true;

	ServerThread(Socket socket, ArrayList<ClientData> clientList, Server server)
			throws IOException {
		this.socket = socket;
		this.clientList = clientList;
		this.server = server;
		Thread thread = new Thread(this);
		thread.start();
	}

	public String getName() {
		return data.getName();
	}

	public ObjectOutputStream getOut() {
		return out;
	}

	public void run() {
		try {
			out = new ObjectOutputStream(socket.getOutputStream());
			in = new ObjectInputStream(socket.getInputStream());
			data = (ClientData) in.readObject();

			server.addClientData(data);
			while (life) {

				String cmd = (String) in.readObject();
				if (cmd.equals("exit")) {
					in.close();
					out.close();
					socket.close();
					socket = null;
					kill();
					break;
				} else {
					server.sendClientData(cmd, out);
				}

			}

		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, "B³ad po³¹czenia z serwerem");
			kill();
		} catch (ClassNotFoundException e) {

		}finally{
			server.removeClientData(data);
			JOptionPane.showMessageDialog(null, data.getName()
					+ "blad - opuscil serwer");
			server.removethread(this);
			
		}

		
	}

	public boolean life() {
		return life;
	}

	public void kill() {
		life = false;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (this.getClass() != o.getClass())
			return false;
		ServerThread st = (ServerThread) o;
		return socket.equals(st.socket) && out.equals(st.out)
				&& in.equals(st.in) && data.equals(st.data)
				&& clientList.equals(st.clientList);
	}
}
