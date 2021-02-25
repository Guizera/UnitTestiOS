//
//  StringUtilsSpec.swift
//  utestTests
//
//  Created by José Alves da Cunha on 25/02/21.
//

import Quick
import Nimble
@testable import utest

class StringUtilsSpec: QuickSpec {
    
    override func spec() {
        describe("StringUtils") {
            context("Is Valid Email") {
                it("Valid Email") {
                    let email = "teste@email.com"
                    let isValidEmail = email.isValidEmail()
                    expect(isValidEmail).to(be(true))
                }
                it("Invalid Email") {
                    let email = "teste"
                    let isValidEmail = email.isValidEmail()
                    expect(isValidEmail).to(be(false))
                }
            }
            context("remove WhiteSpace") {
                it("white spece removed") {
                    let text = "ola mundo"
                    let newText = text.removeWhiteSpace()
                    expect(newText).to(be("olamundo"))
                }
            }
            context("Replace Text") {
                it("text was replaced") {
                    let text = "Swift"
                    let newText = text.replace(string: "S", replacement: "D")
                    expect(newText).to(be("Dwift"))
                }
            }
        }
    }

}
