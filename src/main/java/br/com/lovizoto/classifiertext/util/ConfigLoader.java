package br.com.lovizoto.classifiertext.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigLoader {

    private static final Properties properties = new Properties();

    static {
        String fileName = "config.properties";

        try (InputStream inputStream = ConfigLoader.class.getClassLoader().getResourceAsStream(fileName)) {
            if (inputStream == null) {
                throw new IOException("Arquivo de propriedades '" + fileName + "' não encontrado no classpath.");
            }
            properties.load(inputStream);
        } catch (IOException e) {
            throw new RuntimeException("Não foi possível carregar o arquivo de propriedades.", e);
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }


}
