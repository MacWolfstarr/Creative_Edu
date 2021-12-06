package com.example.Creative_Institute.Model;

public class ApexChart {
    public ApexChart(String date, int count) {
        Date = date;
        Count = count;
    }

    private String Date;
    private int Count;

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public int getCount() {
        return Count;
    }

    public void setCount(int count) {
        Count = count;
    }
}
