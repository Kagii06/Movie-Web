package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {
	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();
	private History existHistory = new History();

	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (existHistory == null) {
			existHistory = new History();
			existHistory.setUser(user);
			existHistory.setVideo(video);
			existHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			existHistory.setIsLiked(Boolean.FALSE);
			return dao.create(existHistory);
		}
		return existHistory;
	}

	@Override
	public boolean updateLikeOrUnLike(User user, String videoHref) {
		try {
			Video video = videoService.findByHref(videoHref);
			existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
			if (existHistory.getIsLiked() == Boolean.FALSE) {
				existHistory.setIsLiked(Boolean.TRUE);
				existHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
			} else if (existHistory.getIsLiked() == Boolean.TRUE) {
				existHistory.setIsLiked(Boolean.FALSE);
				existHistory.setLikedDate(null);
			}
			History updateHistory = dao.update(existHistory);
			return updateHistory != null ? true : false;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	

	

}
