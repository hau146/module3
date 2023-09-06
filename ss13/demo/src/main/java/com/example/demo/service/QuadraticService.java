package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

public class QuadraticService {
    public List<Double> quadratic(double numA, double numB, double numC) {
        double result = Math.pow(numA, 2) - (4 * numB * numC);
        List<Double> doubleList = new ArrayList<>();
        if (result > 0) {
            double equation1 = (-numB + Math.sqrt(result)) / (2 * numA);
            double equation2 = (-numB - Math.sqrt(result)) / (2 * numA);
            doubleList.add(equation1);
            doubleList.add(equation2);
        } else if (result == 0) {
            double equation = -numB / (2 * numA);
            doubleList.add(equation);
        } else {
            return doubleList;
        }
        return doubleList;
    }
}
