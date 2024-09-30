Feature: Failed Booking Management Scenarios

  Scenario: Retrieve a non-existing booking
    Given I have a non-existing booking ID
    When I send a GET request to retrieve the booking
    Then the response status code should be 404
    And the response should indicate "Booking not found"

  Scenario: Delete a non-existing booking
    Given I have a non-existing booking ID
    When I send a DELETE request to remove the booking
    Then the response status code should be 404
    And the response should indicate "Booking not found"

  Scenario: Create a booking with invalid data
    Given I have invalid booking details
    When I send a POST request to create a booking
    Then the response status code should be 400
    And the response should indicate "Invalid input"
