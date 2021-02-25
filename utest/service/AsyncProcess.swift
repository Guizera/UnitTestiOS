//
//  AsyncProcess.swift
//  utest
//
//  Created by José Alves da Cunha on 25/02/21.
//

import UIKit

class AsyncProcess {
    
    var name = ""
    
    func callTheResultsInSideEffects() {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.1) {
            [weak self] in
            self?.name = "Teste"
        }
    }
}
