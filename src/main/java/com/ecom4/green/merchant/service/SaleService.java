package com.ecom4.green.merchant.service;

import com.ecom4.green.merchant.dto.SaleDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface SaleService
{
        Page<SaleDTO > getSaleList(int category, Pageable pageable);
        Page<SaleDTO> getSaleList(int category,String keyword , Pageable pageable);

}