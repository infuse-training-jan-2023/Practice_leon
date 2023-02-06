

Feature: Get item
    As a user i can get a todo item

    Scenario: Get item
        When I search for a item
        Then I should get he item
        Then The api status code should be 200
        Then The api Response type should be json