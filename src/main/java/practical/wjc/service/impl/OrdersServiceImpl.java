package practical.wjc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import practical.wjc.dao.OrdersMapper;
import practical.wjc.entity.Orders;
import practical.wjc.service.OrdersService;

import java.util.List;

@Service("odersServiceImpl")
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;
    @Override
    public List<Orders> list(){
        return ordersMapper.list();
    }
    @Override
    public int deleteByPrimaryKey(Integer orderid){
        return ordersMapper.deleteByPrimaryKey(orderid);
    }
    @Override
    public Orders  selectByPrimaryKey(Integer orderid){
        return ordersMapper.selectByPrimaryKey(orderid);
    }
    @Override
    public  int updateByPrimaryKeySelective(Orders record){
        return ordersMapper.updateByPrimaryKeySelective(record);
    }
    @Override
    public int insertSelective(Orders record){
        return ordersMapper.insertSelective(record);
    }
    @Override
    public List<Orders> selectByUserid(Integer userid){
        return ordersMapper.selectByUserid(userid);
    }
}
