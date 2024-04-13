package edu.Northeastern.CS5200.finalProject.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.Northeastern.CS5200.finalProject.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

/**
 * FileName: OrdersMapper
 * Date: 2023/01/20
 * Time: 23:49
 * Author: river
 */
@Mapper
public interface OrdersMapper extends BaseMapper<Orders> {
}
