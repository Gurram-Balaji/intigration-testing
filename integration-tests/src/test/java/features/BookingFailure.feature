@BookingFailure
Feature: This is the test suite for Booking Api failure scenarios

  Scenario: BookingFailure_CreateBookingFailure_TS01
  Description: Test failure scenarios of creating a booking
    Given I want to build the request with body
    When I submit the "POST" request
    Then The status code should be 500

  Scenario: BookingFailure_GetBookingFailureScenario_TS02
  Description: Test failure scenarios of getting a booking
    Given I want to build the request
    When I submit the "GET" request
    Then The status code should be 404

  Scenario: BookingFailure_UpdateBookingFailureScenario_TS03
  Description: Test failure scenarios of updating a booking
    Given I want to build the request with body
    When I submit the "PUT" request
    Then  The status code should be 403

  Scenario: BookingFailure_DeleteBookingFailureScenario_TS03
  Description: Test failure scenarios of deleting a booking
    Given I want to build the request
    When I submit the "DELETE" request
    Then  The status code should be 403