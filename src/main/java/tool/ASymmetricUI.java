package tool;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.security.NoSuchAlgorithmException;

import javax.crypto.NoSuchPaddingException;
import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;

public class ASymmetricUI extends JPanel {

	private static final long serialVersionUID = 1L;

	// Các thuộc tính
	private JComboBox<String> comboboxKeySize;
	private JPanel panel2;
	private JPanel panel21;
	private JPanel row1, row2, row3;
	private JLabel notifyLabel, originalLabel, resultLabel, labelKeySize;

	private JButton btnGenKey, btnCopyEncrypt, btnClearEncrypt, btnEncrypt, copyPublicKeyBtn,
			copyPrivateKeyFileBtn;
	private JTextField publicKeyField, privateKeyField;
	private JTextArea textArea, originalTextArea, resultTextArea;
	private JScrollPane scrollPane, originalScroll, resultScroll;
	private JPanel panel22, panel4, EncryptPanel, textAreasPanel1,
			originalPanel, resultPanel;
	private JPanel EncryptButtonPanel;

	private ASymmetricCipherController controller;

	public ASymmetricUI() {
		setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		init();
		controller = new ASymmetricCipherController(this);
		action();
	}

	private void init() {

		// Panel 2
		panel2 = new JPanel();
		panel2.setLayout(new GridLayout(1, 2, 5, 5));
		panel2.setBorder(new EmptyBorder(5, 5, 5, 5));

		panel21 = new JPanel();
		panel21.setLayout(new GridLayout(3, 1));

		publicKeyField = new JTextField(30);
		copyPublicKeyBtn = new JButton("Sao chép");
		privateKeyField = new JTextField(30);
		copyPrivateKeyFileBtn = new JButton("Sao chép");
		btnGenKey = new JButton("Tạo khoá");

		row1 = createRow("Public key:", publicKeyField, copyPublicKeyBtn);
		row2 = createRow("Private key:", privateKeyField, copyPrivateKeyFileBtn);

		row3 = new JPanel(new FlowLayout(FlowLayout.CENTER, 5, 5));
		labelKeySize = new JLabel("Key size:");
		String[] keySize = {"1024", "2048", "4096"};
		comboboxKeySize = new JComboBox<>(keySize);
		row3.add(labelKeySize);
		row3.add(comboboxKeySize);
		row3.add(btnGenKey);

		panel21.add(row1);
		panel21.add(row2);
		panel21.add(row3);

		panel22 = new JPanel();
		panel22.setLayout(new BorderLayout(3, 3));

		notifyLabel = new JLabel("Thông báo:");
		panel22.add(notifyLabel, BorderLayout.NORTH);

		textArea = new JTextArea(5, 20);
		textArea.setEditable(false);
		scrollPane = new JScrollPane(textArea);
		panel22.add(scrollPane, BorderLayout.CENTER);

		panel2.add(panel21);
		panel2.add(panel22);

		// Panel nhỏ 4
		panel4 = new JPanel();
		panel4.setLayout(new GridLayout(1, 1, 10, 10));
		panel4.setBorder(new EmptyBorder(5, 5, 5, 5));

		// Vùng 1: Mã hoá
		EncryptPanel = new JPanel(new BorderLayout(10, 10));
		TitledBorder titleBorderEncrypt = BorderFactory.createTitledBorder("Mã hoá");
		titleBorderEncrypt.setTitleJustification(TitledBorder.CENTER);
		titleBorderEncrypt.setTitlePosition(TitledBorder.TOP);
		EncryptPanel.setBorder(titleBorderEncrypt);

		textAreasPanel1 = new JPanel(new GridLayout(1, 2, 10, 10));

		// --- Panel bên trái (Văn bản gốc) ---
		originalPanel = new JPanel(new BorderLayout(5, 5));
		originalLabel = new JLabel("Văn bản gốc:");
		originalTextArea = new JTextArea(10, 30);
		originalScroll = new JScrollPane(originalTextArea);
		originalPanel.add(originalLabel, BorderLayout.NORTH);
		originalPanel.add(originalScroll, BorderLayout.CENTER);

		// --- Panel bên phải (Kết quả mã hóa) ---
		resultPanel = new JPanel(new BorderLayout(5, 5));
		resultLabel = new JLabel("Kết quả mã hóa:");
		resultTextArea = new JTextArea(10, 30);
		resultTextArea.setEditable(false);
		resultScroll = new JScrollPane(resultTextArea);
		resultPanel.add(resultLabel, BorderLayout.NORTH);
		resultPanel.add(resultScroll, BorderLayout.CENTER);

		textAreasPanel1.add(originalPanel);
		textAreasPanel1.add(resultPanel);

		EncryptPanel.add(textAreasPanel1, BorderLayout.CENTER);

		EncryptButtonPanel = new JPanel();
		EncryptButtonPanel.setLayout(new GridLayout(0, 1, 5, 5));
		btnEncrypt = new JButton("Mã hoá");
		btnCopyEncrypt = new JButton("Sao chép");
		btnClearEncrypt = new JButton("Xoá");
		EncryptButtonPanel.add(btnEncrypt);
		EncryptButtonPanel.add(btnCopyEncrypt);
		EncryptButtonPanel.add(btnClearEncrypt);
		EncryptPanel.add(EncryptButtonPanel, BorderLayout.EAST);
		
		panel4.add(EncryptPanel);
		setWrap(originalTextArea, resultTextArea, textArea);
		add(panel2);
		add(panel4);
	}

