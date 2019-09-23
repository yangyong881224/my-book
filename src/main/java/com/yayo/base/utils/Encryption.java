package com.yayo.base.utils;


import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.security.MD5Encoder;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * 加密工具类
 */
@Slf4j
public class Encryption {
    private static final Base64.Encoder encoder = Base64.getEncoder();
    private static final Base64.Decoder decoder = Base64.getDecoder();

    /**
     * 加密：字符串转base64
     * @param word
     * @return
     */
    public static String strToBase64(String word){
        String encode = encoder.encodeToString(word.getBytes());
        return encode;
    }

    /**
     * 解密：base64转字符串
     * @param encode
     * @return
     */
    public static String base64ToStr(String encode){
        String decode = "";
        byte[] arr = decoder.decode(encode);
        for(byte b : arr){
            char c = (char) b;
            decode += c;
        }
        return decode;
    }

    /**
     * MD5加密
     * @param word
     * @return
     */
    public static String strToMD5(String word) throws NoSuchAlgorithmException {
        //创建SHA算法
        MessageDigest md = MessageDigest.getInstance("SHA");
        //对字节数组对象进行更新处理
        md.update(word.getBytes());
        //进行HASH计算并生成32为字符串密文
        return new BigInteger(md.digest()).toString(32);
    }
}
