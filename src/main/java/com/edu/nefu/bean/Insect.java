package com.edu.nefu.bean;

public class Insect {
    private double rain8;
    private double wet8;
    private double maxTemp1;
    private double minTemp1;
    private double minTemp8;
    private double argTemp7;
    private double numInsect;

    public Insect() {
    }

    public double getRain8() {
        return rain8;
    }

    public void setRain8(double rain8) {
        this.rain8 = rain8;
    }

    public double getWet8() {
        return wet8;
    }

    public void setWet8(double wet8) {
        this.wet8 = wet8;
    }

    public double getMaxTemp1() {
        return maxTemp1;
    }

    public void setMaxTemp1(double maxTemp1) {
        this.maxTemp1 = maxTemp1;
    }

    public double getMinTemp1() {
        return minTemp1;
    }

    public void setMinTemp1(double minTemp1) {
        this.minTemp1 = minTemp1;
    }

    public double getMinTemp8() {
        return minTemp8;
    }

    public void setMinTemp8(double minTemp8) {
        this.minTemp8 = minTemp8;
    }

    public double getArgTemp7() {
        return argTemp7;
    }

    public void setArgTemp7(double argTemp7) {
        this.argTemp7 = argTemp7;
    }

    public double getNumInsect() {
        return numInsect;
    }

    public void setNumInsect() {
        this.numInsect = 0.014 * rain8 + 0.16 * wet8 - 0.159 * maxTemp1 - 0.145 * minTemp1 - 0.271 * minTemp8 - 0.899 * argTemp7 + 4.544;
    }
}
