package com.BusanOn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BusanOn.domain.WishlistDTO;
import com.BusanOn.service.WishlistService;

@Controller
public class WishlistController {

    @Inject
    private WishlistService wishlistService;

    /** 찜 목록 페이지 */
    @RequestMapping(value = "/member/mypage/wishlist", method = RequestMethod.GET)
    public String wishlistPage(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("user_id");
        if (user_id == null) return "redirect:/member/login";

        List<WishlistDTO> wishlist = wishlistService.getWishlist(user_id);
        model.addAttribute("wishlist", wishlist);
        return "BusanOn/member/mypage/wishlist";
    }

    /** 찜 토글 (AJAX) - 로그인 필수 */
    @RequestMapping(value = "/member/wishlistToggle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> wishlistToggle(
            @RequestParam("pen_id") String pen_id,
            HttpSession session) {

        Map<String, Object> result = new HashMap<>();
        String user_id = (String) session.getAttribute("user_id");

        if (user_id == null) {
            result.put("status", "login_required");
            return result;
        }

        Map<String, String> param = new HashMap<>();
        param.put("user_id", user_id);
        param.put("pen_id", pen_id);

        int exists = wishlistService.checkWishlist(param);
        if (exists > 0) {
            wishlistService.deleteWishlist(param);
            result.put("status", "removed");
        } else {
            wishlistService.insertWishlist(param);
            result.put("status", "added");
        }
        return result;
    }

    /** 찜 여부 확인 (AJAX) */
    @RequestMapping(value = "/member/wishlistCheck", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> wishlistCheck(
            @RequestParam("pen_id") String pen_id,
            HttpSession session) {

        Map<String, Object> result = new HashMap<>();
        String user_id = (String) session.getAttribute("user_id");

        if (user_id == null) {
            result.put("wished", false);
            return result;
        }

        Map<String, String> param = new HashMap<>();
        param.put("user_id", user_id);
        param.put("pen_id", pen_id);

        result.put("wished", wishlistService.checkWishlist(param) > 0);
        return result;
    }
}
