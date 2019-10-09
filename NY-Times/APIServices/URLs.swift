//
//  URLs.swift
//  NY-Times
//
//  Created by El-Abd on 10/5/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

struct URLs {
    
    static let apiBaseURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/"
    static let apiKey = "GHcdymda81NGkD5Aq4cdR0Gp1YLSveSV"
    static let apiPeriod = 7
    static let newsURL = apiBaseURL + "\(apiPeriod)" + ".json?api-key=\(apiKey)"

}
