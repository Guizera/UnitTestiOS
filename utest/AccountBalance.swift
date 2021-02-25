//
//  AccountBalance.swift
//  utest
//
//  Created by José Alves da Cunha on 25/02/21.
//

import UIKit

struct AccountBalance {
    
    let balance: Double
    
    func getSpecialLimit() -> Double {
        if balance < 100 {
            return balance + 10
        } else if balance > 500 {
            return balance + 1000
        }
        return balance
    }
}
