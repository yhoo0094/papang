package co.company.papang.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.company.papang.config.DBConfiguration;
import co.company.papang.config.MybatisConfiguration;
import co.company.papang.impl.EsMapper;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { DBConfiguration.class,MybatisConfiguration.class } )
public class EmpDaoMybatisClient2 {
@Autowired EsMapper empDAO;

@Test
public void empdaotest() {
	System.out.println(empDAO.getEmpList(null));
}


}

