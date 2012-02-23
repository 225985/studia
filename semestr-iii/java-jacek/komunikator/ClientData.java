/*
 * Jacek Wieczorek 181043
 * wt/TP 13.15-15
 */
import java.io.*;

class ClientData implements Comparable<ClientData>, Serializable {
	private String host;
	private String name;
	private int port;
	
	ClientData(){
		this.host = "localhost";
		this.name = "guest";
		this.port = 7777;
	}
	
	ClientData(String host, String name, int port){
		this.host = host;
		this.name = name;
		this.port = port;
	}
	
	public String getHost(){
		return this.host;
	}
	
	public String getName(){
		return this.name;
	}
	
	public int getPort(){
		return this.port;
	}
	
	public void setHost(String host){
		this.host = host;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setPort(int port){
		this.port = port;
	}
	
	public int compareTo(ClientData a){
		return name.compareTo(a.name);
	}
	
	public boolean equals(Object o){
		if(this == o) return true;
		if(o == null) return false;
		if(this.getClass() != o.getClass()) return false;
		ClientData cd = (ClientData)o;
		return this.host.equals(cd.host) && this.name.equals(cd.name) && this.port == cd.port ;
	}

}
