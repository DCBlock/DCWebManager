package com.digicaps.dcwebmanager.dto;

import java.text.DecimalFormat;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CancelOrder {
	private String name;
	private String date;
	private String receipt_id;
	private String menu_name_kr;
	private String price;
	private String dc_price;
	private String type;
	private String size;
	private String count;
	private String receipt_status;
	private String purchase_date;
	private String tpurchase_date = "";
	private String cancel_date;
	private String canceled_date = "";
	private String purchase_type;

	private double data_cnt = 0;
	private double receipt_id_cnt = 0;
	
	private String tdate = "";
	private String rowspan = "0";
	private String rowspanreceipt = "0";
	
	public static String toNumFormat(String num) {
		int num2 = Integer.parseInt(num);
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num2);
	}
	
	
	public CancelOrder(){
		
	}
	
	public CancelOrder(@JsonProperty("name") String name,
			@JsonProperty("date") String date,
			@JsonProperty("receipt_id") String receipt_id,
			@JsonProperty("menu_name_kr") String menu_name_kr,
			@JsonProperty("price") String price,
			@JsonProperty("dc_price") String dc_price,
			@JsonProperty("type") String type,
			@JsonProperty("size") String size,
			@JsonProperty("count") String count,
			@JsonProperty("receipt_status") String receipt_status,
			@JsonProperty("purchase_date") String purchase_date,
			@JsonProperty("cancel_date") String cancel_date,
			@JsonProperty("canceled_date") String canceled_date,
			@JsonProperty("purchase_type") String purchase_type
			
			) {
		
		super();
		this.name = name;
		this.date = date;
		this.receipt_id = receipt_id;
		this.menu_name_kr = menu_name_kr;
		this.price = toNumFormat(price);
		this.dc_price = toNumFormat(dc_price);
		this.type = type;
		this.size = size;
		this.count = count;
		this.receipt_status = receipt_status;
		this.purchase_date = purchase_date;
		this.cancel_date = cancel_date;
		this.canceled_date = canceled_date;
		this.purchase_type = purchase_type;
	}
	//tpurchase_date
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTpurchase_date() {
		return tpurchase_date;
	}
	public void setTpurchase_date(String tpurchase_date) {
		this.tpurchase_date = tpurchase_date;
	}
	
	public String getPurchase_type() {
		return purchase_type;
	}
	public void setPurchase_type(String purchase_type) {
		this.purchase_type = purchase_type;
	}
	
	
	
	public String getRowspanreceipt() {
		return rowspanreceipt;
	}
	public void setRowspanreceipt(String rowspanreceipt) {
		this.rowspanreceipt = rowspanreceipt;
	}
	
	
	public String getRowspan() {
		return rowspan;
	}
	public void setRowspan(String rowspan) {
		this.rowspan = rowspan;
	}
	
	public double getData_cnt() {
		return data_cnt;
	}
	public void setData_cnt(double data_cnt) {
		this.data_cnt = data_cnt;
	}
	
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	
	
	public double getReceipt_id_cnt() {
		return receipt_id_cnt;
	}
	public void setReceipt_id_cnt(double receipt_id_cnt) {
		this.receipt_id_cnt = receipt_id_cnt;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getReceipt_id() {
		return receipt_id;
	}
	public void setReceipt_id(String receipt_id) {
		this.receipt_id = receipt_id;
	}
	

	public String getMenu_name_kr() {
		return menu_name_kr;
	}
	public void setMenu_name_kr(String menu_name_kr) {
		this.menu_name_kr = menu_name_kr;
	}
	

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	

	public String getDc_price() {
		return dc_price;
	}
	public void setDc_price(String dc_price) {
		this.dc_price = dc_price;
	}
	

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	

	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	

	public String getReceipt_status() {
		return receipt_status;
	}
	public void setReceipt_status(String receipt_status) {
		this.receipt_status = receipt_status;
	}
	

	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	

	public String getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}
	
	public String getCanceled_date() {
		return canceled_date;
	}
	public void setCanceled_date(String canceled_date) {
		this.canceled_date = canceled_date;
	}
	

}
