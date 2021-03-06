package practical.wjc.dao;

import org.apache.ibatis.annotations.Param;
import practical.wjc.entity.Admin;
import practical.wjc.entity.Users;

import java.util.List;

public interface AdminMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer adminid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    int insert(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    int insertSelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    Admin selectByPrimaryKey(Integer adminid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ps_admin
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Admin record);
    List<Admin> list();
    Admin login(@Param("adminname")String adminname, @Param("password")String password);
}