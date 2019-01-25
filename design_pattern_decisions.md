*Factory Contract*

Factory contract is used to create and deploy “child” contracts. Those child contracts can be referred to as “assets” which in the real life could represent, say, a house or a car.

The factory is used for storing the child contracts’ addresses so that they can be extracted whenever necessary. Why wouldn’t I just store them in my web app database you might ask? By storing them in the contract they remain in the blockchain and they are pretty much safe there, while data corruption in your database might wipe the asset contracts’ addresses which will lead to losing references to those contracts. Also, you must keep track of all newly created contracts and update your database.

A common use case for the Factory contract is selling assets and keeping track of those assets (eg. who is the owner). To sell an asset you add the payable modifier to the functions responsible for deploying the assets.

This pattern seems suitable for my certificate issuing dapp as it has to keep the track of all the certificates it will issue just like this factory contract keeps track of its issued assets.
