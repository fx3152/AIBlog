package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.UserRole;
import org.apache.ibatis.annotations.Select;

/**
 * @author chenpang
 * @version 1.0
 * @Description 用户角色数据层
 * @Date 2024/4/3 21:44
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {


    @Select("delete from user_role where user_id=#{userId}")
    void deleteByUserRoleId(Long userId);
}
