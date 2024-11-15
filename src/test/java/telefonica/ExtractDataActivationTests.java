package telefonica;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

public class ExtractDataActivationTests {
    
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:telefonica/dataactivation/dataactivation.feature")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
