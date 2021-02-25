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
    var status: String { get set }
    
}

class AccountViewModel {
    
    private let shouldUseLocation: Bool
    private let model: AccountModel
    private let provider: ProviderProtocol
    
    var status: String
    
    init(shouldUseLocation: Bool, model: AccountModel, provider: ProviderProtocol = Provider()) {
        self.shouldUseLocation = shouldUseLocation
        self.model = model
        self.provider = provider
        self.status = ""
    }
    func getData() {
        provider.getData { (result, error) in
            if error != nil {
                self.status = "Error"
                return
            }
            self.status = result![0]
        }
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
