import com.atguigu.bean.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class tesr {

    @Autowired
    User user;
    @Test
    public void adasd(){
        System.out.println(user);
    }
}
