package com.ffaikrw.space.bookInfo.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;

@Service
public class BookInfoBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	
//	public BookInfo getBookInfo(String isbn13) {
//		
//		BookInfo bookInfo = new BookInfo();
//		
//		bookInfo.setBookInfo(aladinApiBO.getItemLookUp(isbn13));
//		
//		return bookInfo;
//	}
	
}
