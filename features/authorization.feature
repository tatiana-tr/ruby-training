Feature: Visitor Sign in
  As a visitor
  I want to be able to sign in
  In order to become user

  Scenario: Visitor successfully sign in
    Given I visit Redmine homepage
    And I have preregistered user

     When I click 'login' button
      And I fill in login form
     Then I see that I become logged in user

  Scenario: Visitor successfully sign in
    Given I visit Redmine homepage

    When I click 'register' button
    And I fill in registration form
    Then I see that I become logged in user