package com.BusanOn.domain;

public class WishlistDTO {

    private int wish_id;
    private String user_id;
    private String pen_id;
    private String created_at;

    // PensionDTO 필드 (JOIN용)
    private String pen_name;
    private String pen_address;
    private String pen_image;
    private String star;
    private String rv;
    private String rm_price;

    public int getWish_id() { return wish_id; }
    public void setWish_id(int wish_id) { this.wish_id = wish_id; }

    public String getUser_id() { return user_id; }
    public void setUser_id(String user_id) { this.user_id = user_id; }

    public String getPen_id() { return pen_id; }
    public void setPen_id(String pen_id) { this.pen_id = pen_id; }

    public String getCreated_at() { return created_at; }
    public void setCreated_at(String created_at) { this.created_at = created_at; }

    public String getPen_name() { return pen_name; }
    public void setPen_name(String pen_name) { this.pen_name = pen_name; }

    public String getPen_address() { return pen_address; }
    public void setPen_address(String pen_address) { this.pen_address = pen_address; }

    public String getPen_image() { return pen_image; }
    public void setPen_image(String pen_image) { this.pen_image = pen_image; }

    public String getStar() { return star; }
    public void setStar(String star) { this.star = star; }

    public String getRv() { return rv; }
    public void setRv(String rv) { this.rv = rv; }

    public String getRm_price() { return rm_price; }
    public void setRm_price(String rm_price) { this.rm_price = rm_price; }
}
