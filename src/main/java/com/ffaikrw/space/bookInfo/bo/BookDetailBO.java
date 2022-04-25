package com.ffaikrw.space.bookInfo.bo;

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
public class BookDetailBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private WishBO wishBO;
	
	
	public BookInfo getBookDetail(Integer userId, String isbn13) {
		
		String coverSize = "big";
		
		AladinResponse aladinResponse = aladinApiBO.getItemLookUp(isbn13, coverSize);
		List<AladinItem> aladinItem = aladinResponse.getItem();
		
		BookInfo bookInfo = new BookInfo();
		
		List<String> authorList = new ArrayList<>();
		String[] authors = aladinItem.get(0).getAuthor().split(",");
		
		for(String author : authors) {
			if(author.endsWith("(지은이)")) {
				author = author.replace("(지은이)", "");
				authorList.add(author);
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
		
		if (userId != null) {
			
			boolean wishIdDuplicate = wishBO.wishIsDuplicate(userId, aladinItem.get(0).getIsbn13());
			
			bookInfo.setWishIsDuplicate(wishIdDuplicate);
		}
		
		return bookInfo;
	}
	
}
