package edu.Northeastern.CS5200.finalProject.dto;

import edu.Northeastern.CS5200.finalProject.entity.OrderDetail;
import edu.Northeastern.CS5200.finalProject.entity.Orders;
import lombok.Data;

import java.util.List;

@Data
public class OrdersDto extends Orders {

    private String userName;

    private String email;

    private String address;

    private String consignee;

    private List<OrderDetail> orderDetails;

}
