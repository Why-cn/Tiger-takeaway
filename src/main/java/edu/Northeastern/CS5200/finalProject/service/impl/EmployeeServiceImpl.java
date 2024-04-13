package edu.Northeastern.CS5200.finalProject.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import edu.Northeastern.CS5200.finalProject.entity.Employee;
import edu.Northeastern.CS5200.finalProject.mapper.EmployeeMapper;
import edu.Northeastern.CS5200.finalProject.service.EmployeeService;
import org.springframework.stereotype.Service;

/**
 * <p>Project: tiger-takeaway - EmployeeServiceImpl
 * <p>Powered by Riverify On 12-15-2022 18:48:58
 *
 * @author Riverify
 * @version 1.0
 * @since JDK8
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {
    // ServiceImpl<Mapper, Entity> 为MyBatis-Plus提供的基础实现类，<>中的两个泛型分别为Mapper接口和Entity实体类
}
