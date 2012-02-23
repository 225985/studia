/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.net.InetAddress;
import java.io.*;

import javax.swing.*;

class ClientList extends JScrollPane {
	private JList list = null;
	private DefaultListModel listModel = null;
	private ServerClientThread client = null;
	
	ClientList(){
		this.client = client;
		listModel = new DefaultListModel();
		list = new JList(listModel);
		list.addMouseListener(new MouseListener(){
			public void mouseClicked(MouseEvent e) {
				if(e.getClickCount() >= 2 ){
					if(!getSelectedItem().equals(""))
						try{
							
							client.tryConection(getSelectedItem());
						}catch(Exception ex){
							
						}
				}
			}
			public void mouseEntered(MouseEvent arg0) {}
			public void mouseExited(MouseEvent arg0)  {}
			public void mousePressed(MouseEvent arg0) {}
			public void mouseReleased(MouseEvent arg0){}
			
		});
		setSize(200,400);
		setViewportView(list);
	}
	
	public void clear(){
		listModel.clear();
		listModel.trimToSize();
	}
	
	public void rewrite(ClientList cl){
		clear();
		for(int i=0; i<cl.elementsCount();i++){
			add(cl.get(i));
		}
	}
	
	public void rewrite(ClientList cl, String name){
		clear();
		for(int i=0; i<cl.elementsCount();i++){
			if(!cl.get(i).equals(name))
					add(cl.get(i));
		}
	}
	
	public void add(Object o){
		listModel.addElement(o);
	}
	
	public String get(int i){
		return (String)listModel.get(i);
	}
	
	public int elementsCount(){
		return listModel.getSize();
	}
	
	public String getSelectedItem(){
		return (String)list.getSelectedValue();
	}
	
	public void setThread(ServerClientThread client){
		this.client = client;
	}
	

}
