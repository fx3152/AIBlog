package com.example.demo.controller;

import com.example.demo.common.Result;
import com.example.demo.entity.Category;
import com.example.demo.mapper.CategoryMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/category")
public class CategoryController extends BaseController {

    @Resource
    CategoryMapper CategoryMapper; // 注入CategoryMapper，用于数据库

    /**
     * 保存分类信息
     *
     * @param Category 包含分类信息的对象
     * @return 返回操作结果，成功则返回success
     */
    @PostMapping
    public Result<?> save(@RequestBody Category Category) {
        CategoryMapper.insert(Category); // 插入分类信息到数据库
        return Result.success();
    }

    /**
     * 更新分类信息
     *
     * @param Category 包含更新后的分类信息的对象
     * @return 返回操作结果，成功则返回success
     */
    @PutMapping
    public Result<?> update(@RequestBody Category Category) {
        CategoryMapper.updateById(Category); // 根据ID更新分类信息
        return Result.success();
    }

    /**
     * 根据ID删除分类
     *
     * @param id 要删除的分类的ID
     * @return 返回操作结果，成功则返回success
     */
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        CategoryMapper.deleteById(id); // 根据ID删除分类
        return Result.success();
    }

    /**
     * 根据ID获取分类信息
     *
     * @param id 要获取的分类的ID
     * @return 返回操作结果，包含指定ID的分类信息
     */
    @GetMapping("/{id}")
    public Result<?> getById(@PathVariable Integer id) {
        return Result.success(CategoryMapper.selectById(id)); // 根据ID查询并返回分类信息
    }

    /**
     * 获取所有分类及其子分类
     *
     * @return 返回操作结果，包含所有分类及其子分类的信息
     */
    @GetMapping
    public Result<?> getAll() {
        // 查询所有分类信息
        List<Category> allCategories = CategoryMapper.selectList(null);
        return Result.success(loopQuery(null, allCategories)); // 递归处理所有分类，构建父子关系
    }

    /**
     * 递归查询子分类
     *
     * @param pid 父分类的ID
     * @param allCategories 所有分类的列表
     * @return 返回根据父分类ID查询到的子分类列表
     */
    private List<Category> loopQuery(Integer pid, List<Category> allCategories) {
        List<Category> categoryList = new ArrayList<>();
        for (Category category : allCategories) {
            if (pid == null) {
                if (category.getPid() == null) {
                    categoryList.add(category); // 添加根分类
                    // 继续递归查询子分类
                    category.setChildren(loopQuery(category.getId(), allCategories));
                }
            } else if (pid.equals(category.getPid())) {
                categoryList.add(category); // 添加子分类
                // 继续递归查询子分类
                category.setChildren(loopQuery(category.getId(), allCategories));
            }
        }
        return categoryList;
    }
}

