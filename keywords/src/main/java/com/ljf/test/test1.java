package com.ljf.test;

import com.ljf.bean.KEYWORDFS_T_MALL_SKU;
import com.ljf.factory.MySqlSessionFactory;
import com.ljf.mapper.ClassMapper;
import com.ljf.util.MyPropertyUtil;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.impl.XMLResponseParser;

import java.io.IOException;
import java.util.List;

public class test1 {
    public static void main(String[] args) throws IOException, SolrServerException {
        SqlSessionFactory sqlSessionFactory = MySqlSessionFactory.getMyF();
        ClassMapper mapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
        List<KEYWORDFS_T_MALL_SKU> keywordfs_t_mall_skus = mapper.select_list_by_flbh2(17);
        System.out.println(keywordfs_t_mall_skus);
        HttpSolrServer httpSolrServer = new HttpSolrServer(MyPropertyUtil.getProperty("solr.properties","solr_sku"));
        httpSolrServer.setParser(new XMLResponseParser());
        httpSolrServer.addBeans(keywordfs_t_mall_skus);
        httpSolrServer.commit();

    }
}
