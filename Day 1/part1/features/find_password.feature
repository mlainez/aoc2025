
Feature: Find the safe password

    Scenario: Multiple dial rotations
        Given the dial is positioned at 50
        When I turn the dial left by a distance of 68
        And I turn the dial left by a distance of 30
        And I turn the dial right by a distance of 48
        And I turn the dial left by a distance of 5
        And I turn the dial right by a distance of 60
        And I turn the dial left by a distance of 55
        And I turn the dial left by a distance of 1
        And I turn the dial left by a distance of 99
        And I turn the dial right by a distance of 14
        And I turn the dial left by a distance of 82
        Then the password should be 3