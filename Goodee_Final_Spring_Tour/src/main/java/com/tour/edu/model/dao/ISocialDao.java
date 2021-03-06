package com.tour.edu.model.dao;

import java.util.List;
import java.util.Map;

import com.tour.edu.vo.Comment_Vo;
import com.tour.edu.vo.Theme_Vo;

public interface ISocialDao {
	public List<Theme_Vo> themeAllSelect();

	public boolean themeFollow(Map<String, String> map);

	public boolean userFollow(Map<String, String> map);

	public boolean themeUnFollow(Map<String, String> map);

	public boolean userUnFollow(Map<String, String> map);

	public boolean postCommentInsert(Comment_Vo cvo);

	public List<Comment_Vo> postCommentSelect(String postid);

	public boolean postUpViewCount(String postid);
}
