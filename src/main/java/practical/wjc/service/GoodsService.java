package practical.wjc.service;

import practical.wjc.entity.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> list();
    Goods selectByPrimaryKey(Integer goodsid);
    int deleteByPrimaryKey(Integer goodsid);
    int updateByPrimaryKeySelective(Goods record);
    int insertSelective(Goods record);
}
