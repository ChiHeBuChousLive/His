package com.demo;

import java.util.Random;

public class Test
{
    public static void main(String[] args) {
        Random random = new Random();
        double x =Float.parseFloat(String.format("%.2f",random.nextDouble()*0.2+0.9));
        System.out.println(x);
        System.out.println(Float.parseFloat(String.format("%.2f",random.nextFloat()*0.2+0.9)));
    }
}
