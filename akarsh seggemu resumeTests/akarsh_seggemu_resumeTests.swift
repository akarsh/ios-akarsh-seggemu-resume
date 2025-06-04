//
//  akarsh_seggemu_resumeTests.swift
//  akarsh seggemu resumeTests
//
//  Created by Akarsh Seggemu on 23.01.19.
//  Copyright © 2019 Akarsh Seggemu. All rights reserved.
//

import XCTest

@testable import akarsh_seggemu_resume

class akarsh_seggemu_resumeTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testResumeDecoding() throws {
        let json = """
            {
                "basics": {
                    "name": "Akarsh Seggemu",
                    "label": "iOS Developer",
                    "picture": "https://example.com/pic.jpg",
                    "email": "akarsh@example.com",
                    "phone": "+1234567890",
                    "website": "https://akarsh.dev",
                    "summary": "Experienced iOS developer.",
                    "location": {
                        "address": "123 Main St",
                        "postalCode": "12345",
                        "city": "Bangalore",
                        "countryCode": "IN",
                        "region": "Karnataka"
                    },
                    "profiles": [
                        {
                            "network": "LinkedIn",
                            "username": "akarsh",
                            "url": "https://linkedin.com/in/akarsh"
                        }
                    ],
                    "info": {
                        "nationality": "Indian",
                        "workPermit": "IN",
                        "dateOfBirth": "1990-01-01",
                        "placeOfBirth": "Bangalore"
                    }
                },
                "work": [],
                "volunteer": [],
                "education": [],
                "awards": [],
                "publications": [],
                "skills": [],
                "languages": [],
                "interests": [],
                "references": []
            }
            """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let resume = try decoder.decode(Resume.self, from: json)
        XCTAssertEqual(resume.basics.name, "Akarsh Seggemu")
        XCTAssertEqual(resume.basics.location.city, "Bangalore")
        XCTAssertEqual(resume.basics.profiles.first?.network, "LinkedIn")
        XCTAssertEqual(resume.basics.info.nationality, "Indian")
    }

    func testResumeEncoding() throws {
        let basicsObj = basics(
            name: "Akarsh Seggemu",
            label: "iOS Developer",
            picture: "https://example.com/pic.jpg",
            email: "akarsh@example.com",
            phone: "+1234567890",
            website: "https://akarsh.dev",
            summary: "Experienced iOS developer.",
            location: location(
                address: "123 Main St",
                postalCode: "12345",
                city: "Bangalore",
                countryCode: "IN",
                region: "Karnataka"
            ),
            profiles: [
                profiles(
                    network: "LinkedIn",
                    username: "akarsh",
                    url: "https://linkedin.com/in/akarsh"
                )
            ],
            info: info(
                nationality: "Indian",
                workPermit: "IN",
                dateOfBirth: "1990-01-01",
                placeOfBirth: "Bangalore"
            )
        )
        let resume = Resume(
            basics: basicsObj,
            work: [],
            volunteer: [],
            education: [],
            awards: [],
            publications: [],
            skills: [],
            languages: [],
            interests: [],
            references: []
        )
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(resume)
        let jsonString = String(data: data, encoding: .utf8)
        XCTAssertTrue(jsonString?.contains("\"name\" : \"Akarsh Seggemu\"") ?? false)
    }

    func testResumeDecodingPerformance() {
        // Create a large JSON string for performance testing
        let largeProfiles = (0..<1000).map { i in
            """
            {
            "network": "Network\(i)",
            "username": "user\(i)",
            "url": "https://example.com/user\(i)"
            }
            """
        }.joined(separator: ",")
        let largeJson = """
            {
                "basics": {
                "name": "Akarsh Seggemu",
                "label": "iOS Developer",
                "picture": "https://example.com/pic.jpg",
                "email": "akarsh@example.com",
                "phone": "+1234567890",
                "website": "https://akarsh.dev",
                "summary": "Experienced iOS developer.",
                "location": {
                    "address": "123 Main St",
                    "postalCode": "12345",
                    "city": "Bangalore",
                    "countryCode": "IN",
                    "region": "Karnataka"
                },
                "profiles": [\(largeProfiles)],
                "info": {
                    "nationality": "Indian",
                    "workPermit": "IN",
                    "dateOfBirth": "1990-01-01",
                    "placeOfBirth": "Bangalore"
                }
                },
                "work": [],
                "volunteer": [],
                "education": [],
                "awards": [],
                "publications": [],
                "skills": [],
                "languages": [],
                "interests": [],
                "references": []
            }
            """.data(using: .utf8)!

        self.measure {
            let decoder = JSONDecoder()
            do {
                let resume = try decoder.decode(Resume.self, from: largeJson)
                XCTAssertEqual(resume.basics.profiles.count, 1000)
            } catch {
                XCTFail("Decoding failed: \(error)")
            }
        }
    }

    func testResumeEncodingDecodingSymmetry() throws {
        let basicsObj = basics(
            name: "Akarsh Seggemu",
            label: "iOS Developer",
            picture: "https://example.com/pic.jpg",
            email: "akarsh@example.com",
            phone: "+1234567890",
            website: "https://akarsh.dev",
            summary: "Experienced iOS developer.",
            location: location(
                address: "123 Main St",
                postalCode: "12345",
                city: "Bangalore",
                countryCode: "IN",
                region: "Karnataka"
            ),
            profiles: [
                profiles(
                    network: "LinkedIn",
                    username: "akarsh",
                    url: "https://linkedin.com/in/akarsh"
                )
            ],
            info: info(
                nationality: "Indian",
                workPermit: "IN",
                dateOfBirth: "1990-01-01",
                placeOfBirth: "Bangalore"
            )
        )
        let resume = Resume(
            basics: basicsObj,
            work: [],
            volunteer: [],
            education: [],
            awards: [],
            publications: [],
            skills: [],
            languages: [],
            interests: [],
            references: []
        )
        let encoder = JSONEncoder()
        let data = try encoder.encode(resume)
        let decoder = JSONDecoder()
        let decodedResume = try decoder.decode(Resume.self, from: data)
        XCTAssertEqual(decodedResume.basics.name, resume.basics.name)
        XCTAssertEqual(decodedResume.basics.location.city, resume.basics.location.city)
        XCTAssertEqual(
            decodedResume.basics.profiles.first?.network, resume.basics.profiles.first?.network)
    }

    func testResumeDecodingWithMissingFields() throws {
        // All fields present but empty strings and empty arrays
        let json = """
            {
            "basics": {
                "name": "",
                "label": "",
                "picture": "",
                "email": "",
                "phone": "",
                "website": "",
                "summary": "",
                "location": {
                "address": "",
                "postalCode": "",
                "city": "",
                "countryCode": "",
                "region": ""
                },
                "profiles": [],
                "info": {
                "nationality": "",
                "workPermit": "",
                "dateOfBirth": "",
                "placeOfBirth": ""
                }
            },
            "work": [],
            "volunteer": [],
            "education": [],
            "awards": [],
            "publications": [],
            "skills": [],
            "languages": [],
            "interests": [],
            "references": []
            }
            """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let resume = try decoder.decode(Resume.self, from: json)
        XCTAssertEqual(resume.basics.name, "")
        XCTAssertTrue(resume.basics.profiles.isEmpty)
    }

    func testResumeDecodingInvalidJSON() {
        let invalidJson = """
            {
            "basics": {
                "name": "Akarsh Seggemu"
                // missing comma and other required fields
            }
            }
            """.data(using: .utf8)!

        let decoder = JSONDecoder()
        XCTAssertThrowsError(try decoder.decode(Resume.self, from: invalidJson))
    }
}
