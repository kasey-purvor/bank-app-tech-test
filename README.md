# Command Line Bank App - Mock Tech Test   

## Description 
**This project was performed as a mock tech test for a job interview.
The objective was to demonstrate ruby skills,object orientated design, TDD/BDD amongst other coding skills. The program is run in IRB**. 

## Requirements
You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
## Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance  \
14/01/2012 || || 500.00 || 2500.00  \
13/01/2012 || 2000.00 || || 3000.00  \
10/01/2012 || 1000.00 || || 1000.00  

### Planning 
For this task I allocated myself 48 hours. Therefore I decided to avoid making something with a high degree of complexity. While this was tempting it would miss the point of the exercise. Instead I opted to create an MVP (minimum viable product) and build up from there if I had time. As it turned out I did not have time to create a fully functioning web app!    

 ### Class Diagram 
| Account      | Transaction    |
| -------------|:----------:|
| Attributes:    | Attributes:
| @Balance int   |@amount int  |
| @name "string" | @date_time  |
|@transactions [array]|@post_transaction_balance|
| ||
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
4.  Create an 'account' object. Name is optional   `$account = Account.new("your name here")`
![program_loaded](https://user-images.githubusercontent.com/67878899/116536995-8eaeef00-a8dd-11eb-86a2-3c0dcfdf7443.png)

5. Commands Include (the '; nil' prevents IRB from printing the whole object which is messy):   
  1. Deposit `$account.deposit(number); nil`
  ![successful_deposit](https://user-images.githubusercontent.com/67878899/116537035-9a021a80-a8dd-11eb-82ec-2fd9544ccfd7.png)
  1. Withdraw `$account.withdraw(number); nil`
  ![successful_withdrawal](https://user-images.githubusercontent.com/67878899/116537069-a6867300-a8dd-11eb-8c27-e340b704616c.png)
  1. Print Statement `$account.statement; nil`
  ![statement](https://user-images.githubusercontent.com/67878899/116537510-3f1cf300-a8de-11eb-9bf3-3a63f6f2c556.png)
  
2. Other Features Include:  
    1. Overdraft protection. Will not allow user to have negative balance
    ![prevent_overdraw](https://user-images.githubusercontent.com/67878899/116537565-4f34d280-a8de-11eb-8e03-246d4686b729.png)
    1. 8 figure transaction maximum. (before collumns become misaligned on statements) 
    ![8_figure_alignment](https://user-images.githubusercontent.com/67878899/116537758-899e6f80-a8de-11eb-9f7c-5b70954ab578.png)
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





