package edu.Northeastern.CS5200.finalProject.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.Northeastern.CS5200.finalProject.entity.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

/**
 * FileName: OrderDetailMapper
 * Date: 2023/01/20
 * Time: 23:51
 * Author: river
 */
@Mapper
public interface OrderDetailMapper extends BaseMapper<OrderDetail> {
}
