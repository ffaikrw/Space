package com.ffaikrw.space.browse.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.browse.model.BookResultInfo;
import com.ffaikrw.space.browse.model.Home;
import com.ffaikrw.space.library.bo.LibraryBO;
import com.ffaikrw.space.wish.bo.WishBO;

@Service
public class BrowseBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private WishBO wishBO;
	
	@Autowired
	private LibraryBO libraryBO;
	
	
	// 홈 화면
	public Home getHome(Integer userId) {
	
		Home home = new Home();
		
		// 신작, 베스트셀러, 편집자추천 정보 가져오기
		home.setHomeWeeklyNew(this.getBookList(userId, "ItemNewAll", 1, "Mid").get(0));
		home.setHomeBestseller(this.getBookList(userId, "Bestseller", 1, "Mid").get(0));
		home.setHomeEditorRecommend(this.getBookList(userId, "ItemEditorChoice", 1, "Mid").get(0));
		
		
		
		
		return home;
	}
	
	
	
	// 도서 리스트
	public List<BookInfo> getBookList(Integer userId, String itemListType, Integer startNum, String coverSize) {
		
		AladinResponse aladinResponse = aladinApiBO.getItemList(itemListType, startNum, coverSize);
		List<AladinItem> aladinItemList = aladinResponse.getItem();
		
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		BookResultInfo bookResultInfo = new BookResultInfo();
		
		// 검색결과 수 구하기
		if (aladinResponse.getTotalResults() > 200) {
			bookResultInfo.setTotalResult(200);
			
		} else {
			bookResultInfo.setTotalResult(aladinResponse.getTotalResults());
		}
		
		// 페이지 수 구하기
		if(aladinResponse.getTotalResults() > 200) {
			bookResultInfo.setEndIndex(4);
			
		} else if(((aladinResponse.getTotalResults() % 50) > 0) && ((aladinResponse.getTotalResults() % 50) < 50)) {
			bookResultInfo.setEndIndex((aladinResponse.getTotalResults() / 50) + 1);
			
		} else if((aladinResponse.getTotalResults() % 50) == 0) {
			bookResultInfo.setEndIndex(aladinResponse.getTotalResults() / 50);
			
		} else {
			bookResultInfo.setEndIndex(1);
		}
		
		
		for (AladinItem aladinItem : aladinItemList) {
			
			BookInfo bookInfo = new BookInfo();
			
			bookInfo.setBookResultInfo(bookResultInfo);
			
			// 작가명 잘라서 리스트에 담기
			List<String> authorList = new ArrayList<>();
			String[] authors = aladinItem.getAuthor().split(",");
			
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
			
			bookInfo.setTitle(aladinItem.getTitle());
			bookInfo.setPubDate(aladinItem.getPubDate());
			bookInfo.setDescription(aladinItem.getDescription());
			bookInfo.setIsbn13(aladinItem.getIsbn13());
			bookInfo.setCover(aladinItem.getCover());
			bookInfo.setCategoryId(aladinItem.getCategoryId());
			bookInfo.setCategoryName(aladinItem.getCategoryName());
			bookInfo.setPublisher(aladinItem.getPublisher());
			bookInfo.setAdult(aladinItem.isAdult());
			bookInfo.setBestRank(aladinItem.getBestRank());
			bookInfo.setSeriesInfo(aladinItem.getSeriesInfo());
			
			if (userId != null) {
				
				boolean wishIdDuplicate = wishBO.wishIsDuplicate(userId, aladinItem.getIsbn13());
				boolean libraryIsDuplicate = libraryBO.libraryIsDuplicate(userId, aladinItem.getIsbn13());
				
				bookInfo.setWishIsDuplicate(wishIdDuplicate);
				bookInfo.setLibraryIsDuplicate(libraryIsDuplicate);
			}
			
			bookInfoList.add(bookInfo);
		}

		return bookInfoList;
	}
	
	
	
	// 도서 검색
	public List<BookInfo> getSearchResult(String search, String keyword, Integer startNum, String sort) {
		
		AladinResponse aladinResponse = aladinApiBO.getItemSearch(search, keyword, startNum, sort);
		List<AladinItem> aladinItemList = aladinResponse.getItem();
		
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		BookResultInfo bookResultInfo = new BookResultInfo();
		
		// 검색결과 수 구하기
		if (aladinResponse.getTotalResults() > 200) {
			bookResultInfo.setTotalResult(200);
			
		} else {
			bookResultInfo.setTotalResult(aladinResponse.getTotalResults());
		}
		
		// 페이지 수 구하기
		if(aladinResponse.getTotalResults() > 200) {
			bookResultInfo.setEndIndex(4);
			
		} else if(((aladinResponse.getTotalResults() % 50) > 0) && ((aladinResponse.getTotalResults() % 50) < 50)) {
			bookResultInfo.setEndIndex((aladinResponse.getTotalResults() / 50) + 1);
			
		} else if((aladinResponse.getTotalResults() % 50) == 0) {
			bookResultInfo.setEndIndex(aladinResponse.getTotalResults() / 50);
			
		} else {
			bookResultInfo.setEndIndex(1);
		}
		
		for (AladinItem aladinItem : aladinItemList) {
			
			BookInfo bookInfo = new BookInfo();
			
			bookInfo.setBookResultInfo(bookResultInfo);
			
			// 작가명 리스트에 담기
			List<String> authorList = new ArrayList<>();
			String[] authors = aladinItem.getAuthor().split(",");
			
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
			
			bookInfo.setTitle(aladinItem.getTitle());
			bookInfo.setPubDate(aladinItem.getPubDate());
			bookInfo.setDescription(aladinItem.getDescription());
			bookInfo.setIsbn13(aladinItem.getIsbn13());
			bookInfo.setCover(aladinItem.getCover());
			bookInfo.setCategoryId(aladinItem.getCategoryId());
			bookInfo.setCategoryName(aladinItem.getCategoryName());
			bookInfo.setPublisher(aladinItem.getPublisher());
			bookInfo.setAdult(aladinItem.isAdult());
			bookInfo.setBestRank(aladinItem.getBestRank());
			bookInfo.setSeriesInfo(aladinItem.getSeriesInfo());
			
			bookInfoList.add(bookInfo);
		}
		
		return bookInfoList;
	}
	

	
}
