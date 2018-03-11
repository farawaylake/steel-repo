Feature: tc04_edit_due_date_via_quick

  Scenario Outline: tc04_edit_due_date_via_quick

    When I sign in to the trello home page
    And I navigate to the "<board_name>" board
    And I add the "<card_name>" card to the "<list_name>" list
    And I update the "<card_name>" card due date to "<days_until_due>" days from today
    Then the "<card_name>" card's calendar should show "<days_until_due>" days from today

    Examples:
      |board_name|list_name|card_name|days_until_due|
      |Test Board|test-list|test-card| 55           |