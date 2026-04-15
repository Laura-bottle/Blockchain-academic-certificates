// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AcademicCertificates {
    address public Owner;
    uint public CertificateCount;

    struct Certificate {
        uint ID;
        string StudentName;
        string InstitutionName;
        string Qualification;
        string IssueDate;
        bool IsValid;
    }

    mapping(uint => Certificate) public Certificates;

    event CertificateIssued(
        uint ID,
        string StudentName,
        string InstitutionName,
        string Qualification,
        string IssueDate
    );

    event CertificateRevoked(uint ID);

    modifier onlyOwner() {
        require(msg.sender == Owner, "Only the Institution can perform this action");
        _;
    }

    constructor() {
    Owner = msg.sender;
    }

    function IssueCertificate(
        string memory _StudentName,
        string memory _ID,
        string memory _InstitutionName,
        string memory _Qualification,
        string memory _IssueDate
    ) public onlyOwner {
        CertificateCount++;

        Certificates[CertificateCount] = Certificate(
            CertificateCount,
            _StudentName,
            _InstitutionName,
            _Qualification,
            _IssueDate,
            true
        );

        emit CertificateIssued(
            CertificateCount,
            _StudentName,
            _InstitutionName,
            _Qualification,
            _IssueDate
        );
    }

    function VerifyCertificate(uint _ID) public view returns (
        string memory StudentName,
        string memory InstitutionName,
        string memory Qualification,
        string memory IssueDate,
        bool IsValid
    ) {
        Certificate memory Cert = Certificates[_ID];
        return (
            Cert.StudentName,
            Cert.InstitutionName,
            Cert.Qualification,
            Cert.IssueDate,
            Cert.IsValid
        );
    }

    function RevokeCertificate(uint _ID) public onlyOwner {
        require(_ID > 0 && _ID <= CertificateCount, "Certificate does not exist");
        Certificates[_ID].IsValid = false;
        emit CertificateRevoked(_ID);
    }
}