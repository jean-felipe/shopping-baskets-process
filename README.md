## Sales input process - Assessment

This project can be executed by simply typing on terminal: `ruby main.rb`
It will execute the process, you should insert the input following this pattern: `quantity product name at price`
Examples:
- 1 imported bottle of perfume at 27.99
- 1 bottle of perfume at 18.99

## Problem Statement

This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.
Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

## Testing

This repo includes RSpec tests, you should `bundle install` and than `bundle exec rspec` to the first test case it will require input, follow the same pattern described above.
