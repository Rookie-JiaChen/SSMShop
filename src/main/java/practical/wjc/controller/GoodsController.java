package practical.wjc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import practical.wjc.entity.Goods;
import practical.wjc.service.GoodsService;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
//@RestController
public class GoodsController {
    @Getter @Setter
    private List<Goods> goods=new ArrayList<Goods>();
    //请求映射，当用户发送list.do时将会执行list方法
    @Autowired
    private GoodsService goodsServiceImpl;
    @RequestMapping("list.do")
//    @CrossOrigin
//    @GetMapping("list.do")
//    @ResponseBody
    public String list(Model model,@RequestParam(value="page",defaultValue= "1") int page){
        //通过pagehelper限制页面内容数量
        PageHelper.startPage(page,12);
        goods=goodsServiceImpl.list();
        //封装goods到pageinfo对象中
        PageInfo pageInfo=new PageInfo(goods);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }

    @RequestMapping("goodsInfo.do")
    public String find(Model model,int id){
        Goods goods=goodsServiceImpl.selectByPrimaryKey(id);
        model.addAttribute("goods",goods);
        return "goodsInfo";
    }
    //展示购物车
    @RequestMapping("showCart.do")
    public  String showCart(){
        return "ShoppingCart";
    }
    //添加到购物车
    @RequestMapping("addToCart.do")
    public String addToCart(int goodsid, HttpSession session, Model model) {
        Goods goods=goodsServiceImpl.selectByPrimaryKey(goodsid);
        Map<Goods, Integer> cart = (Map<Goods, Integer>)session.getAttribute("cart");

        if(cart == null) {
            cart = new HashMap<>();//创建购物车Map集合
//            goods = goodsServiceImpl.selectByPrimaryKey(goodsid);//从数据库中查询商品信息
            cart.put(goods, 1);//向购物车map集合中添加商品
            session.setAttribute("cart", cart);//向session中添加购物车
        }else {
            Integer n = cart.get(goods);
            if(!cart.containsKey(goods)) {
//                goods = goodsServiceImpl.selectByPrimaryKey(goodsid);//从数据库中查询商品信息
                cart.put(goods, 1);
            }else {
                cart.put(goods, 1+n);
            }
        }

        return "ShoppingCart";
    }
    //清空购物车
    @RequestMapping("clearShoppingCar.do")
    public String clearShoppingCar(HttpSession session){
        session.removeAttribute("cart");
        return "ShoppingCart";
    }

}
