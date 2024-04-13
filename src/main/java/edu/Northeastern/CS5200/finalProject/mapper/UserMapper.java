package edu.Northeastern.CS5200.finalProject.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.Northeastern.CS5200.finalProject.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * FileName: UserMapper
 * Date: 2023/01/16
 * Time: 20:18
 * Author: river
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
