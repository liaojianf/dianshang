import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.service.CartServiceInf;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class account {
    @Autowired
    CartServiceInf cartServiceInf;

    @Test
    public void account(){
        T_MALL_USER_ACCOUNT account = cartServiceInf.account();
        System.out.println(account);
    }

}
