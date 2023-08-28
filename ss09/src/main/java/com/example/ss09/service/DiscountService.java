package com.example.ss09.service;

public class DiscountService {
    public static Double getDiscountPrice(Double discountPercent, Double discountAmount) {
        Double discountPrice = discountPercent - discountAmount;
        return discountPrice;
    }
    public static Double getDouble(Double listPrice, Double discountPercent) {
        Double discountAmount = listPrice * discountPercent * 0.01;
        return discountAmount;
    }
}
