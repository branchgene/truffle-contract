var HashBranchPatientConsent = artifacts.require("./HashBranchPatientConsent.sol");

module.exports = function(deployer) {
  deployer.deploy(HashBranchPatientConsent);
};
