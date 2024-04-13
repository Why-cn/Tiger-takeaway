package edu.Northeastern.CS5200.finalProject.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import edu.Northeastern.CS5200.finalProject.entity.OrderDetail;
import edu.Northeastern.CS5200.finalProject.mapper.OrderDetailMapper;
import edu.Northeastern.CS5200.finalProject.service.OrderDetailService;
import org.springframework.stereotype.Service;

/**
 * FileName: OrderDetailServiceImpl
 * Date: 2023/01/20
 * Time: 23:58
 * Author: river
 */
@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {
}
