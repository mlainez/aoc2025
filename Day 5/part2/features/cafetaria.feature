Feature: Cafetaria inventory system

Scenario: Idendify fresh products
    Given the following inventory database:
        """
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
        """
    Then 5 should be marked as fresh
    And 11 should be marked as fresh
    And 17 should be marked as fresh
    And 1 should not be marked as fresh
    And 8 should not be marked as fresh
    And 32 should not be marked as fresh

Scenario: Identify IDs considered fresh from ranges
    Given the following inventory database:
        """
        3-5
        10-14
        16-20
        12-18
        """
    Then 14 ingredient IDs should be considered fresh
