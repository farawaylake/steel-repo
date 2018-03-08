Feature: Test

  Scenario Outline: Test

    When I sign in to the trello home page
    And I navigate to the "<board_name>" board
    And I add the "<card_name>" card to the "<list_name>" list
    And I update the "<card_name>" card due date to "<due_date_from_today>" days from today
    Then the "<card_name>" card's calendar should show "<due_date_from_today>" days from today

    Examples:
      |board_name|list_name|card_name|due_date_from_today|
      |Test Board|test-list|test-card|55                 |