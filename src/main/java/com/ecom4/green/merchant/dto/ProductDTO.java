package com.ecom4.green.merchant.dto;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

@Setter
@Scope(value = WebApplicationContext.SCOPE_SESSION,
	   proxyMode = ScopedProxyMode.TARGET_CLASS)
@Data
@ToString
public class ProductDTO {
	private int id;
	private String name;
	private int price;
	private int weight;
	private String status;
	private int stock;

	private String created_at;
	private int image_group_id;
	private String merchant_id;
	private int category_code;
}