	private void action() {
		btnClearEncrypt.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				originalTextArea.setText("");
				resultTextArea.setText("");
			}
		});

		actionBtnGenKey();
		actionBtnCopyEncrypt();
		actionBtnEncrypt();
		actionCopyBtn(copyPublicKeyBtn, publicKeyField);
		actionCopyBtn(copyPrivateKeyFileBtn, privateKeyField);
		controller.readFile("key.txt");
	}

	

	private void setWrap(JTextArea... areas) {
		for (JTextArea jTextArea : areas) {
			jTextArea.setLineWrap(true);
			jTextArea.setWrapStyleWord(true);
		}
	}

	private void actionBtnGenKey() {
		btnGenKey.addActionListener(e -> {
			controller.genKey(comboboxKeySize.getSelectedItem().toString());
		});
	}


	private void actionBtnCopyEncrypt() {
		btnCopyEncrypt.addActionListener(e -> {
			controller.copy(resultTextArea.getText());
		});
	}

	private void actionBtnEncrypt() {
		btnEncrypt.addActionListener(e -> {
			try {
				controller.encrypt(originalTextArea.getText(), "");
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (NoSuchPaddingException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		});
	}

	private void actionCopyBtn(JButton btn, JTextField textField) {
		btn.addActionListener(e -> {
			controller.copy(textField.getText());
		});
	}

	public void notify(String message) {
		StringBuilder builder = new StringBuilder(textArea.getText());
		builder.append(message);
		builder.append("\r\n");
		textArea.setText(builder.toString());
	}

	public void updateTextField(JTextField textField, String text) {
		textField.setText(text);
	}

	public void updateTextArea(JTextArea textArea, String text) {
		textArea.setText(text);
	}

	public void updateGenKeyField(String pub, String pri) {
		publicKeyField.setText(pub);
		privateKeyField.setText(pri);
	}


	public void updateTextEncrypt(String string) {
		resultTextArea.setText(string);
	}


	private JPanel createRow(String labelText, JTextField textField, JComponent... trailingComponents) {
		JPanel row = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(0, 5, 0, 5);
		gbc.gridy = 0;

		// Label chính
		JLabel label = new JLabel(labelText);
		gbc.gridx = 0;
		gbc.anchor = GridBagConstraints.WEST;
		row.add(label, gbc);

		// Text field
		gbc.gridx = 1;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.weightx = 1.0;
		row.add(textField, gbc);

		// Các component phụ
		gbc.weightx = 0;
		gbc.fill = GridBagConstraints.NONE;
		for (int i = 0; i < trailingComponents.length; i++) {
			gbc.gridx = 2 + i;
			row.add(trailingComponents[i], gbc);
		}
		return row;
	}

	public void updateKeySize(String keySize) {
		comboboxKeySize.setSelectedItem(keySize);
	}
}
