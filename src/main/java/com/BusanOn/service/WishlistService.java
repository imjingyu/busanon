package com.BusanOn.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.WishlistDAO;
import com.BusanOn.domain.WishlistDTO;

@Service
public class WishlistService {

    @Inject
    private WishlistDAO wishlistDAO;

    public int insertWishlist(Map<String, String> param) {
        return wishlistDAO.insertWishlist(param);
    }

    public int deleteWishlist(Map<String, String> param) {
        return wishlistDAO.deleteWishlist(param);
    }

    public int checkWishlist(Map<String, String> param) {
        return wishlistDAO.checkWishlist(param);
    }

    public List<WishlistDTO> getWishlist(String user_id) {
        return wishlistDAO.getWishlist(user_id);
    }
}
