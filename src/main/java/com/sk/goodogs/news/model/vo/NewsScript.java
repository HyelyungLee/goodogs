package com.sk.goodogs.news.model.vo;

import java.sql.Date;

public class NewsScript {
	private int scriptNo;
	private String scriptTitle;
	private String scriptCategory;
	private String scriptContent;
	private Date scriptWriteDate;
	private String scriptTag;
	private int scriptState;
	private String scriptWriter;
	
	public NewsScript() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public NewsScript(int scriptNo, String scriptTitle, String scriptCategory, String scriptContent,
			Date scriptWriteDate, String scriptTag, int scriptState, String scriptWriter) {
		super();
		this.scriptNo = scriptNo;
		this.scriptTitle = scriptTitle;
		this.scriptCategory = scriptCategory;
		this.scriptContent = scriptContent;
		this.scriptWriteDate = scriptWriteDate;
		this.scriptTag = scriptTag;
		this.scriptState = scriptState;
		this.scriptWriter = scriptWriter;
	}



	

	public int getScriptNo() {
		return scriptNo;
	}



	public void setScriptNo(int scriptNo) {
		this.scriptNo = scriptNo;
	}



	public String getScriptTitle() {
		return scriptTitle;
	}



	public void setScriptTitle(String scriptTitle) {
		this.scriptTitle = scriptTitle;
	}



	public String getScriptCategory() {
		return scriptCategory;
	}



	public void setScriptCategory(String scriptCategory) {
		this.scriptCategory = scriptCategory;
	}



	public String getScriptContent() {
		return scriptContent;
	}



	public void setScriptContent(String scriptContent) {
		this.scriptContent = scriptContent;
	}



	public Date getScriptWriteDate() {
		return scriptWriteDate;
	}



	public void setScriptWriteDate(Date scriptWriteDate) {
		this.scriptWriteDate = scriptWriteDate;
	}



	public String getScriptTag() {
		return scriptTag;
	}



	public void setScriptTag(String scriptTag) {
		this.scriptTag = scriptTag;
	}



	public int getScriptState() {
		return scriptState;
	}



	public void setScriptState(int scriptState) {
		this.scriptState = scriptState;
	}



	public String getScriptWriter() {
		return scriptWriter;
	}



	public void setScriptWriter(String scriptWriter) {
		this.scriptWriter = scriptWriter;
	}



	@Override
	public String toString() {
		return "NewsScript [scriptNo=" + scriptNo + ", scriptTitle=" + scriptTitle + ", scriptCategory="
				+ scriptCategory + ", scriptContent=" + scriptContent + ", scriptWriteDate=" + scriptWriteDate
				+ ", scriptTag=" + scriptTag + ", scriptState=" + scriptState + ", scriptWriter=" + scriptWriter + "]";
	}



		
	
}
