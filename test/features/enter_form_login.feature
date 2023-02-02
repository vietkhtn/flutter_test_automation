Feature: Enter Form Login
  Enter Form Login

  @scenario_outline
  Scenario Outline: Enter Login Form
    When I enter LoginForm: account: "<account>", "<password>"
    Then I expect login "<result>"

    Examples:
      | account | password      | result  |
      |         |               | Not Empty Fields |
      |         | Password123   | Not Empty Account |
      | root123 |               | Not Empty Password |   
      | root123 | Password123   | Success |
      | root123 | Password123@@ | Wrong Password |
      | root123 | Password123   | Failed |
     