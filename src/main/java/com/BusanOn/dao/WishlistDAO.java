package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.WishlistDTO;

@Repository
public class WishlistDAO {

    @Inject
    private SqlSession sqlSession;
    private static final String NS = "com.BusanOn.mappers.WishlistMapper";

    /** 찜하기 추가 */
    public int insertWishlist(Map<String, String> param) {
        return sqlSession.insert(NS + ".insertWishlist", param);
    }

    /** 찜하기 삭제 */
    public int deleteWishlist(Map<String, String> param) {
        return sqlSession.delete(NS + ".deleteWishlist", param);
    }

    /** 찜 여부 확인 (0 or 1) */
    public int checkWishlist(Map<String, String> param) {
        return sqlSession.selectOne(NS + ".checkWishlist", param);
    }

    /** 사용자의 찜 목록 */
    public List<WishlistDTO> getWishlist(String user_id) {
        return sqlSession.selectList(NS + ".getWishlist", user_id);
    }
}
