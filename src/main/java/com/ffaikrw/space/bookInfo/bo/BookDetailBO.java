package com.ffaikrw.space.bookInfo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.browse.model.BookInfo;

@Service
public class BookDetailBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	
	public BookInfo getBookInfo(String isbn13) {
		
		AladinResponse aladinResponse = aladinApiBO.getItemLookUp(isbn13);
		List<AladinItem> aladinItem = aladinResponse.getItem();
		
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
		
		return bookInfo;
	}
	
}
