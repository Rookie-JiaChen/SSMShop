package practical.wjc.service;

import practical.wjc.entity.Admin;


import java.util.List;


public interface AdminService {
    Admin login(String adminname, String password);
    int register(Admin admin);
    List<Admin> list();
    int deleteByPrimaryKey(Integer adminid);
    Admin selectByPrimaryKey(Integer adminid);
    int updateByPrimaryKeySelective(Admin record);
}
