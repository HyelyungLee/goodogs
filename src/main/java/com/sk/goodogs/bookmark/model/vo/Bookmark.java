package com.sk.goodogs.bookmark.model.vo;

import java.sql.Date;

/**
 * @author 전수경
 *
 */
public class Bookmark {
	private String memberId;
	private int newsNo;
	private String newBookmarkedContent;
	private Date bookmarkDate;
	
	public Bookmark() {
		super();
	}
	
	public Bookmark(String memberId, int newsNo, String newBookmarkedContent, Date bookmarkDate) {
		super();
		this.memberId = memberId;
		this.newsNo = newsNo;
		this.newBookmarkedContent = newBookmarkedContent;
		this.bookmarkDate = bookmarkDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	public String getNewBookmarkedContent() {
		return newBookmarkedContent;
	}

	public void setNewBookmarkedContent(String newBookmarkedContent) {
		this.newBookmarkedContent = newBookmarkedContent;
	}

	public Date getBookmarkDate() {
		return bookmarkDate;
	}

	public void setBookmarkDate(Date bookmarkDate) {
		this.bookmarkDate = bookmarkDate;
	}

	@Override
	public String toString() {
		return "Bookmark [memberId=" + memberId + ", newsNo=" + newsNo + ", newBookmarkedContent="
				+ newBookmarkedContent + ", bookmarkDate=" + bookmarkDate + "]";
	}
	
}
