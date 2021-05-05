package practical.wjc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import practical.wjc.entity.Admin;
import practical.wjc.entity.Goods;
import practical.wjc.entity.Orders;
import practical.wjc.entity.Users;
import practical.wjc.service.AdminService;
import practical.wjc.service.GoodsService;
import practical.wjc.service.OrdersService;
import practical.wjc.service.UsersService;
import practical.wjc.util.MD5Util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminController {
    @Getter@Setter
    private List<Goods> goods=new ArrayList<Goods>();
    @Getter@Setter
    private List<Users> users=new ArrayList<Users>();
    @Getter@Setter
    private List<Admin> admins=new ArrayList<Admin>();
    @Getter@Setter
    private List<Orders> orders=new ArrayList<Orders>();
    @Autowired
    private AdminService adminServiceImpl;
    @Autowired
    private GoodsService goodsServiceImpl;
    @Autowired
    private UsersService usersServiceImpl;
    @Autowired
    private OrdersService ordersServiceImpl;

    @RequestMapping("login.do")
    public String login(String adminname, String password, Model model, HttpServletResponse res){
        Admin admin = adminServiceImpl.login(adminname, MD5Util.md5(password));
        if (admin == null) {
            System.out.println("Admin Login failed");
            return "adminLogin";
        } else {
            System.out.println("Admin Login successed");
//            model.addAttribute("adminname", adminname);
            Cookie cookie=new Cookie("adminname",adminname);
            res.addCookie(cookie);
            return "redirect: goodsList.do";
        }

    }
    //展示商品信息
    @RequestMapping("goodsList.do")
    public String goodsList(Model model, @RequestParam(value="page",defaultValue= "1") int page, @CookieValue("adminname")String adminname){
//        System.out.println(adminname);
        PageHelper.startPage(page,10);
        goods=goodsServiceImpl.list();
        PageInfo pageInfo=new PageInfo(goods);
        model.addAttribute("pageInfo",pageInfo);
        return "goodsList";
    }
    //删除商品
    @RequestMapping("deleteGoods.do")
    public String deleteGoods(int goodsid){
        goodsServiceImpl.deleteByPrimaryKey(goodsid);
        return "redirect:goodsList.do";
    }
    //更新商品前置
    @RequestMapping("toUpdateGoods.do")
    public String toUpdateGoods(int goodsid,Model model){
        Goods goods=goodsServiceImpl.selectByPrimaryKey(goodsid);
        model.addAttribute("goods",goods);
        return "updateGoods";
    }
    //上传方法 -web.xml配置上传路径以及大小等
    private void uploadFile(MultipartFile image) throws IOException {
        if(image!=null){
            File imageFile = new File(image.getOriginalFilename());// 上传后的文件保存目录及名字
            image.transferTo(imageFile);// 将上传文件保存到相应位置
        }
    }
    //更新商品
    @RequestMapping("UpdateGoods.do")
    public String UpdateGoods(Goods goods,@RequestParam(value = "file") MultipartFile file) throws IOException {
        //实现上传
        uploadFile(file);
        goods.setImages(file.getOriginalFilename());
        goodsServiceImpl.updateByPrimaryKeySelective(goods);
        return "redirect: goodsList.do";
    }
    //添加商品前置
    @RequestMapping("toAddGoods.do")
    public String toAddGoods(){
        return "addGoods";
    }
    //添加商品
    @RequestMapping("addGoods.do")
    public String addGoods(Goods goods,@RequestParam(value = "file") MultipartFile file) throws IOException {
        //实现上传
        uploadFile(file);
        goods.setImages(file.getOriginalFilename());
        goodsServiceImpl.insertSelective(goods);
        return "redirect: goodsList.do";
    }
    //展示用户信息
    @RequestMapping("usersList.do")
    public String userList(Model model, @RequestParam(value="page",defaultValue= "1") int page){
        PageHelper.startPage(page,10);
        users=usersServiceImpl.list();
        PageInfo pageInfo=new PageInfo(users);
        model.addAttribute("pageInfo",pageInfo);
        return "usersList";
    }
    //添加用户前置
    @RequestMapping("toAddUsers.do")
    public String toAddUsers(){
        return "addUsers";
    }
    //添加用户
    @RequestMapping("addUsers.do")
    public String AddUsers(Users users){
        //md5加密
        users.setPassword(MD5Util.md5(users.getPassword()));
        usersServiceImpl.register(users);
        return "redirect: usersList.do";
    }
    //删除用户
    @RequestMapping("deleteUsers.do")
    public String deleteUsers(int userid){
        usersServiceImpl.deleteByPrimaryKey(userid);
        return "redirect: usersList.do";
    }

    //修改用户信息前置
    @RequestMapping("toUpdateUsers.do")
    public String toUpdateUsers(int userid,Model model){
     Users users=usersServiceImpl.selectByPrimaryKey(userid);
     model.addAttribute("users",users);
     return "updateUsers";
    }

    //修改用户信息
    @RequestMapping("UpdateUsers.do")
    public String UpdateUsers(Users users){
        usersServiceImpl.updateByPrimaryKeySelective(users);
        return "redirect: usersList.do";
    }

    //展示管理员信息
    @RequestMapping("adminList.do")
    public String adminList(Model model, @RequestParam(value="page",defaultValue= "1") int page){
        PageHelper.startPage(page,10);
        admins=adminServiceImpl.list();
        PageInfo pageInfo=new PageInfo(admins);
        model.addAttribute("pageInfo",pageInfo);
        return "adminList";
    }
    //添加管理员前置
    @RequestMapping("toAddAdmin.do")
    public String toAddAdmin(){
        return "addAdmin";
    }
    //添加管理员
    @RequestMapping("addAdmin.do")
    public String addAdmin(Admin admin){
        //md5加密
        admin.setPassword(MD5Util.md5(admin.getPassword()));
        adminServiceImpl.register(admin);
        return "redirect: adminList.do";
    }
    //删除管理员
    @RequestMapping("deleteAdmin.do")
    public String deleteAdmin(int adminid){
        adminServiceImpl.deleteByPrimaryKey(adminid);
        return "redirect: adminList.do";
    }

    //修改管理员信息前置
    @RequestMapping("toUpdateAdmin.do")
    public String toUpdateAdmin(int adminid,Model model){
        Admin admin=adminServiceImpl.selectByPrimaryKey(adminid);
        model.addAttribute("admin",admin);
        return "updateAdmin";
    }
    //修改管理员信息
    @RequestMapping("UpdateAdmin.do")
    public String UpdateAdmin(Admin admin){
        adminServiceImpl.updateByPrimaryKeySelective(admin);
        return "redirect: adminList.do";
    }

    //展示订单信息
    @RequestMapping("ordersList.do")
    public String ordersList(Model model, @RequestParam(value="page",defaultValue= "1") int page){
        PageHelper.startPage(page,10);
        orders=ordersServiceImpl.list();
        PageInfo pageInfo=new PageInfo(orders);
        model.addAttribute("pageInfo",pageInfo);
        return "ordersList";
    }
    //添加订单前置
    @RequestMapping("toAddOrders.do")
    public String toAddOrders(){
        return "addOrders";
    }
    //添加订单
    @RequestMapping("addOrders.do")
    public String addOrders(Orders orders){
        ordersServiceImpl.insertSelective(orders);
        return "redirect: ordersList.do";
    }
    //删除订单
    @RequestMapping("deleteOrders.do")
    public String deleteOrders(int orderid){
        ordersServiceImpl.deleteByPrimaryKey(orderid);
        return "redirect: ordersList.do";
    }

    //修改订单信息前置
    @RequestMapping("toUpdateOrders.do")
    public String toUpdateOrders(int orderid,Model model){
        Orders orders=ordersServiceImpl.selectByPrimaryKey(orderid);
        model.addAttribute("orders",orders);
        return "updateOrders";
    }

    //修改订单信息
    @RequestMapping("UpdateOrders.do")
    public String UpdateOrders(Orders orders){
       ordersServiceImpl.updateByPrimaryKeySelective(orders);
        return "redirect: ordersList.do";
    }
}
