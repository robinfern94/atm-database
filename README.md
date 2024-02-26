## ATM Database SQL Project
This project was one that I did in my final year of undergrad in my Database Course. The purpose was to create a database that revolved around the basic features of an ATM such as depositing/withdrawing money, transferring funds, checking account balances, or making a payment towards a credit card. 

To start, database requirements needed to be defined such as registered users and accounts, along with their own unique rules (one account should have one unique email as it cannot be shared with someone else's account). This then got broken down into entities with attributes and keys. The important part here was defining which entity would be classified as a strong entity or a weak entity. In other words, is that item able to stand alone or is it relying on something else to exist? After each entity has been studied, we are now able to create an Entity Relationship Diagram (ERD) and Database Model so we can visually understand how everything is connected.

After the model, then came creating the actual database. This is where I got the most SQL practice. It was very intimidating at first but I got the hang of it quickly. Now that there was a database, we added practice data to each table.

The next task at hand was to connect the database with our discord bot. Once the bot and database were able to communicate, the discord bot would be able to receive commands from a user and reply with an answer corresponding to the database we've made. These commands were:
- For each region, find the total number of deposit transactions that deposited more than x, in between years y and z.
- Find all ATMS with a balance less than x and that has alerted the police y amount of times.

## Things I Learned
- The importance of each database requirement and how it relates to other data entities.
- Mapping out how each entity exists with one another before plugging anything in reduces the chance of error.
- Practiced SQL and a little bit of Python for the business rules.
