
Feature: Find the safe password

    Scenario: One dial rotation that points to zero once
        Given the dial is positioned at 50
        When I turn the dial left by a distance of 82
        Then the password should be 1

    Scenario: Multiple dial rotations that point to zero 3 times
        Given the dial is positioned at 50
        When I turn the dial left by a distance of 68
        And I turn the dial left by a distance of 30
        And I turn the dial right by a distance of 48
        And I turn the dial left by a distance of 5
        And I turn the dial right by a distance of 60
        Then the password should be 3

    Scenario: Multiple dial rotations that point to zero 6 times
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
        Then the password should be 6

    Scenario: Very long rotation
        Given the dial is positioned at 50
        When I turn the dial right by a distance of 1000
        Then the password should be 10