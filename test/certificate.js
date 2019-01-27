var Certificate = artifacts.require("./Certificate.sol")

contract('Certificate', (accounts) => {

  let instance
  let owner = accounts[0]
  let account = accounts[1]

  beforeEach(async () => {
    instance = await Certificate.deployed()
  })

  it("should check restriction", async () => {
    try {
      let result = await instance.restrictedFunction.call({from: account})
      assert.equal(result.toString(), owner)
    } catch (e) {
      console.log(`${account} is not owner`)
    }
  })
})
