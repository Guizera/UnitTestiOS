//
//  AccountViewModel.swift
//  utest
//
//  Created by José Alves da Cunha on 25/02/21.
//

import UIKit

protocol AccountViewModelProtocol {
    func loginButtonTapped()
    func shouldRequestLocation(showAlert:() -> (),
                               askUserPermission: () -> (),
                               completion: () -> ())
    
    var instructionText: String { get }
    
}

class AccountViewModel {
    
    private let shouldUseLocation: Bool
    private let model: AccountModel
    
    init(shouldUseLocation: Bool, model: AccountModel) {
        self.shouldUseLocation = shouldUseLocation
        self.model = model
    }
}

extension AccountViewModel: AccountViewModelProtocol {
    
    
    var instructionText: String {
        if shouldUseLocation {
            return model.instruction + " com localizaçao"
        }
        return model.instruction
    }
    
    func loginButtonTapped() {
        print("login realizado com sucesso")
    }
    
    func shouldRequestLocation(showAlert:() -> (),
                               askUserPermission: () -> (),
                               completion: () -> ()) {
        if shouldUseLocation {
            askUserPermission()
            completion()
            return
        }
        showAlert()
        completion()
    }
}
