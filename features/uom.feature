Feature: Units of Measure

  In order to purchase bulk items along with non-bulk items
  As a customer I should be able to order bulk items by decimal weight
  
  Scenario Outline: Customer selects weight and adds product to cart
    Given I am on a product page or taxon page containing a product or products with a UOM of "LB"
    And I have <ITEMS> in my cart
    Then for a product with a UOM of "LB", I should see "Weight in lbs" next to the quantity input in the add to cart form
    When I enter a floating point value into the quantity input and press Add to cart
    Then the product should be added to my cart
    And I should have <NEWITEMS> items in my cart
    
    Examples:
    | ITEMS | NEWITEMS |
    | 0     | 1        |
    | 1     | 2        |
    | 2     | 3        |
    
  Scenario Outline: Customer views cart
    Given I am viewing my cart
    And there is a product in my cart that has a UOM of <UOM>
    And the line item has a quantity of <QTY>
    And the line item has a price of <PRICE>
    Then under the Qty column, it should read <QTY> lbs
    And under the Total column, it should contain <TOTAL>
    
    Examples:
    | UOM | PRICE | QTY | TOTAL |
    | LB  | 1.00  | 1.5 | 1.5   |
    | LB  | 2.29  | 2.5 | 4.58  |
    | EA  | 12.57 | 3   | 37.71 |
  
  Scenario Outline: Admin views order details
    Given I am logged in as an admin
    And I am viewing an order with a product that has a UOM of <UOM>
    And the line item has a quantity of <QTY>
    And the line item has a price of <PRICE>
    Then under Qty column, it should read <QTY> lbs
    And under the Total column it should read <TOTAL>
    
    Examples:
    | UOM | PRICE | QTY | TOTAL |
    | LB  | 1.00  | 1.5 | 1.5   |
    | LB  | 2.29  | 2.5 | 4.58  |
    | EA  | 12.57 | 3   | 37.71 |
    
  Scenario Outline: Picker picks a product (perhaps a peck of pickled peppers)
    Given a picker has an order sheet with a bulk product
    And the product has a UOM of <UOM>
    And the price is <PRICE>
    And the picker picks <PICKED> <UOM>
    And the picker adjusts the quantity of the line item in the order admin
    And the picker presses the "recalculate order total" button
    Then the total price of the line item in the cart should be <TOTAL>
    And the Order Total should be calculated
    
    Examples:
    | UOM | PRICE | PICKED | TOTAL |
    | LB  | 1.58  | 1.26   | 1.99  |
    | LB  | 12.29 | 3.76   | 46.21 |
    | EA  | 7.29  | 1      | 7.29  |
    | EA  | 11.99 | 5      | 59.95 |
    