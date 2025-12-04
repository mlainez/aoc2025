Feature: Remove forklift accessible TP

  Scenario Outline: TP roll removal depends on neighbor count
    Given a TP roll with <neighbors> neighbor(s) TP roll
    When I try to remove it with my forklift
    Then the TP roll <expected>

    Examples:
      | neighbors | expected      |
      | 1         | is removed    |
      | 2         | is removed    |
      | 3         | is removed    |
      | 4         | remains       |
      | 5         | remains       |
      | 6         | remains       |
      | 7         | remains       |
      | 8         | remains       |

  Scenario: Smoke test
    Given the following warehouse configuration:
      """
      ..@@.@@@@.
      @@@.@.@.@@
      @@@@@.@.@@
      @.@@@@..@.
      @@.@@@@.@@
      .@@@@@@@.@
      .@.@.@.@@@
      @.@@@.@@@@
      .@@@@@@@@.
      @.@.@@@.@.
      """
    When I scan it to see which ones I can lift
    Then 13 rolls can be removed