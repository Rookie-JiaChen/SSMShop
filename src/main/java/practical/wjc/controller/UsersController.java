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
import practical.wjc.entity.Orders;
import practical.wjc.entity.Users;
import practical.wjc.service.GoodsService;
import practical.wjc.service.OrdersService;
import practical.wjc.service.UsersService;
import practical.wjc.util.MD5Util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

//@RestController
@Controller
//@SessionAttributes("username")
@RequestMapping("/user/")
public class UsersController {
    @Getter
    @Setter
    private List<Goods> goods=new ArrayList<Goods>();
    @Getter
    @Setter
    private List<Orders> orders=new ArrayList<Orders>();
    //请求映射，当用户发送list.do时将会执行list方法
    @Autowired
    private GoodsService goodsServiceImpl;
    @Autowired
    private OrdersService ordersServiceImpl;
//    @PostMapping ("login.do")
//    @ResponseBody
//    @CrossOrigin
    @Autowired
    private UsersService usersServiceImpl;
    //登陆方法
    @RequestMapping("login.do")
    public String login(String username, String password,HttpServletResponse res){

        Users users = usersServiceImpl.login(username, MD5Util.md5(password));
        if (users == null) {
            System.out.println("User Login failed");
            return "login";
        } else {
            System.out.println("User Login successed");
            Cookie usercookie=new Cookie("username",username);
            res.addCookie(usercookie);
//            model.addAttribute("username", users.getUsername());
            return "redirect: loglist.do";
        }

    }
    //注册方法
    @RequestMapping("register.do")
    public String register(Users users){
        //md5加密
        users.setPassword(MD5Util.md5(users.getPassword()));
        usersServiceImpl.register(users);
        return "login";
    }

    //登陆后转移到首页
    @RequestMapping("loglist.do")
    public String loglist(Model model,@RequestParam(value="page",defaultValue= "1") int page,@CookieValue("username")String username){
        //通过pagehelper限制页面内容数量
        PageHelper.startPage(page,12);
        goods=goodsServiceImpl.list();
        //封装goods到pageinfo对象中
        PageInfo pageInfo=new PageInfo(goods);
//        System.out.println(username);
//        model.addAttribute("username",username);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }
    //我的订单
    @RequestMapping("myOrders.do")
    public String myOrders(@CookieValue("username")String username,Model model,@RequestParam(value="page",defaultValue= "1") int page){
        PageHelper.startPage(page,12);
        //通过cookie-username 获得用户id
        Users user=usersServiceImpl.selectByUsername(username);
        //通过用户id查找订单
        orders=ordersServiceImpl.selectByUserid(user.getUserid());
        PageInfo pageInfo=new PageInfo(orders);
        model.addAttribute("pageInfo",pageInfo);
        return "myOrders";
    }

    //添加订单前置
    @RequestMapping("toAddOrders.do")
    public String toAddOrders(@CookieValue("username")String username){
        return "UsersaddOrders";
    }

    //添加订单
    @RequestMapping("addOrders.do")
    public String addOrders(Orders orders, HttpSession session,@CookieValue("username")String username){
        //通过cookie-username 获得用户id
        Users user=usersServiceImpl.selectByUsername(username);
        //获取当前系统时间
        Date currentTime=new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);

        //设置订单时间
        orders.setOrderdate(dateString);
//        System.out.println(dateString);
        //设置订单用户id
        orders.setUserid(user.getUserid());
//        System.out.println(orders.getUserid());

        Map<Goods, Integer> cart = (Map<Goods, Integer>)session.getAttribute("cart");
        double total=0;
        String goodstag1 = "";
        String goodstag= "";
        String quantity1="";
        String quantity="";
        //遍历map
        for (Map.Entry<Goods, Integer> entry : cart.entrySet()) {
            Goods good=entry.getKey();
            System.out.println(good.getGoodsid());
//            //计算商品价格总和
            total+=Double.parseDouble(good.getGoodsprice());
//            //设置订单中商品标签
            goodstag=goodstag.concat(goodstag1.concat(good.getGoodsname()).concat("@"));
//            //设置订单中数量
            quantity=quantity.concat(quantity1.concat(Integer.toString(entry.getValue())).concat("@"));
//            System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
        }
        orders.setQuantity(quantity);
        orders.setTotal(total);
        orders.setGoodstag(goodstag);
        orders.setState("未处理");
        ordersServiceImpl.insertSelective(orders);
        session.removeAttribute("cart");
        return "redirect: myOrders.do";
    }

    //删除订单
    @RequestMapping("delOrders.do")
    public  String delOrders(int orderid){
        ordersServiceImpl.deleteByPrimaryKey(orderid);
        return "redirect: myOrders.do";
    }
}
