package com.ljf.test;

import java.io.IOException;
import java.util.List;

import com.ljf.util.MyPropertyUtil;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ljf.bean.KEYWORDFS_T_MALL_SKU;
import com.ljf.factory.MySqlSessionFactory;
import com.ljf.mapper.ClassMapper;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.impl.XMLResponseParser;

public class Test {

	public static void main(String[] args) throws IOException, SolrServerException {
		SqlSessionFactory myF = MySqlSessionFactory.getMyF();

		ClassMapper mapper = myF.openSession().getMapper(ClassMapper.class);

		List<KEYWORDFS_T_MALL_SKU> list_sku = mapper.select_list_by_flbh2(25);
		System.out.println(list_sku.toString());
		//solr中导入sku数据
		HttpSolrServer solrServer = new HttpSolrServer(MyPropertyUtil.getProperty("solr.properties","solr_sku"));
		//设置编码
		solrServer.setParser(new XMLResponseParser());
		//设置添加的数据
		solrServer.addBeans(list_sku);
		//提交
		solrServer.commit();
//		SolrQuery solrQuery = new SolrQuery();
//		solrQuery.setQuery("sku_mch:*");
//		QueryResponse queryResponse = solrServer.query(solrQuery);
//		List<KEYWORDFS_T_MALL_SKU> beans = queryResponse.getBeans(KEYWORDFS_T_MALL_SKU.class);
//		System.out.println(beans);


	}


}
