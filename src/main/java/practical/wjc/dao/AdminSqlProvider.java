package practical.wjc.dao;

import static org.apache.ibatis.jdbc.SqlBuilder.BEGIN;
import static org.apache.ibatis.jdbc.SqlBuilder.INSERT_INTO;
import static org.apache.ibatis.jdbc.SqlBuilder.SET;
import static org.apache.ibatis.jdbc.SqlBuilder.SQL;
import static org.apache.ibatis.jdbc.SqlBuilder.UPDATE;
import static org.apache.ibatis.jdbc.SqlBuilder.VALUES;
import static org.apache.ibatis.jdbc.SqlBuilder.WHERE;

import practical.wjc.entity.Admin;

public class AdminSqlProvider {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    public String insertSelective(Admin record) {
        BEGIN();
        INSERT_INTO("ps_admin");
        
        if (record.getAdminid() != null) {
            VALUES("adminid", "#{adminid,jdbcType=INTEGER}");
        }
        
        if (record.getAdminname() != null) {
            VALUES("adminname", "#{adminname,jdbcType=VARCHAR}");
        }
        
        if (record.getPassword() != null) {
            VALUES("password", "#{password,jdbcType=VARCHAR}");
        }
        
        if (record.getEmail() != null) {
            VALUES("email", "#{email,jdbcType=VARCHAR}");
        }
        
        if (record.getTelephone() != null) {
            VALUES("telephone", "#{telephone,jdbcType=VARCHAR}");
        }
        
        return SQL();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    public String updateByPrimaryKeySelective(Admin record) {
        BEGIN();
        UPDATE("ps_admin");
        
        if (record.getAdminname() != null) {
            SET("adminname = #{adminname,jdbcType=VARCHAR}");
        }
        
        if (record.getPassword() != null) {
            SET("password = #{password,jdbcType=VARCHAR}");
        }
        
        if (record.getEmail() != null) {
            SET("email = #{email,jdbcType=VARCHAR}");
        }
        
        if (record.getTelephone() != null) {
            SET("telephone = #{telephone,jdbcType=VARCHAR}");
        }
        
        WHERE("adminid = #{adminid,jdbcType=INTEGER}");
        
        return SQL();
    }
}