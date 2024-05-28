package com.example.demo.common;

import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.demo.entity.User;
import com.example.demo.exception.CustomException;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 认证拦截器，用于在请求处理之前进行认证和授权检查。
 */
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    private UserMapper userMapper;

    /**
     * 在请求处理之前进行执行的拦截器方法。
     *
     * @param request  HttpServletRequest对象，代表客户端的HTTP请求
     * @param response HttpServletResponse对象，代表服务器对客户端的响应
     * @param handler  将要处理请求的处理器对象
     * @return boolean 返回false表示后续拦截器和处理器都不会执行，返回true表示继续执行后续拦截器或处理器
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

        // 从请求头中获取token
        String token = request.getHeader("token");
        // 如果token为空或格式不正确，则抛出未获取到token的异常
        if (StrUtil.isBlank(token)) {
            throw new CustomException("401", "未获取到token, 请重新登录");
        }
        // 解析token获取用户ID
        Integer userId = Integer.valueOf(JWT.decode(token).getAudience().get(0));
        // 根据用户ID查询用户信息
        User user = userMapper.selectById(userId);
        // 如果查询到的用户为空，则抛出token不合法的异常
        if (user == null) {
            throw new CustomException("401", "token不合法");
        }
        // 验证token的合法性
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
        try {
            jwtVerifier.verify(token);
        } catch (Exception e) {
            // 如果验证失败，则抛出token不合法的异常
            throw new CustomException("401", "token不合法");
        }
        return true;
    }
}