package com.ljf.controller;

import com.ljf.bean.KEYWORDFS_T_MALL_SKU;
import com.ljf.util.MyPropertyUtil;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class KeywordController {

    @RequestMapping(value = "keywords")
    @ResponseBody
    public List<KEYWORDFS_T_MALL_SKU> keywords(String keywords) throws SolrServerException, UnsupportedEncodingException {
        List<KEYWORDFS_T_MALL_SKU> list_sku = new ArrayList<KEYWORDFS_T_MALL_SKU>();
        String  str = new String(keywords.getBytes("ISO8859_1"), "UTF-8");
        HttpSolrServer httpSolrServer = new HttpSolrServer(MyPropertyUtil.getProperty("solr.properties","solr_sku"));
        SolrQuery solrQuery =new SolrQuery();
        System.out.println(str);
        solrQuery.setQuery("combine_item:"+str);
        QueryResponse queryResponse = httpSolrServer.query(solrQuery);
        list_sku= queryResponse.getBeans(KEYWORDFS_T_MALL_SKU.class);
        return list_sku;
    }

}
