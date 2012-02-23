/*
*Jacek Wieczorek 181043
*Wt/TP 13.15-15.00
*/


import java.awt.*;
import java.util.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;

class Ball {

	private int x = 0;
	private int y = 0;
	private int r = 200;
	private int speed;
	private int time = 0;
	private Color color = null;

	Ball(int speed) {
		this.speed = speed;
		Random rd = new Random();
		this.color = new Color(rd.nextInt(256), rd.nextInt(256),
				rd.nextInt(256));
		countPosition();

	}

	void setSpeed(int speed) {
		this.speed = speed;
	}

	void countPosition() {
		if (time == 360)
			time = 0;
		x = (int) (r * Math.cos(Math.PI * time / 180));
		y = (int) (r * Math.sin(Math.PI * time / 180));
		time += 5;

	}

	void setX(int x) {
		this.x = x;
	}

	void setY(int y) {
		this.y = y;
	}

	int getX() {
		return this.x;
	}

	int getY() {
		return this.y;
	}

	Color getColor() {
		return this.color;
	}

	int getSpeed() {
		return this.speed;
	}

	int getR() {
		return this.r;
	}

	synchronized Position nextMove() {
		return new Position((int) (r * Math.cos(Math.PI * time / 180)),
				(int) (r * Math.sin(Math.PI * time / 180)));
	}

}

class BallObject {

	private Circle circle = null;
	private Ball ball = null;
	private BallRunnable bRunnable = null;
	private CircleManager cm = null;
	private Thread t = null;
	private JPanel panel = null;
	private JSlider slider = null;
	private int number;

	BallObject(Circle circle, JPanel panel, int number, CircleManager cm) {
		this.circle = circle;
		this.number = number;
		ball = new Ball(10);
		this.cm = cm;
		this.cm.addPosition(new Position());
		this.circle.addBall(ball);
		bRunnable = new BallRunnable(ball, circle, cm, this.number);
		t = new Thread(bRunnable);
		t.start();
		slider = new JSlider(1, 20, 10);
		slider.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				JSlider s = (JSlider) e.getSource();
				if (!s.getValueIsAdjusting())
					ball.setSpeed(s.getValue());
			}

		});
		this.panel = panel;
		panel.add(slider);
	}
	
	void stopThread(){
		bRunnable.stopThread();
		panel.remove(slider);
				
	}

}

class BallRunnable implements Runnable {

	private Ball ball = null;
	private CircleManager cm = null;
	private Circle circle = null;
	private boolean run = true;
	private int number;

	BallRunnable(Ball ball, Circle circle, CircleManager cm, int number) {
		this.ball = ball;
		this.cm = cm;
		this.circle = circle;
		this.number = number;
	}

	public void run() {
		try {
			while (run) {
				cm.moveSystem(ball.nextMove(), ball, number);
				Thread.sleep(20*(30 - ball.getSpeed()));
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}finally{
		   cm.removePosition();
		}

	}

	void stopThread() {
		this.run = false;
		this.circle.removeBall();
	}

}

class Circle extends JPanel {
	ArrayList<Ball> tab = null;
	private int xCenter = 250;
	private int yCenter = 250;
	private int d = 400;

	Circle() {
		setSize(500, 500);
		tab = new ArrayList<Ball>();
	}

	void addBall(Ball ball) {
		tab.add(ball);
	}

	void removeBall() {
		tab.remove(tab.size() - 1);
		tab.trimToSize();
		if (tab.size() == 0)
			repaint();
	}

	public synchronized void paintComponent(Graphics g) {
		super.paintComponent(g);
		g.setColor(Color.BLACK);
		g.drawOval(xCenter - d / 2, yCenter - d / 2, d, d);
		for (Ball b : tab) {
			g.setColor(b.getColor());
			g.fillOval(xCenter - 10 - b.getX(), yCenter - 10 - b.getY(), 20, 20);
		}
	}
}

class CircleManager {
	Circle r = null;
	ArrayList<Position> tab = null;

	CircleManager(Circle r) {
		this.r = r;
		tab = new ArrayList<Position>();
	}

	void addPosition(Position p) {
		tab.add(p);
	}

	public synchronized void changePosition(int i, Position p) {

		tab.set(i - 1, p);

	}

	boolean containP(Position p) {

		return tab.contains(p);
	}

	void removePosition() {
		tab.remove(tab.size() - 1);
		tab.trimToSize();
	}

	public synchronized void moveSystem(Position p, Ball b, int number)
			throws InterruptedException {

		while (containP(p))
			wait();
		b.countPosition();
		changePosition(number, p);
		r.repaint();
		notifyAll();
	}
}

class Position {
	private int x;
	private int y;

	Position() {
		this.x = 200;
		this.y = 0;
	}

	Position(int x, int y) {
		this.x = x;
		this.y = y;
	}

	void setX(int x) {
		this.x = x;
	}

	void setY(int y) {
		this.y = y;
	}

	int getX() {
		return this.x;
	}

	int getY() {
		return this.y;
	}
	
	public String toString(){
		return this.x + " " + this.y;
	}
	
	public boolean equals(Object o){
		if(this == o) return true;
		if(o == null) return false;
		if(this.getClass() != o.getClass()) return false;
		Position ot = (Position) o;
		  return x == ot.x && y == ot.y;
	}
}

public class Kulki extends JFrame {
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {

				try {
					Kulki frame = new Kulki();
					frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	Circle circle = null;
	CircleManager cm = null;
	JPanel sliderPanel = null;
	ArrayList<BallObject> tab = null;
	JButton stopButton = null;
	int count = 0;

	Kulki() {
		setSize(1000, 600);
		setTitle("Kulki");

		tab = new ArrayList<BallObject>();
		circle = new Circle();
		cm = new CircleManager(circle);
		sliderPanel = new JPanel();

		sliderPanel.setLayout(new GridLayout(10, 1));

		JPanel centerPanel = new JPanel();
		centerPanel.setLayout(new GridLayout(1, 2));
		centerPanel.add(circle);
		centerPanel.add(sliderPanel);

		JPanel bPanel = new JPanel();
		JButton addButton = new JButton("Add");
		addButton.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				if (count < 10) {
					tab.add(new BallObject(circle, sliderPanel, tab.size() + 1,
							cm));
					stopButton.setEnabled(true);
					update();
					count++;
				} else {
					JOptionPane.showMessageDialog(null, "Za duzo kulek");
				}

			}

		});

		stopButton = new JButton("Remove");
		stopButton.setEnabled(false);
		stopButton.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {

				try {
					tab.get(tab.size() - 1).stopThread();
				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					tab.remove(tab.size() - 1);
					tab.trimToSize();
					count--;
					update();
					if (tab.size() == 0) {
						stopButton.setEnabled(false);
					}
				}
			}

		});

		bPanel.add(addButton);
		bPanel.add(stopButton);

		add(bPanel, BorderLayout.NORTH);
		add(centerPanel, BorderLayout.CENTER);

	}

	public void update() {
		SwingUtilities.updateComponentTreeUI(this);
	}

}