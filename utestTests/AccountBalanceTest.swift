//
//  AccountBalanceTest.swift
//  utestTests
//
//  Created by José Alves da Cunha on 25/02/21.
//

import XCTest
@testable import utest

class AccountBalanceTest: XCTestCase {
    
    var account: AccountBalance?

    func testGetSpecialBalance100() {
        account = AccountBalance(balance: 99)
        let specialBalance = account?.getSpecialLimit()
        
        XCTAssertEqual(specialBalance, 109, "O saldo é menor que 100, deve retornar o saldo + 10")
        
    }
    func testGetSpecialBalance900() {
        account = AccountBalance(balance: 900)
        let specialBalance = account?.getSpecialLimit()
        
        XCTAssertEqual(specialBalance, 1900, "O saldo é maior que 500, deve retornar o saldo + 1000")
        
    }
    func testGetSpecialBalance400() {
        account = AccountBalance(balance: 400)
        let specialBalance = account?.getSpecialLimit()
        
        XCTAssertEqual(specialBalance, 400, "O saldo é menor que 500 e maior que 100, deve retornar o saldo")
        
    }

}
