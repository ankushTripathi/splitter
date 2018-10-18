# Splitter

a smart contract which splits the sent amount by alice in half and transfers it to bob and carol.

## functions
1. **Constructor<address alice,address bob,address carol>**  sets the addresses of alice,bob,carol if available.
 taken care of in initial_migration.js 
2. **SetUsers<address alice,address bob, address carol>**   explicitly set/change address of the users.
3. **getContractBalance** returns the balance of contract
4. **getUserBalances** returns the balance of user accounts
5. **split** divides the ether sent by alice into 2 and sends it to bob and carol
 
## To Do
1. testing
2. Web app