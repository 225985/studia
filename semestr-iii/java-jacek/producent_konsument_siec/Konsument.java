/*
 * Autor Jacek Wieczorek 181043
 * Wt/TP 13.15 - 15.00
 */
import javax.swing.*;
import javax.swing.event.*;
import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.GridLayout;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.*;
import java.net.*;

class Konsument extends JFrame implements Runnable {
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				Konsument frame = new Konsument(JOptionPane
						.showInputDialog("Podaj nazwe"));

			}
		});
	}

	static final int PORT = 10003;
	private String name = null;
	private int sleep = 50;
	private JTextArea text = null;
	private String host = null;
	private Socket socket = null;
	private ObjectOutputStream output = null;
	private ObjectInputStream input = null;
	private boolean run = true;

	Konsument(String name) {
		this.name = name;
		addWindowListener(new WindowListener() {
			public void windowActivated(WindowEvent arg0) {
			}

			public void windowClosed(WindowEvent arg0) {
			}

			public void windowClosing(WindowEvent arg0) {
				try {
					kill();
				} catch (Exception e) {
				}
			}

			public void windowDeactivated(WindowEvent arg0) {
			}

			public void windowDeiconified(WindowEvent arg0) {
			}

			public void windowIconified(WindowEvent arg0) {
			}

			public void windowOpened(WindowEvent arg0) {
			}

		});
		setSize(400, 400);
		setTitle(name);
		setVisible(true);
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 1));
		panel.add(new JLabel("Czas oczekiwania na kolejny produkt"));
		JSlider slider = new JSlider(1, 100, 50);
		slider.setPaintTicks(true);
		slider.setSnapToTicks(true);
		slider.setPaintLabels(true);
		slider.setMajorTickSpacing(10);
		slider.setMinorTickSpacing(1);
		slider.addChangeListener(new ChangeListener() {

			public void stateChanged(ChangeEvent e) {
				JSlider s = (JSlider) e.getSource();
				if (!s.getValueIsAdjusting())
					sleep = s.getValue();
			}

		});

		panel.add(slider);
		add(panel, BorderLayout.NORTH);
		text = new JTextArea();
		JScrollPane pane = new JScrollPane(text);
		add(pane, BorderLayout.CENTER);

		Thread thread = new Thread(this);
		thread.start();
	}

	public void run() {
		try {
			host = InetAddress.getLocalHost().getHostName();
			socket = new Socket(host, PORT);
			input = new ObjectInputStream(socket.getInputStream());
			output = new ObjectOutputStream(socket.getOutputStream());
			output.writeObject(name);

			while (run) {
				try {
					String m = "get";
					output.writeObject(m);
					String msg = (String) input.readObject();
					while (msg.equals(""))
						msg = (String) input.readObject();
					text.append(msg);
					Thread.sleep(10 * sleep);
				} catch (Exception e) {
					e.printStackTrace();
					JOptionPane.showMessageDialog(null,
							"Utracono po³¹czenie z serwerem");
					setVisible(false);
					kill();
					break;
				}

			}
			
				input.close();
				output.close();
				socket.close();
				setVisible(false);
				dispose();
			
		} catch (IOException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "konsument nie dziala");
		}

	}

	synchronized public void kill() throws IOException {
		run = false;
	}

}
