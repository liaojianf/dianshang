package com.atguigu.bean;

public class Class2 {

	private int id;
	private String flmch2;
	private int flbh1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFlmch2() {
		return flmch2;
	}

	public void setFlmch2(String flmch2) {
		this.flmch2 = flmch2;
	}

	public int getFlbh1() {
		return flbh1;
	}

	public void setFlbh1(int flbh1) {
		this.flbh1 = flbh1;
	}

	@Override
	public String toString() {
		return "Class2{" +
				"id=" + id +
				", flmch2='" + flmch2 + '\'' +
				", flbh1=" + flbh1 +
				'}';
	}
}
