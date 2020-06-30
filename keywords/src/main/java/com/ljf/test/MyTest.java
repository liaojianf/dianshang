package com.ljf.test;

import com.ljf.bean.KEYWORDFS_T_MALL_SKU;
import com.ljf.factory.MySqlSessionFactory;
import com.ljf.mapper.ClassMapper;
import com.ljf.util.MyPropertyUtil;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;

import java.io.IOException;
import java.util.List;

public class MyTest {
    public static void main(String[] args) throws IOException, SolrServerException {
        SqlSessionFactory sessionFactory = MySqlSessionFactory.getMyF();
        ClassMapper mapper = sessionFactory.openSession().getMapper(ClassMapper.class);
        List<KEYWORDFS_T_MALL_SKU> keywordfs_t_mall_skus = mapper.select_list_by_flbh2(25);
        System.out.println(keywordfs_t_mall_skus);
        HttpSolrServer httpSolrServer = new HttpSolrServer(MyPropertyUtil.getProperty("solr.properties","solr_sku"));
//        httpSolrServer.setParser(new XMLResponseParser());
//        httpSolrServer.addBeans(keywordfs_t_mall_skus);
//        httpSolrServer.commit();
//        SolrServer solrServer =
        SolrQuery solrQuery = new SolrQuery();
          solrQuery.setQuery("sku_mch:*");
        QueryResponse queryResponse = httpSolrServer.query(solrQuery);
        List<KEYWORDFS_T_MALL_SKU> responseBeans = queryResponse.getBeans(KEYWORDFS_T_MALL_SKU.class);
        System.out.println(responseBeans);
    }
}
