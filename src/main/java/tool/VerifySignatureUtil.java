package tool;

import java.security.*;
import java.security.spec.*;
import java.util.Base64;

import javax.crypto.Cipher;

public class VerifySignatureUtil {
	public static void main(String[] args) {
		String hashHex = "74c6855b79e288b47a4409eca5dff4e009845940ddb731a19b2ab1c18614fb78";
		String signatureBase64 = "2xin8WOgGEBXcIlzGdTUTddx0uOUWSpNHTc/rYH8H+TFRoM3wDJlkRUjMWhEpCpagKt9aSDoUjQYWugkArcHToaOU3lwHKKtF31GrT/UdZTYoZcut/z2Gjl5BRz8YM3/eWW5omFAQLSI5bjV8Ga+6MXZTtsc6BtsvhV3C88=";
		String publicKeyBase64 = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDtprX51k3MNBBaEv4HeEpkfrcBzjNHM3EbD6EpRq368fmlYEBPJSmkRh7aymFeQa4r+o1qjiVnMC7oTm4DpJ7jsz98zRk7hWcGMUHREbc0iLc1HITPFAPSnjsjomvuHarCn3Rpqn22eQoUJoZPlSNXRazsw41Yxv//wf0Kjgm+FwIDAQAB";
		VerifySignatureUtil ver = new VerifySignatureUtil();
		boolean result = ver.verifySignature(hashHex, signatureBase64, publicKeyBase64);

		if (result) {
			System.out.println("Chữ ký hợp lệ!");
		} else {
			System.out.println("chữ kí không hợp lệ hoặc bị chỉnh sửa");
		}
	}

	public boolean verifySignature(String hashHex, String signatureBase64, String publicKeyBase64) {
		try {
			byte[] signatureBytes = Base64.getDecoder().decode(signatureBase64);
			byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyBase64);

			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
			PublicKey publicKey = KeyFactory.getInstance("RSA").generatePublic(keySpec);

			Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
			cipher.init(Cipher.DECRYPT_MODE, publicKey);
			byte[] decryptedBytes = cipher.doFinal(signatureBytes);
			String decryptedHash = new String(decryptedBytes);

			return hashHex.equals(decryptedHash);
		} catch (IllegalArgumentException ex) {
			return false;
		} catch (Exception ex) {
			return false;
		}
	}

	// Hàm chuyển hex string về byte[] (nếu bạn cần)
	public byte[] hexStringToByteArray(String s) {
		int len = s.length();
		byte[] data = new byte[len / 2];
		for (int i = 0; i < len; i += 2) {
			data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
		}
		return data;
	}
}