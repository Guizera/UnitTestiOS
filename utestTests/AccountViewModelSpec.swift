//
//  AccountViewModelSpec.swift
//  utestTests
//
//  Created by José Alves da Cunha on 25/02/21.
//

import Quick
import Nimble
@testable import utest
class AccounViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("AccountViewModel") {
            
            //testting some viewModel using Quick and Nimble frameworks
            //in my viewmodel i have a func with return BOOL so in my tests i will make one test to return TRUE and other test to return FALSE
        
            var sut: AccountViewModel!
            
            context("Should Request Location") {
                var showAlert: Bool!
                var askUserLocation: Bool!
                var completion: Bool!
                
                beforeEach {
                    showAlert = false
                    askUserLocation = false
                    completion = false
                }
                
                it("user location true") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: ""))
            
                    sut.shouldRequestLocation(showAlert: { showAlert = true}, askUserPermission: { askUserLocation = true}, completion: {completion = true})
                    expect(showAlert).to(equal(false))
                    expect(askUserLocation).to(equal(true))
                    expect(completion).to(equal(true))
                    
                }
                it("user location false") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
        
                    sut.shouldRequestLocation(showAlert: { showAlert = true}, askUserPermission: { askUserLocation = true}, completion: {completion = true})
                    expect(showAlert).to(equal(true))
                    expect(askUserLocation).to(equal(false))
                    expect(completion).to(equal(true))
                    
                }
                it("Test login Button func") {
                    
                    //The Login Button Tapped func is a void func so that case i will make my result expect be a VOID
                    
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    expect(sut.loginButtonTapped()).to(beVoid())
                    
                }
            }
            context("AccountViewModelProtocol") {
                it("verify AccountViewModelProtocol") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    expect(sut).to(beAKindOf(AccountViewModelProtocol.self))
                }
            }
            context("Instruction text") {
                it("Verify that user is using Location") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: "Esta certo"))
                    expect(sut.instructionText).to(equal("Esta certo com localizaçao"))
                }
                it("Verify that user is not using Location") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: "Esta certo"))
                    expect(sut.instructionText).to(equal("Esta certo"))
                }
                
            }
        }
    }
}
