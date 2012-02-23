package pea.proj2;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;

public class Api extends JFrame {

	private JPanel contentPane;
	private JTextArea textArea;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Api frame = new Api();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Api() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 620, 417);
		setTitle("PEA laboratorium projekt 2");
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		String [] proc = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		
		final JComboBox comboProcessors = new JComboBox(proc);
		comboProcessors.setBounds(105, 30, 40, 20);
		contentPane.add(comboProcessors);
		
		JLabel lblProcessors = new JLabel("Processors :");
		lblProcessors.setBounds(10, 33, 75, 14);
		contentPane.add(lblProcessors);
		
		String [] task = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"};
		final JComboBox comboTasks = new JComboBox(task );
		comboTasks.setBounds(105, 72, 40, 20);
		contentPane.add(comboTasks);
		
		JLabel lblTasks = new JLabel("Tasks :");
		lblTasks.setBounds(10, 75, 46, 14);
		contentPane.add(lblTasks);
		
		JLabel lblTaskRang = new JLabel("Task rang : 1 -");
		lblTaskRang.setBounds(10, 119, 89, 14);
		contentPane.add(lblTaskRang);
		
		String [] range = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"};
		final JComboBox comboRange = new JComboBox(range);
		comboRange.setBounds(105, 116, 40, 20);
		contentPane.add(comboRange);
		
		
		textArea = new JTextArea();
		textArea.setBounds(217, 30, 363, 306);
		
		JScrollPane sp = new JScrollPane(textArea);
		sp.setBounds(217, 30, 363, 306);
		contentPane.add(sp);
		
		JButton btnCount = new JButton("Count");
		btnCount.setBounds(10, 201, 89, 23);
		contentPane.add(btnCount);
		
		btnCount.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				textArea.append("Number of processores : " + comboProcessors.getSelectedItem() + "\n");
				textArea.append("Number of tasks : " + comboTasks.getSelectedItem() + "\n");
				textArea.append("Range of tasks : 1 - " + comboRange.getSelectedItem() + "\n");
				
				Table table = new Table(comboTasks.getSelectedIndex() + 1, comboRange.getSelectedIndex() + 2);
				int [] tasks = table.getTab();
				textArea.append("tasks : ");
				for(int i=0; i<comboTasks.getSelectedIndex() + 1; i++)
					textArea.append(tasks[i] + " , ");
				textArea.append("\n");	
				NaiveAlgo n = new NaiveAlgo(comboTasks.getSelectedIndex() + 1, comboProcessors.getSelectedIndex() + 1, tasks);
				n.distributeTasks();
				Timer timer = new Timer();
				Alg alg = new Alg(comboProcessors.getSelectedIndex() + 1, Util.max(n.getMachines()), tasks );
				int k = alg.run();
				textArea.append("Min cost : " + k + "\n");
				textArea.append(alg.printResult());
			}
		});
		
	}
}
