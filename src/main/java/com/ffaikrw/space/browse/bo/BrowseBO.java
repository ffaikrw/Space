package com.ffaikrw.space.browse.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.browse.model.BookResultInfo;
import com.ffaikrw.space.browse.model.Home;
import com.ffaikrw.space.library.bo.LibraryBO;
import com.ffaikrw.space.library.recommend.bo.RecommendBO;
import com.ffaikrw.space.library.recommend.model.Recommend;
import com.ffaikrw.space.wish.bo.WishBO;

@Service
public class BrowseBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private WishBO wishBO;
	
	@Autowired
	private LibraryBO libraryBO;
	
	@Autowired
	private RecommendBO recommendBO;
	
	
	// 홈 화면
	public Home getHome(Integer userId) {
	
		Home home = new Home();
		
		// 신작, 베스트셀러, 편집자추천 정보 가져오기
		home.setHomeWeeklyNew(this.getBookList(userId, "ItemNewAll", 1, 1, "Mid").get(0));
		home.setHomeBestseller(this.getBookList(userId, "Bestseller", 1, 1, "Mid").get(0));
		home.setHomeEditorRecommend(this.getBookList(userId, "ItemEditorChoice", 1, 1, "Mid").get(0));
		
		// 오늘의 10가지 소설
		List<Recommend> recommendList = recommendBO.getRecommendTop10();
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		for (Recommend recommend : recommendList) {
			
			AladinResponse aladinResponse = aladinApiBO.getItemLookUp(recommend.getIsbn(), "Mid");
			List<AladinItem> aladinItem = aladinResponse.getItem();
			
			if (aladinItem == null) {
				continue;
			}
			
			BookInfo bookInfo = new BookInfo();
			
			bookInfo.setCover(aladinItem.get(0).getCover());
			bookInfo.setTitle(aladinItem.get(0).getTitle());
			bookInfo.setIsbn13(aladinItem.get(0).getIsbn13());
			
			bookInfoList.add(bookInfo);
		}
		
		home.setTodayTop10(bookInfoList);
		
		// 읽어볼까 한 소설
		home.setHomeWishlist(wishBO.getWishlist(userId, "Mid"));
		
		// 나의 책장
		home.setHomeLibrary(libraryBO.getLibrary(userId, "Mid"));
		
		// 서재 속 작가들: 작가가 중복되지 않도록 내 서재 속 작가들을 한 명씩 리스트에 담아 model의 homeAuthorList에 set
		List<BookInfo> libraryList = libraryBO.getLibrary(userId, "Mid");
		List<String> authors = new ArrayList<>();
		
		// 만약 서재가 비었으면 작가 리스트 null 저장
		if (libraryList.size() != 0) {
			
			libraryList.get(0).getAuthorList().get(0);
			
			for (int i = 0; i < libraryList.size(); i++) {
				if (authors.contains(libraryList.get(i).getAuthorList().get(0))) {
					continue;
				}
				authors.add(libraryList.get(i).getAuthorList().get(0));
			}
			
		} else {
			authors = null;
		}
		
		home.setHomeAuthorList(authors);
		
		// 주목할만한 신간
		String itemListType = "ItemNewSpecial";
		String coverSize = "Mid";
		Integer startNum = 1;
		
		home.setHomeOutstanding(this.getBookList(userId, itemListType, 26, startNum, coverSize));
		
		
		// 읽어볼까 한 소설 랜덤 독서
		List<BookInfo> wishlist = wishBO.getWishlist(userId, "Mid");
		
		Random rand = new Random();
		
		if(wishlist.size() > 0) {
			home.setRandomIsbn13(wishlist.get(rand.nextInt(wishlist.size())).getIsbn13());
		}
		
		return home;
	}
	
	
	
	// 도서 리스트
	public List<BookInfo> getBookList(Integer userId, String itemListType, int maxResults, Integer startNum, String coverSize) {
		
		AladinResponse aladinResponse = aladinApiBO.getItemList(itemListType, maxResults, startNum, coverSize);
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
	
	
	
	// 도서 검색 결과
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
