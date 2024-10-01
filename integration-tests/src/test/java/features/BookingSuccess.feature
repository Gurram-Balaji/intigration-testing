@BookingSuccess
Feature: This is the test suite foe booking Api success scenarios

  Scenario: BookingSuccess_CreateBooking_TS01
  Description: Scenario is for creating a new booking
    Given I want to build the request with body
    When I submit the "POST" request
    Then The status code should be 200
    And The response body should be as expected

  Scenario: BookingSuccess_GetBookingDetails_TS02
  Description: Scenario is for creating a get booking
    Given I want to build the request
     When I submit the "GET" request
     Then The status code should be 200
     And The response body should be as expected

  Scenario: BookingSuccess_UpdateBooking_TS03
  Description: Scenario is for creating a update booking
    Given I want to build the request with body
      When I submit the "PUT" request
      Then The status code should be 200
      And The response body should be as expected

  Scenario: BookingSuccess_DeleteBooking_TS04
  Description: Scenario is for creating a delete booking
    Given I want to build the request
       When I submit the "DELETE" request
       Then The status code should be 201
