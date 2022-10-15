Feature: API Automated Testing Demo for weather forecast
  Description: Test response and get relative humidity


  Background:
    * call read('classpath:karate-config.js')
    * def apiDemoURL = baseUrl
    Given url apiDemoURL


  @Demo @ResponseChecking
  Scenario Outline: Test the request response status
    When method post
    Then status <statusCode>

    Examples:
      | statusCode |
      | 200        |

  @Demo @ResponseChecking
  Scenario Outline: Extract the relative humidity (e.g. 60 - 85%) for the day after tomorrow
    When method post
    Then status <statusCode>
    * def theDateAfterTmr = response.forecast_detail[1].forecast_date
    * def minRelativeHumidity = response.forecast_detail[1].min_rh
    * def maxRelativeHumidity = response.forecast_detail[1].max_rh
    * print 'Humidity for the day after tomorrow (', theDateAfterTmr, ') is: ', minRelativeHumidity, '% -', maxRelativeHumidity,'%'

    Examples:
      | statusCode |
      | 200        |
