package telefonica.simswap;

import com.intuit.karate.junit5.Karate;

class SimSwapRunner{

    @Karate.Test
    Karate simSwapTest() {
        return Karate.run("SimSwap").relativeTo(getClass());
    }
}
