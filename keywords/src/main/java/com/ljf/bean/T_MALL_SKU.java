package com.ljf.bean;

import org.apache.solr.client.solrj.beans.Field;

import java.util.Date;

public class T_MALL_SKU {

	@Field("id")
	private int id;
	@Field("shp_id")
	private int shp_id;
	@Field("kc")
	private int kc;
	@Field("jg")
	private Double jg;
	@Field("chjshj")
	private Date chjshj;
	@Field("sku_mch")
	private String sku_mch;
	@Field("kcdz")
	private String kcdz;
	@Field("sku_xl")
	private long sku_xl;

	public long getSku_xl() {
		return sku_xl;
	}

	public void setSku_xl(long sku_xl) {
		this.sku_xl = sku_xl;
	}

	public String getKcdz() {
		return kcdz;
	}

	public void setKcdz(String kcdz) {
		this.kcdz = kcdz;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getShp_id() {
		return shp_id;
	}

	public void setShp_id(int shp_id) {
		this.shp_id = shp_id;
	}

	public int getKc() {
		return kc;
	}

	public void setKc(int kc) {
		this.kc = kc;
	}

	public Date getChjshj() {
		return chjshj;
	}

	public void setChjshj(Date chjshj) {
		this.chjshj = chjshj;
	}

	public String getSku_mch() {
		return sku_mch;
	}

	public void setSku_mch(String sku_mch) {
		this.sku_mch = sku_mch;
	}

	public Double getJg() {
		return jg;
	}

	public void setJg(Double jg) {
		this.jg = jg;
	}

	@Override
	public String toString() {
		return "T_MALL_SKU{" +
				"id=" + id +
				", shp_id=" + shp_id +
				", kc=" + kc +
				", jg=" + jg +
				", chjshj=" + chjshj +
				", sku_mch='" + sku_mch + '\'' +
				", kcdz='" + kcdz + '\'' +
				", sku_xl=" + sku_xl +
				'}';
	}
}
