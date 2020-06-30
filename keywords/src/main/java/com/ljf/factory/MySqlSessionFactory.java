package com.ljf.factory;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory {

	public static SqlSessionFactory getMyF() throws IOException {

		InputStream resourceAsStream = MySqlSessionFactory.class.getClassLoader()
				.getResourceAsStream("mybatis-config.xml");

//		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();

//		SqlSessionFactory build = sqlSessionFactoryBuilder.build(resourceAsStream);
		resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory build = new SqlSessionFactoryBuilder().build(resourceAsStream);

		return build;

	}

}
