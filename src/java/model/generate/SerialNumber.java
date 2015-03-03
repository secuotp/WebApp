/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.generate;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author zenology
 */
public class SerialNumber {

    public static String generateSerialNumber(String seed) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        
        String sha1 = encrypt(seed, "SHA-512");
        int count = 0;
        int a = 0;
        int b = 4;
        String text = "";
        
        for (int i = 0; i < 23; i++) {
            if ((count + 1) % 6 != 0) {
                int seedNum = Integer.parseInt(sha1.substring(a, b), 16);
                text = text + SerialQueue.count(((int) (Math.round(Math.random() * 36) ^ seedNum) + seedNum));
            } else {
                text = text + "-";
            }
            count++;
            a += 5;
            b += 5;
        }
        return text;
    }

    public static String generateRemovalCode(String seed) throws NoSuchAlgorithmException, UnsupportedEncodingException {

        String sha1 = encrypt(seed, "MD5");
        int count = 0;
        int a = 0;
        int b = 2;
        String text = "";

        for (int i = 0; i < 10; i++) {
            int seedNum = Integer.parseInt(sha1.substring(a, b), 16);
            text = text + SerialQueue.count(((int)(Math.round(Math.random() * 36) * seedNum) - (seedNum)));

            a += 3;
            b += 3;
        }
        return text;
    }

    private static String encrypt(String seed, String method) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        StringBuilder hexString = new StringBuilder();
        MessageDigest stringDigest = MessageDigest.getInstance(method);
        byte[] buffer = stringDigest.digest(seed.getBytes("utf-8"));

        for (int i = 0; i < buffer.length; i++) {
            if ((0xff & buffer[i]) < 0x10) {
                hexString.append("0").append(Integer.toHexString((0xFF & buffer[i])));
            } else {
                hexString.append(Integer.toHexString(0xFF & buffer[i]));
            }
        }

        return hexString.toString();
    }
}
