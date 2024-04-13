package edu.Northeastern.CS5200.finalProject.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import edu.Northeastern.CS5200.finalProject.common.CustomException;
import edu.Northeastern.CS5200.finalProject.entity.Category;
import edu.Northeastern.CS5200.finalProject.entity.Dish;
import edu.Northeastern.CS5200.finalProject.entity.Setmeal;
import edu.Northeastern.CS5200.finalProject.mapper.CategoryMapper;
import edu.Northeastern.CS5200.finalProject.service.CategoryService;
import edu.Northeastern.CS5200.finalProject.service.DishService;
import edu.Northeastern.CS5200.finalProject.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>Project: tiger-takeaway - CategoryServiceImpl
 * <p>Powered by Riverify On 01-02-2023 21:44:52
 *
 * @author Riverify
 * @version 1.0
 * @since JDK8
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
    // ServiceImpl<CategoryMapper, Category> 为MyBatis-Plus提供的基础实现类，<CategoryMapper, Category> 为泛型，CategoryMapper为Mapper接口，Category为实体类


    // 注入菜品和套餐的Service，用于remove()中使用，判断分类下是否有菜品或套餐
    @Autowired
    private DishService dishService;
    @Autowired
    private SetmealService setmealService;


    /**
     * 自定义一个删除删除分类的服务满足特殊业务需求，即在删除之前需要判断该分类下是否有菜品(Dish)或者套餐(Setmeal)，如果有则不能删除该分类
     *
     * @param id 分类id
     */
    @Override
    public void remove(Long id) {
        // 构造Dish查询条件
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper = new LambdaQueryWrapper<>();
        dishLambdaQueryWrapper.eq(Dish::getCategoryId, id);     // eq means : where "getCategoryId" = "id"
        int count = dishService.count(dishLambdaQueryWrapper);  // count means : select count(*) from "Dish"
        // 查询当前分类是否关联了菜品，如果关联了则不能删除，抛出一个业务异常
        if (count > 0) {
            throw new CustomException("该分类下存在菜品，故不能删除");
        }

        // 构造Setmeal查询条件（同上）
        LambdaQueryWrapper<Setmeal> setmealLambdaQueryWrapper = new LambdaQueryWrapper<>();
        setmealLambdaQueryWrapper.eq(Setmeal::getCategoryId, id);
        count = setmealService.count(setmealLambdaQueryWrapper);
        // 同理查询分类是否关联了套餐，如果关联了则不能删除，抛出一个业务异常
        if (count > 0) {
            throw new CustomException("该分类下存在套餐，故不能删除");
        }

        // 正常删除分类
        super.removeById(id);
    }
}
