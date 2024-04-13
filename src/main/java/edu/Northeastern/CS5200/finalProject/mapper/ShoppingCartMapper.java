package edu.Northeastern.CS5200.finalProject.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.Northeastern.CS5200.finalProject.entity.ShoppingCart;
import org.apache.ibatis.annotations.Mapper;

/**
 * FileName: ShoppingCartMapper
 * Date: 2023/01/19
 * Time: 21:12
 * Author: river
 */
@Mapper
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
}
