package practical.wjc.service;

import practical.wjc.entity.Users;

import java.util.List;

public interface UsersService {
    Users login(String name,String password);
    int register(Users users);
    List<Users> list();
    int deleteByPrimaryKey(Integer userid);
    Users selectByPrimaryKey(Integer userid);
    int updateByPrimaryKeySelective(Users record);
    Users selectByUsername(String username);
}
