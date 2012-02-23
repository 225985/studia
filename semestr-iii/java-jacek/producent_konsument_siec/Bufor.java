/*
 * Autor Jacek Wieczorek 181043
 * Wt/TP 13.15 - 15.00
 */
import java.io.*;
import javax.swing.*;

class Bufor {
	static int buforSize = 1;
	static int actualSize = 0;
	private JTextArea text = null;

	Bufor(JTextArea text) {
		this.text = text;
	}

	synchronized public void addProduct(ObjectOutputStream out, String name)
			throws IOException {
		if(out == null) return; 
		String message = "Chce oddac #\n";
			out.writeObject(message);
			text.append(name + " chce oddac #\n");

		while (actualSize == buforSize) {
			try {
					message = "Bufor pelny - czekam\n";
					out.writeObject(message);
					text.append(name + " bufor pelny - czeka\n");
					
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		if(out == null) return;
		actualSize++;
		message = "Oddalem #\n";
			out.writeObject(message);
			text.append(name + " oddal #\n");
		notifyAll();
	}

	synchronized public void getProduct(ObjectOutputStream out, String name)
			throws IOException {
		if(out == null) return;
		String message = "Chce zabrac #\n";
		

			text.append(name + " chce zabrac #\n");
			out.writeObject(message);
	
		while (actualSize == 0) {
			try {

	
					message = "Bufor pusty - czekam\n";
					out.writeObject(message);
					text.append(name + " bufor pusty - czeka\n");
					wait();

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		if(out == null) JOptionPane.showMessageDialog(null, "dupa");
		actualSize--;
	
			message = "Zabralem #\n";
			out.writeObject(message);
			text.append(name + " zabral #\n");
		
		notifyAll();

	}

	synchronized void setSize(int a) {
		buforSize = a;
		if (actualSize > buforSize)
			actualSize = buforSize;
		text.append("Nowy rozmiar bufora : " + Bufor.buforSize + "\n");
		notifyAll();
		// JOptionPane.showMessageDialog(null, buforSize);
	}
}
