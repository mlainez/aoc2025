
Feature: Turn safe dial

    Scenario Outline: Safe dial rotations
        Given the dial is positioned at <start_position>
        When I turn the dial <direction> by a distance of <distance>
        Then I should end up at the position <end_position>

        Examples:
        | start_position | direction | distance | end_position |
        | 50             | left         | 68       | 82           |
        | 82             | left         | 30       | 52           |
        | 52             | right        | 48       | 0            |
        | 0              | left         | 5        | 95           |
        | 95             | right        | 60       | 55           |
        | 55             | left         | 55       | 0            |
        | 0              | left         | 1        | 99           |
        | 99             | left         | 99       | 0            |
        | 0              | right        | 14       | 14           |
        | 14             | left         | 82       | 32           |