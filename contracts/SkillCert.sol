// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SkillCert {
    address public admin;

    struct Certificate {
        address student;
        string studentName;
        string course;
        string cid;        // IPFS CID (or any external reference)
        uint256 issuedAt;
        bool revoked;
    }

    // certId => Certificate
    mapping(bytes32 => Certificate) private certificates;

    event CertificateIssued(
        bytes32 indexed certId,
        address indexed student,
        string cid,
        string course,
        string studentName,
        uint256 issuedAt
    );
    event CertificateRevoked(bytes32 indexed certId, address indexed student);
    event AdminChanged(address indexed oldAdmin, address indexed newAdmin);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin");
        _;
    }

    constructor() {
        admin = msg.sender;
        emit AdminChanged(address(0), msg.sender);
    }

    function changeAdmin(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "zero addr");
        emit AdminChanged(admin, newAdmin);
        admin = newAdmin;
    }

    function computeCertId(address student, string memory cid) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(student, cid));
    }

    function issueCertificate(
        address student,
        string memory studentName,
        string memory course,
        string memory cid
    ) external onlyAdmin {
        bytes32 certId = computeCertId(student, cid);
        require(certificates[certId].issuedAt == 0, "Already issued");
        certificates[certId] = Certificate({
            student: student,
            studentName: studentName,
            course: course,
            cid: cid,
            issuedAt: block.timestamp,
            revoked: false
        });
        emit CertificateIssued(certId, student, cid, course, studentName, block.timestamp);
    }

    function revokeCertificate(bytes32 certId) external onlyAdmin {
        Certificate storage c = certificates[certId];
        require(c.issuedAt != 0, "Not found");
        require(!c.revoked, "Already revoked");
        c.revoked = true;
        emit CertificateRevoked(certId, c.student);
    }

    function getCertificate(bytes32 certId) external view returns (Certificate memory) {
        Certificate memory c = certificates[certId];
        require(c.issuedAt != 0, "Not found");
        return c;
    }

    function verify(address student, string memory cid) external view returns (bool valid, bytes32 certId, Certificate memory cert) {
        certId = computeCertId(student, cid);
        cert = certificates[certId];
        valid = (cert.issuedAt != 0 && !cert.revoked);
    }
}