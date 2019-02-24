pragma solidity >=0.4.22 <0.6.0;

contract HashBranchPatientConsent {
    uint8 private consentCount;
    mapping (address => mapping( uint => uint) ) private consentIds;
    address public owner;

    event LogConsentEnabled(uint consentId);

    event LogConsentDisabled(uint consentId);

    constructor() public {
        owner = msg.sender;
        consentCount = 0;
    }

    function enableConsent(address patient, uint consentId) public returns (uint) {
        consentIds[patient][consentId] = 1;
        consentCount++;

        emit LogConsentEnabled(consentId);

        return consentIds[patient][consentId];
    }

    function disableConsent(address patient, uint consentId) public returns (uint) {
        consentIds[patient][consentId] = 0;
        consentCount++;

        emit LogConsentDisabled(consentId);

        return consentIds[patient][consentId];
    }

    function hasConsent(address patient, uint consentId) public view returns (uint) {
        return consentIds[patient][consentId];
    }
}