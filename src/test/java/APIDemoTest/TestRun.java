package APIDemoTest;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class TestRun {

    @BeforeClass
    public static void before() {
        System.setProperty("karate.env", "IOS");
    }

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:APIDemoTest/feature")
                .tags("@Demo") //test case tag
                .parallel(2);
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }

}
