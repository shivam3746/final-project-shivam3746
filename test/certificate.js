const Certificate = artifacts.require("./Certificate.sol");
const assert = require('assert');
let contractInstance

contract ('Certificate', (accounts) => {
  beforeEach(async () => {
     contractInstance= await Certificate.deployed()
  })

  it('should add value to the name', async ()=> {

    await contractInstance.setHolder("0x00000000000000000000000000000000","Jack",1)

    assert.equal("0x00000000000000000000000000000000","Address not stored")


  })

})
