package tool;

import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.time.LocalDateTime;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class ASymmetricCipherController {
	private ASymmetricUI aSymmetricUI;
	private Cipher e;
	private PrivateKey privateKey;
	private PublicKey publicKey;

	public ASymmetricCipherController(ASymmetricUI aSymmetricUI) {
		this.aSymmetricUI = aSymmetricUI;
	}

	private String getTimeNow() {
		return LocalDateTime.now().toString();
	}

	private void notify(String message) {
		aSymmetricUI.notify(String.format("%s: %s", getTimeNow(), message));
	}

	public void copy(String text) {
		if (text == null || text.trim().isEmpty()) {
			notify("chuỗi rỗng");
			return;
		}
		copyToClipboard(text);
		notify("copy thành công");
	}

	public void encrypt(String text, String selectedItem) throws NoSuchAlgorithmException, NoSuchPaddingException {
		if (text == null || text.trim().isEmpty()) {
			notify("chuỗi rỗng");
			return;
		}
		if (publicKey == null) {
			notify("chưa load public key");
			return;
		}
		try {
			e = Cipher.getInstance("RSA/ECB/PKCS1Padding");
			e.init(Cipher.ENCRYPT_MODE, privateKey);
			String encryptText = Base64.getEncoder().encodeToString(e.doFinal(text.getBytes()));
			aSymmetricUI.updateTextEncrypt(encryptText);
			notify("Đã dùng private key mã hoá thành công");
		} catch (BadPaddingException e1) {
			notify("Padding không phù hợp");
		} catch (IllegalBlockSizeException e1) {
			notify("Chuỗi quá dài. Có thể không phải hash value");
		} catch (InvalidKeyException e1) {
			notify("Key không phù hợp");
		}
	}

	public void genKey(String keySize) {
		try {
			KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
			keyPairGenerator.initialize(Integer.valueOf(keySize));
			KeyPair keyPair = keyPairGenerator.generateKeyPair();
			publicKey = keyPair.getPublic();
			privateKey = keyPair.getPrivate();
			String pubKStr = Base64.getEncoder().encodeToString(publicKey.getEncoded());
			String privateKStr = Base64.getEncoder().encodeToString(privateKey.getEncoded());
			aSymmetricUI.updateGenKeyField(pubKStr, privateKStr);
			writeFile("key.txt", pubKStr, privateKStr, keySize);
			notify("tạo khoá thành công");
		} catch (NoSuchAlgorithmException e) {
			notify("không hỗ trợ giải thuật này");
			e.printStackTrace();
		}
	}

	public void readFile(String fileName) {
		String userHome = System.getProperty("user.home");

		File f = new File(userHome + File.separator + fileName);
		if (f.exists()) {
			try (BufferedReader reader = new BufferedReader(new FileReader(f))) {
				reader.readLine(); // header public key
				generatePub(reader.readLine());
				reader.readLine(); // footer public key

				reader.readLine(); // header private key
				generatePri(reader.readLine());
				reader.readLine(); // footer private key
				updateKeySize(reader.readLine());
				aSymmetricUI.updateGenKeyField(Base64.getEncoder().encodeToString(publicKey.getEncoded()),
						Base64.getEncoder().encodeToString(privateKey.getEncoded()));
				notify("Load key đã khởi tạo trước đó thành công");
			} catch (Exception e) {
				e.printStackTrace();
				notify("Key file bị chỉnh sửa. Hãy sử dụng khoá mới");
			}
		}
	}

	private void updateKeySize(String keySize) {
		aSymmetricUI.updateKeySize(keySize);
	}

	private void generatePub(String pub) {
		X509EncodedKeySpec spec = new X509EncodedKeySpec(Base64.getDecoder().decode(pub));
		try {
			KeyFactory factory = KeyFactory.getInstance("RSA");
			publicKey = factory.generatePublic(spec);
		} catch (Exception e) {
			notify("Key file bị chỉnh sửa. Hãy sử dụng khoá mới");
		}
	}

	private void generatePri(String pri) {
		PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(pri));
		try {
			KeyFactory factory = KeyFactory.getInstance("RSA");
			privateKey = factory.generatePrivate(spec);
		} catch (Exception e) {
			notify("Key file bị chỉnh sửa. Hãy sử dụng khoá mới");
		}
	}

	public void writeFile(String fileName, String publicKey, String privateKey, String keySize) {
		String userHome = System.getProperty("user.home");

		File f = new File(userHome + File.separator + fileName);
		try (PrintWriter writer = new PrintWriter(new FileWriter(f))) {
			writer.write("-------------Begin Public Key-------------\r\n");// header public key
			writer.write(publicKey + "\r\n");
			writer.write("-------------End Public Key-------------\r\n"); // footer public key

			writer.write("-------------Begin Private Key-------------\r\n");// header private key
			writer.write(privateKey + "\r\n");
			writer.write("-------------End Private Key-------------\r\n"); // footer private key
			writer.write(keySize);
		} catch (Exception e) {
			notify("Lỗi không xác định khi ghi file");
		}
	}

	public void copyToClipboard(String text) {
		StringSelection selection = new StringSelection(text);
		Toolkit.getDefaultToolkit().getSystemClipboard().setContents(selection, null);
	}
}
