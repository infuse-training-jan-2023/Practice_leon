

Feature: add item
    As a user i can add a item

    Scenario: add item
        When I add new item
        Then I should get item details that was added
        Then The api status code should be 201
        Then The api Response type should be json