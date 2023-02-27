

Feature: update item
    As a user i can update a item

    Scenario: update item
        When I update item
        Then I should get item updated confirmation message
        Then The api status code should be 201
        Then The api Response type should be json