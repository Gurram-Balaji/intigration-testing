@BookingApi
Feature: This is the test suite for booking API failure scenarios

  Scenario: BookingApi_RetrieveNonExistingBooking_TS01
  Description: This scenario is for retrieving a non-existing booking
    Given I want to build the request using a non-existing booking ID from "input_retrieve_non_existing_booking.json"
    When I submit the "GET" request to "/booking/{bookingId}"
    Then The status code should be 404
    And The response body should match "expected_retrieve_non_existing_booking_output.json"

  Scenario: BookingApi_DeleteNonExistingBooking_TS02
  Description: This scenario is for deleting a non-existing booking
    Given I want to build the request using a non-existing booking ID from "input_delete_non_existing_booking.json"
    When I submit the "DELETE" request to "/booking/{bookingId}"
    Then The status code should be 404
    And The response body should match "expected_delete_non_existing_booking_output.json"

  Scenario: BookingApi_CreateBookingWithInvalidData_TS03
  Description: This scenario is for creating a booking with invalid data
    Given I want to build the request with invalid data from "input_create_invalid_booking.json"
    When I submit the "POST" request to "/booking"
    Then The status code should be 400
    And The response body should match "expected_create_invalid_booking_output.json"
