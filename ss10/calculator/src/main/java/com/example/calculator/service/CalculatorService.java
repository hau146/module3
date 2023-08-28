package com.example.calculator.service;

public class CalculatorService {
    public static float calculator(float firstOperand,float secondOperand, char operator){
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand == 0){
                    throw new RuntimeException("Khong the chia cho 0 nhe cung");
                } else {
                    return firstOperand / secondOperand;
                }
            default:
                throw new RuntimeException("Hoạt động không hợp lệ");
        }
    }
}
