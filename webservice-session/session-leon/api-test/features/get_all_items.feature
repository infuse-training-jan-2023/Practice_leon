

Feature: Get all items
    As a user i can get all the todo items

    Scenario: Get all items
        When I search for all items
        Then I should get all items present
        Then The api status code should be 200
        Then The api Response type should be json