//
//  Helper.swift
//  NY-Times
//
//  Created by Alfoah IOS on 09/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

func showError(error:ArticalError) -> String{
    var msgError = ""
    switch error {
    case .networkError:
        msgError = noNetworkErrorMessgae
    case .canNotProcessData:
        msgError = parsingfErrorMessgae
    default:
        msgError = noData
    }
    return msgError
}
