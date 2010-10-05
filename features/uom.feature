Feature: Partial Units

  In order to purchase bulk items,
  As a customer, I should be able to order bulk items by weight
  
  Scenario: Customer selects weight and adds product to cart
    Given I am on a product page or taxon page containing a product or products with a UOM of "LB"
    Then for a product with a UOM of "LB", I should see "Weight in lbs" next to the quantity input in the add to cart form
    When I enter "1.5" into the quantity input and press Add to cart
    Then the product should be added to my cart
    
  Scenario: Customer views cart
    Given I am viewing my cart
    And there is a product in my cart that has a UOM of "LB"
    And the line item has a quantity of "1.5"
    Then under the Qty column, it should read "1.5 lbs"
  
  Scenario: Admin views order details
    Given I am logged in as an admin
    And I am viewing an order with a product that has a UOM of "LB"
    And the line item has a quantity of "1.5"
    And the line item has a price of "1.00"
    Then under Qty column, it should read "1.5 lbs"
    And under the Total column it should read "1.5"
    
  Scenario Outline: Picker picks product (perhaps a peck of pickled peppers)
    Given a picker has an order sheet with a bulk product
    And the product has a UOM of <UOM>
    And the price is <PRICE>
    And the picker picks <PICKED> <UOM>
    And the picker adjusts the quantity in the order admin
    And the picker presses the "recalculate order total" button
    Then the total price of the product line item in the cart should be <TOTAL>
    
    Examples:
    | UOM | PRICE | PICKED | TOTAL |
    | LB  | 1.58  | 1.26   | 1.99  |
    | LB  | 12.29 | 3.76   | 46.21 |
    | EA  | 7.29  | 1      | 7.29  |
    | EA  | 11.99 | 5      | 59.95 |
    
     