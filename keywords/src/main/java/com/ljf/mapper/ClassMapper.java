package com.ljf.mapper;

import java.util.List;

import com.ljf.bean.KEYWORDFS_T_MALL_SKU;
import com.ljf.bean.T_MALL_USER_ACCOUNT;

public interface ClassMapper {
	List<KEYWORDFS_T_MALL_SKU> select_list_by_flbh2(int flbh2);
	T_MALL_USER_ACCOUNT account();
}
