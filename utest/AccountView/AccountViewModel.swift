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
    
}

class AccountViewModel: AccountViewModelProtocol {
    
    private let shouldUseLocation: Bool
    init(shouldUseLocation: Bool) {
        self.shouldUseLocation = shouldUseLocation
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
