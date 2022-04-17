package com.ffaikrw.space.browse.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.browse.model.Bestseller;
import com.ffaikrw.space.browse.model.EditorRecommend;
import com.ffaikrw.space.browse.model.Outstanding;
import com.ffaikrw.space.browse.model.Search;
import com.ffaikrw.space.wish.bo.WishBO;

@Service
public class BrowseBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private WishBO wishBO;
	
	
	
	// 이번 주 신간
//	public List<WeeklyNew> getWeeklyNewItems(int userId) {
//		
//		String itemListType = "ItemNewAll";
//		String coverSize = "MidBig";
//		
//		aladinApiBO.getItemList(itemListType, coverSize);
//		
//		List<WeeklyNewItem> weeklyNewItemList = new ArrayList<>();
//		
//		for (WeeklyNewItem newItem : weeklyNewItemList) {
//			
//			
//			
//			
//		}
//		
//		weeklyNew.setWeeklyNewList(null);
//		
//		List<WeeklyNew> weeklyNewItemList = weeklyNew.getWeeklyNewList();
//		
//		for() {
//			
//		}
//		
//
//		if (userId != null) {
//			
//			boolean wishIdDuplicate = wishBO.wishIdDuplicate(userId, isbn13);
//			
//			weeklyNew.setWishIsDuplicate(wishIdDuplicate);
//		}
//		
//		
//		return weeklyNew;
//		
//	}
	
	
	// 베스트셀러
	public Bestseller getBestseller() {
		
		String itemListType = "Bestseller";
		String coverSize = "MidBig";
		
		Bestseller bestseller = new Bestseller();
		bestseller.setBestseller(aladinApiBO.getItemList(itemListType, coverSize));
		
		return bestseller;
	}
	
	
	// 편집자 추천 도서
	public EditorRecommend getEditorRecommend() {
		
		String itemListType = "ItemEditorChoice";
		String coverSize = "MidBig";
		
		EditorRecommend editorRecommend = new EditorRecommend();
		editorRecommend.setEditorRecommend(aladinApiBO.getItemList(itemListType, coverSize));
		
		return editorRecommend;
	}
	
	
	
	// 도서 검색
	public Search getSearchResult(String search) {
		
		String sort = "Accuracy";
		
		Search searchResult = new Search();
		
		searchResult.setSearchResult(aladinApiBO.getItemSearch(search, sort));
		
		return searchResult;
	}
	
	
	
	// 주목할만한 신간 리스트
	public Outstanding getOutstandinBook() {
		
		String itemListType = "ItemNewSpecial";
		String coverSize = "Mid";
		
		Outstanding outstandingBook = new Outstanding();
		
		outstandingBook.setOutstandingBook(aladinApiBO.getItemList(itemListType, coverSize));
		
		return outstandingBook;
	}
	
	
}
