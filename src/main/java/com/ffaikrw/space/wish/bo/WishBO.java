package com.ffaikrw.space.wish.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.library.bo.LibraryBO;
import com.ffaikrw.space.library.recommend.bo.RecommendBO;
import com.ffaikrw.space.wish.dao.WishDAO;
import com.ffaikrw.space.wish.model.Wish;

@Service
public class WishBO {
	
	@Autowired
	private WishDAO wishDAO;
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private RecommendBO recommendBO;
	
	@Autowired
	private LibraryBO libraryBO;
	
	
	// 읽어볼까 추가
	public int addWist(int userId, String isbn13) {
		return wishDAO.insertWish(userId, isbn13);
	}
	
	
	// 읽어볼까 삭제
	public int deleteWish(int userId, String isbn13) {
		return wishDAO.deleteWish(userId, isbn13);
	}
	
	
	// 읽어볼까 여부 확인
	public boolean wishIsDuplicate(int userId, String isbn13) {
		
		int count = wishDAO.selectWishCount(userId, isbn13);
		
		return count != 0;
	}
	
	
	// 사용자의 모든 읽어볼까 도서 가져오기
	public List<BookInfo> getWishlist(Integer userId, String coverSize) {
		
		List<Wish> wishlist = wishDAO.selectWishlist(userId);
		
		List<BookInfo> bookInfoList = new ArrayList<>();
		
		for (Wish wish : wishlist) {
			
			if (libraryBO.libraryIsDuplicate(userId, wish.getIsbn())) {
				this.deleteWish(userId, wish.getIsbn());
				continue;
			}
			
			AladinResponse aladinResponse = aladinApiBO.getItemLookUp(wish.getIsbn(), coverSize);
			List<AladinItem> aladinItem = aladinResponse.getItem();
			
			if (aladinItem == null) {
				this.deleteWish(userId, wish.getIsbn());
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
			bookInfo.setRecommendCount(recommendBO.getRecommendCount(aladinItem.get(0).getIsbn13()));
			
			bookInfoList.add(bookInfo);
		}
		
		return bookInfoList;
	}
	
	
}
