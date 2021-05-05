<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/5/8
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登陆|注册</title>
    <link rel="stylesheet" href="/bootstrap/css/style.css">
</head>
<script type="text/javascript">
    function checkPassword() {
        var pwd=document.getElementById("pwd");
        var repwd=document.getElementById("repwd");
        if (pwd.value != repwd.value) {
            repwd.setCustomValidity("两次输入的密码不匹配");
        }else{
                repwd.setCustomValidity("");
            }
    }
</script>
<body>
<section>
    <div class="container">
        <div class="user singinBx">
            <div class="imgBx"><a href="/list.do"><img src="/images/meizu.jpg" alt=""></a></div>
            <div class="formBx">
                <form action="/user/login.do" method="post">
                    <h2>Sign In</h2>
                    <input type="text" name="username" placeholder="Username">
                    <input type="password" name="password" placeholder="Password">
                    <input type="submit" name="" value="Login">
                    <p class="signup">Don't have an account ?<a href="#" onclick="
                            toggleForm();">Register.</a></p>
                </form>
            </div>
        </div>
        <div class="user singupBx">
            <div class="formBx">
                <form action="/user/register.do" method="post">
                    <h2>Create an Account</h2>
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" id="pwd" name="password" placeholder="Create Password"  required onchange="checkPassword()" >
                    <input type="password" id="repwd" placeholder="Confirm Password" required oninvalid=""  onchange="checkPassword()">
                    <input type="tel" name="telephone" placeholder="Telephone" maxlength="11">
                    <input type="email" name="email" placeholder="Email Address">

                    <input type="submit" name="" value="Sign up">
                    <p class="signup">Already have an account ?<a href="#" onclick="
                            toggleForm();">Sign In.</a></p>
                </form>
            </div>
            <div class="imgBx"><a href="/list.do"><img src="/images/meiz.jpg" alt=""></a></div>
        </div>
    </div>
</section>
<script type="text/javascript">
    function toggleForm() {
        var container = document.querySelector('.container');
        container.classList.toggle('active')
    }
</script>

</body>
</html>