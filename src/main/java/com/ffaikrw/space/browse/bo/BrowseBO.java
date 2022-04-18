package com.ffaikrw.space.browse.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.wish.bo.WishBO;

@Service
public class BrowseBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private WishBO wishBO;
	
	
	
	// 도서 리스트
	public List<BookInfo> getBookList(Integer userId, String itemListType, String coverSize) {
		
		AladinResponse aladinResponse = aladinApiBO.getItemList(itemListType, coverSize);
		List<AladinItem> aladinItemList = aladinResponse.getItem();
		
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		for (AladinItem aladinItem : aladinItemList) {
			
			BookInfo bookInfo = new BookInfo();
			
			bookInfo.setTitle(aladinItem.getTitle());
			bookInfo.setAuthor(aladinItem.getAuthor());
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
				
				boolean wishIdDuplicate = wishBO.wishIdDuplicate(userId, aladinItem.getIsbn13());
				
				bookInfo.setWishIsDuplicate(wishIdDuplicate);
			}
			
			bookInfoList.add(bookInfo);
		}

		return bookInfoList;
	}
	
	
	
	// 도서 검색
	public List<BookInfo> getSearchResult(String search, String keyword, String sort) {
		
		AladinResponse aladinResponse = aladinApiBO.getItemSearch(search, keyword, sort);
		List<AladinItem> aladinItemList = aladinResponse.getItem();
		
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		for (AladinItem aladinItem : aladinItemList) {
			
			BookInfo bookInfo = new BookInfo();
			
			bookInfo.setTitle(aladinItem.getTitle());
			bookInfo.setAuthor(aladinItem.getAuthor());
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
