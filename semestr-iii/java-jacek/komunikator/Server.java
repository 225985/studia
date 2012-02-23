/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import javax.swing.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import java.net.InetAddress;
import java.util.*;
import java.net.*;

public class Server extends JFrame implements Runnable{
	private JTextField portText = null;
	private JButton startButton = null;
	private Thread thread = null;
	private ServerSocket serverSocket = null;
	private int port = -1;
	private String host = null;
	private ArrayList<ClientData> clientList = null;
	private ArrayList<ServerThread> sList = null;
	private JLabel l = null;
	
	Server(){
		setSize(500,100);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		thread = new Thread(this);
		clientList = new ArrayList<ClientData>();
		sList = new ArrayList<ServerThread>();
		JPanel panel = new JPanel();
		panel.add(new JLabel("Port :"));
		portText = new JTextField(5);
		portText.setText("7777");
		panel.add(portText);
		startButton = new JButton("Start server");
		startButton.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				
					try{
						port = Integer.parseInt(portText.getText());
						thread.start();
						startButton.setEnabled(false);
					}catch(NumberFormatException ex){
						JOptionPane.showMessageDialog(null, "B³êdny format numeru portu");
						portText.setText("");
					}
				}
				
			
		});
		panel.add(startButton);
		l = new JLabel("Serwer jest nieaktywny");
		panel.add(l);
		add(panel,BorderLayout.NORTH);
	}
	
	public void run(){
		Socket socket = null;
		try{
			host = InetAddress.getLocalHost().getHostAddress();
			l.setText("Adres servera : "+host);
			serverSocket = new ServerSocket(port);
			JOptionPane.showMessageDialog(null, "Serwer dzia³a na adresie "+host);
			while(true){
				socket = serverSocket.accept();
				if(socket != null){
					sList.add(new ServerThread(socket, clientList, this));
				}
			}
		}catch(Exception e){
			
		}
	}
	
	synchronized public void sendList() throws IOException{
		ClientList  l = new ClientList();
		for(ServerThread st : sList){
			if(st.life() && st != null)
			   l.add(st.getName());
		
		}
		for(ServerThread st : sList){
			if(st.life() && st != null)
			   st.getOut().writeObject(l);
			
		}
		
	}
	
	public void removethread(ServerThread st){
		clientList.remove(st);
		clientList.trimToSize();
	}
	
	synchronized public void addClientData(ClientData cd){
		try{
			clientList.add(cd);
			sendList();
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	
	synchronized public void removeClientData(ClientData cd){
		try{
			clientList.remove(cd);
			clientList.trimToSize();
			sendList();
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	synchronized public void sendClientData(String name, ObjectOutputStream out ) throws IOException{
		for(ClientData cd : clientList)
			if(cd.getName().equals(name)){
				out.writeObject(cd);
				return;
			}
	}
	
	
   public static void message(String message){
	   JOptionPane.showMessageDialog(null,message);
   }
   public static void message(int message){
	   JOptionPane.showMessageDialog(null,message);
   }
	
	
	public static void main(String [] args){
		EventQueue.invokeLater(new Runnable(){
			public void run(){
				new Server();
			}
		});
	}
	
}
