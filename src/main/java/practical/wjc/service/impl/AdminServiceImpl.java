package practical.wjc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import practical.wjc.dao.AdminMapper;
import practical.wjc.entity.Admin;
import practical.wjc.entity.Users;
import practical.wjc.service.AdminService;

import java.util.List;

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(String adminname,String password){
        return adminMapper.login(adminname,password);
    }
    public int register(Admin admin){
        return adminMapper.insertSelective(admin);
    }
    @Override
    public List<Admin> list(){
        return adminMapper.list();
    }
    @Override
    public int deleteByPrimaryKey(Integer adminid){
        return adminMapper.deleteByPrimaryKey(adminid);
    }
    @Override
    public  Admin selectByPrimaryKey(Integer adminid){
        return adminMapper.selectByPrimaryKey(adminid);
    }
    @Override
    public  int updateByPrimaryKeySelective(Admin record){
        return adminMapper.updateByPrimaryKeySelective(record);
    }

}
