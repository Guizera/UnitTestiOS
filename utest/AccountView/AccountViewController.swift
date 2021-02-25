//
//  AccountViewController.swift
//  utest
//
//  Created by José Alves da Cunha on 25/02/21.
//

import UIKit

class AccountViewController: UIViewController {
    
    var viewModel: AccountViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.shouldRequestLocation(showAlert: { print("alerta") }, askUserPermission: { print("user Location") }, completion: { print("completion")})
        
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel?.loginButtonTapped()
    }
}
