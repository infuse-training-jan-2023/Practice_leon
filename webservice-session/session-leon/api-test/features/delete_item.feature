

Feature: delete item
    As a user i can delete a item

    Scenario: delete item
        When I delete item
        Then I should get item deleted confirmation message
        Then The api status code should be 200
        Then The api Response type should be json