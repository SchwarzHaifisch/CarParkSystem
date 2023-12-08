package pl.coderslab;

import org.junit.Test;

public class HelloWorldTest {

    @Test
    public void testHelloWorldWithIncorrectValue() {
        HelloWorld helloWorld = new HelloWorld();
        String result = helloWorld.helloWorld();
        assertEquals("Hello World!", result);
    }

    @Test
    public void testHelloWorldWithCorrectValue() {
        HelloWorld helloWorld = new HelloWorld();
        String result = helloWorld.helloWorld();
        assertEquals("Hello, World!", result);
    }
}

