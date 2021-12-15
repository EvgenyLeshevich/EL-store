package com.elstr;

import com.elstr.entities.product.Product;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.Locale;

public class Test {
    public static void main(String[] args) {
        BigDecimal result2 = new BigDecimal(2).setScale(2, RoundingMode.HALF_UP);
        System.out.println(result2);
        NumberFormat form = NumberFormat.getCurrencyInstance(new Locale("de", "DE"));
        NumberFormat formUs = NumberFormat.getCurrencyInstance(new Locale("en", "US"));
        NumberFormat formRu = NumberFormat.getCurrencyInstance(new Locale("ru", "RU"));
        NumberFormat formBy = NumberFormat.getCurrencyInstance(new Locale("be", "BY"));
        BigDecimal by = new BigDecimal("2.5");

        System.out.println("Amount Euro: " + form.format(result2));
        System.out.println("Amount UA: " + formUs.format(result2));
        System.out.println("Amount RUS: " + formRu.format(result2));
        System.out.println("Amount BY: " + formBy.format(by));

        Product product = new Product();
        product.setName("ssas");
        System.out.println(product.getName());
    }
}
