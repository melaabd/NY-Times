//
//  Artical.swift
//  NY-Times
//
//  Created by Alfoah IOS on 06/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

// MARK: - ArticalsResult
struct ArticalsResult:Decodable {
    var results:[Articale]?
}

// MARK: - Articale
struct Articale:Decodable, Equatable {
    
    //for testing perpos
    static func == (lhs: Articale, rhs: Articale) -> Bool {
        return lhs.url == rhs.url && lhs.id == rhs.id
    }
    
    var url: String?
    var byline, type, title: String?
    var abstract, published_date, source: String?
    var id, assetID, views: Int?
    var media: [Media]?
    var uri: String?
}

// MARK: - Media
struct Media:Decodable {
private enum CodingKeys: String, CodingKey {
    case mediaMetadata = "media-metadata"
}
    var mediaMetadata : [MediaMetadata]?
}

// MARK: - MediaMetadatum
struct MediaMetadata:Decodable {
    var url: String?
    var height, width: Int?
}
