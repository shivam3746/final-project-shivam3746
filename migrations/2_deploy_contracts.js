var CertificateIssuer = artifacts.require("./Certificate.sol");

module.exports = function(deployer) {
  deployer.deploy(CertificateIssuer);
};
