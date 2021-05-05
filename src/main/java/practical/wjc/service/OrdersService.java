package practical.wjc.service;

import practical.wjc.entity.Orders;
import practical.wjc.entity.Users;

import java.util.List;

public interface OrdersService {
    List<Orders> list();
    int deleteByPrimaryKey(Integer orderid);
    Orders selectByPrimaryKey(Integer orderid);
    int updateByPrimaryKeySelective(Orders record);
    int insertSelective(Orders record);
    List<Orders> selectByUserid(Integer userid);
}
