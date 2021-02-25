//
//  AccountViewControllerSpec.swift
//  utestTests
//
//  Created by José Alves da Cunha on 25/02/21.
//

import Quick
import Nimble
@testable import utest

class AccountViewModelMock: AccountViewModelProtocol {
    var instructionText: String { return "" }
    
    var loginButtonHasBeenCalled = false
    
    func loginButtonTapped() {
        loginButtonHasBeenCalled = true
    }
    
    func shouldRequestLocation(showAlert: () -> (), askUserPermission: () -> (), completion: () -> ()) {}
    
    
}

class AccountViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("AccountViewController") {
            var sut: AccountViewController!
            var sutMock: AccountViewModelMock!
            beforeEach {
                sutMock = AccountViewModelMock()
                sut = AccountViewController(nibName: "AccountViewController", bundle: nil)
                sut.viewModel = sutMock
            }
            context("Actions") {
                it("loginButtonTap") {
                    sut.loginButtonAction(UIButton())
                    expect(sutMock.loginButtonHasBeenCalled).to(beTrue())
                }
            }
        }
    }
}
