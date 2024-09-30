package testrunner;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

import java.io.File;
import java.io.IOException;

import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class BookingApiSteps {

    private Response apiResponse;
    private String baseUri = "https://your.api.endpoint"; // Set your base URL here

    // Helper class to load test data
    private static <T> T loadInputData(String filePath, Class<T> valueType) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(new File(filePath), valueType);
    }

    // Helper class to compare response with expected output
    private static boolean compareResponseWithExpected(String actualResponse, String expectedOutputFilePath) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Object expectedResponse = mapper.readValue(new File(expectedOutputFilePath), Object.class);
        Object actualResponseObj = mapper.readValue(actualResponse, Object.class);
        return expectedResponse.equals(actualResponseObj);
    }

    // Initialize RestAssured
    static {
        RestAssured.baseURI = "https://your.api.endpoint"; // Set your base URL here
    }

    @Given("I want to build the request with body from {string}")
    public void i_want_to_build_the_request_with_body_from(String inputFilePath) throws IOException {
        // Load input data from file and set it for the request body
        BookingData bookingData = loadInputData("src/test/resources/testdata/input/" + inputFilePath, BookingData.class);

        // You can use this object for further API request body setting
        // For example:
        apiResponse = given()
                .header("Content-Type", "application/json")
                .body(bookingData)
                .when();
    }

    @When("I submit the {string} request to {string}")
    public void i_submit_the_request(String requestMethod, String endpoint) {
        // Execute API request based on the HTTP method
        switch (requestMethod.toUpperCase()) {
            case "POST":
                apiResponse = apiResponse.post(baseUri + endpoint);
                break;
            case "GET":
                apiResponse = apiResponse.get(baseUri + endpoint);
                break;
            case "PUT":
                apiResponse = apiResponse.put(baseUri + endpoint);
                break;
            case "DELETE":
                apiResponse = apiResponse.delete(baseUri + endpoint);
                break;
            default:
                throw new IllegalArgumentException("Invalid request method: " + requestMethod);
        }
    }

    @Then("The status code should be {int}")
    public void the_status_code_should_be(int expectedStatusCode) {
        // Validate the status code
        assertEquals("The status code is incorrect!", expectedStatusCode, apiResponse.getStatusCode());
    }

    @Then("The response body should match {string}")
    public void the_response_body_should_match(String expectedOutputFile) throws IOException {
        // Compare the actual API response with the expected output file
        String actualResponse = apiResponse.asString();
        boolean match = compareResponseWithExpected(actualResponse, "src/test/resources/testdata/output/" + expectedOutputFile);
        assertTrue("The response did not match the expected output!", match);
    }

    @Then("Save the API response to {string}")
    public void save_the_api_response_to(String outputFilePath) throws IOException {
        // Save the response to an output file
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(new File("src/test/resources/testdata/output/" + outputFilePath), apiResponse.asString());
    }
}
