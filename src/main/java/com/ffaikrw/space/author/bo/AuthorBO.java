package com.ffaikrw.space.author.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.author.model.AuthorInfo;
import com.ffaikrw.space.browse.bo.BrowseBO;

@Service
public class AuthorBO {
	
	@Autowired
	private BrowseBO browseBO;
	
	
	public AuthorInfo getAuthorInfo(String search, Integer startNum) {
		
		String keyword = "Author";
		String sort = "Accuracy";
		
		AuthorInfo authorInfo = new AuthorInfo();
		authorInfo.setAuthorInfo(browseBO.getSearchResult(search, keyword, startNum, sort));
		
		return authorInfo;
	}
	
}
