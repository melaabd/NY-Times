//
//  URLs.swift
//  NY-Times
//
//  Created by El-Abd on 10/5/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

struct URLs {
    
    // API URLS
    static let apiBaseURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
    static let apiKey = "54e5496eb75443aea29abca3eda6dbf6"
    static let apiPeriod:Int = 7
    static let apiSections = "all-sections"

    static let newsURL = apiBaseURL + "/\(apiSections)" + "/\(apiPeriod)" + ".json?api-key=\(apiKey)"

}
