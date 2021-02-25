//
//  AsyncProcessSpec.swift
//  utestTests
//
//  Created by José Alves da Cunha on 25/02/21.
//

import Quick
import Nimble
@testable import utest

class AsyncProcessSpec: QuickSpec {
    
    override func spec() {
        describe("AsyncProcess") {
            context("callTheResultsInSideEffects") {
                it("Test") {
                    let asyncProcess = AsyncProcess()
                    asyncProcess.callTheResultsInSideEffects()
                    expect(asyncProcess.name).toEventually(equal("Teste"))
                }
            }
        }
    }
}
