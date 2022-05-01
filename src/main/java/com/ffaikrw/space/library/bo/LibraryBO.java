package com.ffaikrw.space.library.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.library.dao.LibraryDAO;
import com.ffaikrw.space.library.model.Calendar;
import com.ffaikrw.space.library.model.Library;
import com.ffaikrw.space.library.recommend.bo.RecommendBO;
import com.ffaikrw.space.note.bo.NoteBO;

@Service
public class LibraryBO {
	
	@Autowired
	private LibraryDAO libraryDAO;
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private RecommendBO recommendBO;
	
	@Autowired
	private NoteBO noteBO;
	
	
	// 내 서재에 담기
	public int addLibrary(int userId, String isbn13) {
		return libraryDAO.insertLibrary(userId, isbn13);
	}
	
	
	// 내 서재에서 삭제
	public int deleteLibrary(int userId, String isbn13) {
		return libraryDAO.deleteLibrary(userId, isbn13);
	}
	
	
	// 내 서재의 모든 도서 가져오기
	public List<BookInfo> getLibrary(Integer userId, String coverSize ) {
		
		List<Library> libraryList = libraryDAO.selectLibrary(userId);
		
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		for (Library library : libraryList) {
			
			AladinResponse aladinResponse = aladinApiBO.getItemLookUp(library.getIsbn(), coverSize);
			List<AladinItem> aladinItem = aladinResponse.getItem();
			
			if (aladinItem == null) {
				continue;
			}
			
			BookInfo bookInfo = new BookInfo();
			
			List<String> authorList = new ArrayList<>();
			String[] authors = aladinItem.get(0).getAuthor().split(",");
			
			for(String author : authors) {
				if(author.endsWith("(지은이)")) {
					author = author.replace("(지은이)", "");
					authorList.add(author);
				} else if(author.endsWith("(옮긴이)")) {
					break;
				} else {
					authorList.add(author);
				}
			}
			
			bookInfo.setAuthorList(authorList);
			
			bookInfo.setTitle(aladinItem.get(0).getTitle());
			bookInfo.setPubDate(aladinItem.get(0).getPubDate());
			bookInfo.setDescription(aladinItem.get(0).getDescription());
			bookInfo.setIsbn13(aladinItem.get(0).getIsbn13());
			bookInfo.setCover(aladinItem.get(0).getCover());
			bookInfo.setCategoryId(aladinItem.get(0).getCategoryId());
			bookInfo.setCategoryName(aladinItem.get(0).getCategoryName());
			bookInfo.setPublisher(aladinItem.get(0).getPublisher());
			bookInfo.setAdult(aladinItem.get(0).isAdult());
			bookInfo.setBestRank(aladinItem.get(0).getBestRank());
			bookInfo.setSeriesInfo(aladinItem.get(0).getSeriesInfo());
			bookInfo.setReadDate(library.getReadDate());
			
			if (userId != null) {
				
				boolean recommendIdDuplicate = recommendBO.recommendIsDuplicate(userId, aladinItem.get(0).getIsbn13());
				boolean noteIsDuplicate = noteBO.noteIsDuplicate(userId, aladinItem.get(0).getIsbn13());
				
				bookInfo.setRecommendIsDuplicate(recommendIdDuplicate);
				bookInfo.setNoteIsDuplicate(noteIsDuplicate);
			}
			
			bookInfoList.add(bookInfo);
		}
		
		return bookInfoList;
	}
	
	
	// 완독 날짜 수정
	public int editReadDate(int userId, String isbn13, String readDate) {
		return libraryDAO.updateReadDate(userId, isbn13, readDate);
	}
	
	
	// 내 서재에 있는 도서인지 확인
	public boolean libraryIsDuplicate(int userId, String isbn13) {
		
		int count = libraryDAO.selectLibraryCountByIsbn(userId, isbn13);
		
		return (count != 0);
	}
	
	
	// 캘린더
	public List<Calendar> calendar(int userId) {
		// 내 서재에 있는 도서들 정보 가져와서 캘린더 모델에 값 넣기
		// 제목과 그뭐냐 그..... 그.... 아뭐더라 아 완독일만 가져오면 ㅇㅇ
		
		List<Library> libraryList = libraryDAO.selectLibrary(userId);
		
		List<Calendar> calendarList = new ArrayList<>();
		
		String coverSize = "Mid";
		
		for (Library library : libraryList) {
			
			AladinResponse aladinResponse = aladinApiBO.getItemLookUp(library.getIsbn(), coverSize);
			List<AladinItem> aladinItem = aladinResponse.getItem();
			
			if (aladinItem == null) {
				continue;
			}
			
			Calendar calendar = new Calendar();
			
			if(library.getReadDate() == null) {
				continue;
			}
			
			Date readDate = library.getReadDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			calendar.setTitle(aladinItem.get(0).getTitle());
			calendar.setStart(format.format(readDate));
			calendar.setColor("#6b4bde");
			calendar.setTextColor("#ffffff");
			
			calendarList.add(calendar);
		}
		
		return calendarList;
	}
	
	
	
	
	
	
}
