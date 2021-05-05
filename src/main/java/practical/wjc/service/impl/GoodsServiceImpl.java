package practical.wjc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import practical.wjc.dao.GoodsMapper;
import practical.wjc.entity.Goods;
import practical.wjc.service.GoodsService;


import java.util.List;
@Service("goodsServiceImpl")
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> list() {
        return goodsMapper.list();
    }

    @Override
    public Goods selectByPrimaryKey(Integer goodsid){
        return goodsMapper.selectByPrimaryKey(goodsid);
    }

    @Override
    public int deleteByPrimaryKey(Integer goodsid){
        return goodsMapper.deleteByPrimaryKey(goodsid);
    }

    @Override
    public int updateByPrimaryKeySelective(Goods record){
        return  goodsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insertSelective(Goods record){
        return goodsMapper.insertSelective(record);
    }
}
