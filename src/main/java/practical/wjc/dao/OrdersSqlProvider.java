package practical.wjc.dao;

import static org.apache.ibatis.jdbc.SqlBuilder.BEGIN;
import static org.apache.ibatis.jdbc.SqlBuilder.INSERT_INTO;
import static org.apache.ibatis.jdbc.SqlBuilder.SET;
import static org.apache.ibatis.jdbc.SqlBuilder.SQL;
import static org.apache.ibatis.jdbc.SqlBuilder.UPDATE;
import static org.apache.ibatis.jdbc.SqlBuilder.VALUES;
import static org.apache.ibatis.jdbc.SqlBuilder.WHERE;

import practical.wjc.entity.Orders;

public class OrdersSqlProvider {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_orders
     *
     * @mbggenerated
     */
    public String insertSelective(Orders record) {
        BEGIN();
        INSERT_INTO("ps_orders");
        
        if (record.getOrderid() != null) {
            VALUES("orderid", "#{orderid,jdbcType=INTEGER}");
        }
        
        if (record.getUserid() != null) {
            VALUES("userid", "#{userid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodstag() != null) {
            VALUES("goodstag", "#{goodstag,jdbcType=VARCHAR}");
        }
        
        if (record.getQuantity() != null) {
            VALUES("quantity", "#{quantity,jdbcType=VARCHAR}");
        }
        
        if (record.getBuyer() != null) {
            VALUES("buyer", "#{buyer,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            VALUES("sex", "#{sex,jdbcType=VARCHAR}");
        }
        
        if (record.getAddress() != null) {
            VALUES("address", "#{address,jdbcType=VARCHAR}");
        }
        
        if (record.getTelephone() != null) {
            VALUES("telephone", "#{telephone,jdbcType=VARCHAR}");
        }
        
        if (record.getExpress() != null) {
            VALUES("express", "#{express,jdbcType=VARCHAR}");
        }
        
        if (record.getOrderdate() != null) {
            VALUES("orderdate", "#{orderdate,jdbcType=VARCHAR}");
        }
        
        if (record.getState() != null) {
            VALUES("state", "#{state,jdbcType=VARCHAR}");
        }
        
        if (record.getTotal() != null) {
            VALUES("total", "#{total,jdbcType=DOUBLE}");
        }
        
        return SQL();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_orders
     *
     * @mbggenerated
     */
    public String updateByPrimaryKeySelective(Orders record) {
        BEGIN();
        UPDATE("ps_orders");
        
        if (record.getUserid() != null) {
            SET("userid = #{userid,jdbcType=INTEGER}");
        }
        
        if (record.getGoodstag() != null) {
            SET("goodstag = #{goodstag,jdbcType=VARCHAR}");
        }
        
        if (record.getQuantity() != null) {
            SET("quantity = #{quantity,jdbcType=VARCHAR}");
        }
        
        if (record.getBuyer() != null) {
            SET("buyer = #{buyer,jdbcType=VARCHAR}");
        }
        
        if (record.getSex() != null) {
            SET("sex = #{sex,jdbcType=VARCHAR}");
        }
        
        if (record.getAddress() != null) {
            SET("address = #{address,jdbcType=VARCHAR}");
        }
        
        if (record.getTelephone() != null) {
            SET("telephone = #{telephone,jdbcType=VARCHAR}");
        }
        
        if (record.getExpress() != null) {
            SET("express = #{express,jdbcType=VARCHAR}");
        }
        
        if (record.getOrderdate() != null) {
            SET("orderdate = #{orderdate,jdbcType=VARCHAR}");
        }
        
        if (record.getState() != null) {
            SET("state = #{state,jdbcType=VARCHAR}");
        }
        
        if (record.getTotal() != null) {
            SET("total = #{total,jdbcType=DOUBLE}");
        }
        
        WHERE("orderid = #{orderid,jdbcType=INTEGER}");
        
        return SQL();
    }
}