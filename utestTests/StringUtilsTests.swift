//
//  StringUtilsTests.swift
//  utestTests
//
//  Created by José Alves da Cunha on 24/02/21.
//

import XCTest
@testable import utest

class StringUtilsTests: XCTestCase {

    func testIsValidEmail() {
        let email = "teste"
        let value = email.isValidEmail()
        
        XCTAssertFalse(value, "nao é email valido")
    }
    
    func testRemoveWhiteSpace() {
        let text = "ola mundo"
        let newText = text.removeWhiteSpace()
        
        XCTAssert(newText == "olamundo", "Nao removeu o espaço")
        
    }
    
    func testReplace() {
        
        let text = "Swift"
        let newText = text.replace(string: "S", replacement: "D")
        let newText2 = newText.replace(string: "t", replacement: "x")
        
        XCTAssert(newText == "Dwift", "texto foi mudado")
        XCTAssert(newText2 == "Dwifx", "texto foi mudado")
    }

    
}
