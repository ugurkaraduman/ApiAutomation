@get

Feature: Search Film

  Background:
    * url baseUrl

  Scenario Outline: Post Scenarios with examples

    Given params {s: '<title>' }
    When method get
    * print response
    * def imdbid = $response.Search[?(@.Title== "<filmName>")].imdbID
    * print imdbid
    And params {i: #(imdbid)}
    When method get
    Then status 200
    * print response
    And match response.Title == "<filmName>"
    And match response.Year == "2001"
    And match response.Released == "16 Nov 2001"

    Examples:

      | title        | filmName                              |
      | Harry Potter | Harry Potter and the Sorcerer's Stone |
