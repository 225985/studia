/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.awt.event.*;

class TalkWindow extends JFrame implements Runnable {

	
	private JTextField message = new JTextField(20);
	private JTextArea textArea = new JTextArea(15, 18);
	private String name = null;
	private String yourName = null;
	private Socket socket = null;
	private ObjectOutputStream out = null;
	private ObjectInputStream in = null;
	private String host = null;
	private int port;
	private  boolean run = true;

	TalkWindow(String yourName, String name, Socket socket) {
		this.name = name;
		this.yourName = yourName;
		this.socket = socket;
		setTitle(name);
		setSize(300, 310);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JPanel panel = new JPanel();
		JLabel e_mess = new JLabel("Napisz:");
		JLabel e_text = new JLabel("Dialog:");
		textArea.setLineWrap(true);
		textArea.setWrapStyleWord(true);
		panel.add(e_mess);
		panel.add(message);
		message.addActionListener(new TextListener());
		panel.add(e_text);
		JScrollPane scroll_bars = new JScrollPane(textArea,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		panel.add(scroll_bars);
		setContentPane(panel);
		Thread thread = new Thread(this);
		thread.start();

		setVisible(true);
	}

	TalkWindow(String yourName, String name, String host, int port) {
		this.name = name;
		this.yourName = yourName;
		this.host = host;
		this.port = port;
		try {
			this.socket = new Socket(host, port);
		} catch (IOException e) {
			e.printStackTrace();
		}
		setTitle(name);
		setSize(300, 310);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JPanel panel = new JPanel();
		JLabel e_mess = new JLabel("Napisz:");
		JLabel e_text = new JLabel("Dialog:");
		textArea.setLineWrap(true);
		textArea.setWrapStyleWord(true);
		panel.add(e_mess);
		panel.add(message);
		message.addActionListener(new TextListener());
		panel.add(e_text);
		JScrollPane scroll_bars = new JScrollPane(textArea,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		panel.add(scroll_bars);
		setContentPane(panel);
		Thread thread = new Thread(this);
		thread.start();
		setVisible(true);
	}

	public void run() {
		try {
			out = new ObjectOutputStream(socket.getOutputStream());
			out.writeObject(yourName);
			in = new ObjectInputStream(socket.getInputStream());
		    String a = (String)in.readObject();
		    setTitle(a);
		    name = a;
			while (run) {
				String msg = (String) in.readObject();
				textArea.append(name + ">>>" + msg + "\n");
			}
			in.close();
			out.close();
			socket.close();
			socket = null;

		} catch (Exception e) {
			
			
		}finally{
			
		}

	}
	
	public void kill(){
		run = false;
	}

	public static void main(String[] args) {
		new TalkWindow("a", "a", "a", 999);
	}
	
	public boolean equals(Object o){
		if(this == o ) return true;
		if(o == null) return false;
		if(this.getClass() != o.getClass()) return false;
		TalkWindow tw = (TalkWindow)o;
		return  name.equals(tw.name) && yourName.equals(tw.yourName) && host.equals(tw.host) && port == tw.port;
	}
	
	
	private class TextListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if (!message.getText().equals("")) {
				textArea.append(yourName + "<<<" + message.getText() + "\n");
				
				try {
					String msg = message.getText();
					out.writeObject(msg);
					message.setText("");
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}
		}
	}
}
