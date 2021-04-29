# Command Line Bank App - Mock Tech Test   

## Description 
**This project was performed as a mock tech test for a job interview.
The objective was to demonstrate ruby skills,object orientated design, TDD/BDD amongst other coding skills. The program is run in IRB**. 

### Planning 
For this task I allocated myself 48 hours. Therefore I decided to avoid making something with a high degree of complexity. While this was tempting it would miss the point of the exercise. Instead I opted to create an MVP (minimum viable product) and build up from there if I had time. As it turned out I did not have time to create a fully functioning web app!    

 ### Class Diagram 
 | Account      | Transaction    |
| -------------|:----------:|
| Attributes:    | Attributes:
| @Balance int   |@amount int  |
| @name "string" | @date_time  |
|@transactions [array]|@post_transaction_balance|
| METHODS:| METHODS: |
|.withdraw(amount)|.amount_credit_or_debit|
|.deposit(amount) ||
|.statement||
|||

### Running The Program 

1. $`git clone https://github.com/kasey-purvor/bank-app_Tech-test.git`
1. `$cd bank-app-tech-test`
1. `$bundle install`
1. $` irb -r './lib/account.rb'` 
2. ![alt text](https://github.com/[kasey-purvor]/[bank-app-tech-test]/blob/[master]/program_loaded.png?raw=true)
3. ![Alt text](./images/program_loaded.png?raw=true "Title")

4.  Create an 'account' object. Name is optional   `$account = Account.new("your name here")`
5. Commands Include (the '; nil' prevents IRB from printing the whole object which is messy):   
  1. Deposit `$account.deposit(number); nil`
  1. Withdraw `$account.withdraw(number); nil`
  1. Print Statement `$account.statement; nil`
  
2. Other Features Include:  
    1. Overdraft protection. Will not allow user to have negative balance
    1. 8 figure transaction maximum. (before columns become misaligned on statements) 
    1. Date and time stamps for each transaction 

3. Running Tests:
    1. `$rspec -fd` provides insight into the tests and their coverage (%100). 
  #### Reflection
I ended up adhering to my plan very well, almost mirroring my class diagram exactly. If I were to do the problem again I would focus on several things where attention was needed.
1. **Bank Statement Formatting**. .  
_While the bank statement columns do align correctly under most normal usage conditions. There are edge cases that cause them to misalign, such as when introducing decimals or transacting amounts with more than 8 figures._
2. **Bank Statement Formatting Tests**    
_Similarly to point 1, I found it difficult to test for column alignment. Opting to use regular expressions which I am out of practice with. I would spend more time on this if possible_
3. **Object Mocking**  
_Owing to the simplicity of the project, initially I did not make use of RSpec mocking abilities. While they were not strictly necessary this came back to hinder me as I needed time and date methods to provide a standard output when called, so that my tests could be more specific. This was a problem for me when I wanted to test for statement format, as a predictable time would have meant I could eliminate my use of regex in my tests and make them more specific_
4. **Rspec matcher knowledge**  
_In one test I wanted to simply check the statement included the transaction values , ignoring format. However the statement method did not return the statement, instead it prints it. This made it tricky to use `'include'` in my test as rsped does not have an 'include' matcher for STDout outputs. I got round this issue by including a `return statement` at the end of the method (a bit of a hack)_  


## Tech Used: 

1. `ruby version 2.7.2`
2. `rspec`
3. `rubocop`
4. `simplecov`





