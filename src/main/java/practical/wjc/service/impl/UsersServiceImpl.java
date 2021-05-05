package practical.wjc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import practical.wjc.dao.UsersMapper;
import practical.wjc.entity.Users;
import practical.wjc.service.UsersService;

import java.util.List;

@Service("usersServiceImpl")
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;
    @Override
    public Users login(String username,String password) {
        return usersMapper.login(username,password);
    }
    @Override
    public  int register(Users users){
        return usersMapper.insertSelective(users);
    }
    @Override
    public   List<Users> list(){
        return usersMapper.list();
    }
    @Override
    public int deleteByPrimaryKey(Integer userid){
        return usersMapper.deleteByPrimaryKey(userid);
    }
    @Override
    public  Users selectByPrimaryKey(Integer userid){
        return usersMapper.selectByPrimaryKey(userid);
    }
    @Override
    public  int updateByPrimaryKeySelective(Users record){
        return usersMapper.updateByPrimaryKeySelective(record);
    }
    @Override
    public  Users selectByUsername(String username){
        return usersMapper.selectByUsername(username);
    }
}
