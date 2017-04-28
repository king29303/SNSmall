package web.sns.db;

import java.sql.Date;

public class SnsBean {

	private String sns_id;
	private String pass;
	private String name;
	private String profile_img;
	private String detail_img;
	private String content;
	private String category;	
	private int sns_profit;
	private int sell;
	private Date date;
	private String type;
	
	public String getSns_id() {
		return sns_id;
	}
	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSns_profit() {
		return sns_profit;
	}
	public void setSns_profit(int sns_profit) {
		this.sns_profit = sns_profit;
	}
	public int getSell() {
		return sell;
	}
	public void setSell(int sell) {
		this.sell = sell;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
