package com.sk.goodogs.news.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.script.ScriptException;

import com.sk.goodogs.news.model.exception.NewsException;
import com.sk.goodogs.news.model.vo.News;
import com.sk.goodogs.news.model.vo.NewsScript;

/**
 * @author 김준한
 *
 */
public class NewsDao {
	private Properties prop = new Properties();

	public NewsDao() {
		String filename =
				NewsDao.class.getResource("/news/news-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<News> findAllNewsById(Connection conn, String memberId) {
		List<News> newsList = new ArrayList<>();
		String sql = prop.getProperty("findAllNewsById");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					News news = handleNewsResultSet(rset);
					
					newsList.add(news);
					}
				}
			} catch (SQLException e) {
				throw new NewsException(e);
			}
			
			return newsList;
			}
		
		private News handleNewsResultSet(ResultSet rset) throws SQLException {
			int newsNo = rset.getInt("news_no");
			String newsWriter = rset.getString("news_writer");
			String newsTitle = rset.getString("news_title");
			String newsCategory = rset.getString("news_category");
			String newsContent = rset.getString("news_content");
			Date newsWriteDate = rset.getDate("news_write_date");
			String newsTag = rset.getString("news_tag");
			int newsLikeCnt = rset.getInt("news_like_cnt");
			int newsReadCnt = rset.getInt("news_read_cnt");
			Date newsConfirmedDate = rset.getDate("news_confirmed_date");
			
			return new News(newsNo, newsWriter, newsTitle, newsCategory, newsContent, newsWriteDate, newsTag, newsLikeCnt, newsReadCnt, newsConfirmedDate);
		}

		public List<NewsScript> findAllScriptById(Connection conn, String memberId) {
			List<NewsScript> scripts = new ArrayList<>();
			String sql = prop.getProperty("findAllScriptById");
			try(PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setString(1, memberId);
				try(ResultSet rset = pstmt.executeQuery()) {
					while(rset.next()) {
						NewsScript script = handleScriptResultSet(rset);
						
						scripts.add(script);
						}
					}
			} catch (SQLException e) {
				throw new NewsException(e);
			} 
			
			return scripts;
		}

		private NewsScript handleScriptResultSet(ResultSet rset) throws SQLException{
			int scriptNo = rset.getInt("script_no");
			String scriptWriter = rset.getString("script_writer");
			String scriptTitle = rset.getString("script_title");
			String scriptCategory = rset.getString("script_category");
			String scriptContent = rset.getString("script_content");
			Date scriptWriteDate = rset.getDate("script_write_date");
			String scriptTag = rset.getString("script_tag");
			int scriptStateNumber = rset.getInt("script_state_number");
			NewsScript newsScript = new NewsScript(scriptNo, scriptTitle, scriptCategory, scriptContent, scriptWriteDate, scriptTag, scriptStateNumber, scriptWriter);
			
			return newsScript;
		}

}
