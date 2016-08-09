package com.gmail.mordress;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

/*Singltone*/
public class Parser {

    private static Parser instance;

    private Parser() {
    }

    public static synchronized Parser getInstance() {
        if (instance == null) {
            instance = new Parser();
        }
        return instance;
    }

    public Map<String, String> parse(String url) throws IOException {
        Map<String, String> parsedLinks = new TreeMap<>();
            Document doc = Jsoup.connect(url).get();
            Elements links = doc.select("a");
            for (Element link : links) {
                parsedLinks.put(link.text(), link.attr("abs:href"));
            }

        return parsedLinks;
    }
}