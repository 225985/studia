package pl.jacbar.server_room;

class Coordinates {
	private int x;
	private double y;
	
	Coordinates(){
		this(0,0);
	}
	
	Coordinates(int x, double y){
		this.x = x;
		this.y = y;
	}
	
	int getX(){
		return this.x;
	}
	
	double getY(){
		return this.y;
	}
	
}
