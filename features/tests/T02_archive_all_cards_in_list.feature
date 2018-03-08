Feature: Test

  Scenario Outline: Test

    When I sign in to the trello home page
    And I navigate to the "<board_name>" board
    And I add the "<card_name>" card to the "<list_name>" list
    And I add the "<card_name>" card to the "<list_name>" list
    And I add the "<card_name>" card to the "<list_name>" list
    And I archive all cards in the "<list_name>" list

    Examples:
      |board_name|list_name|card_name|
      |Test Board|test-list|test-card|