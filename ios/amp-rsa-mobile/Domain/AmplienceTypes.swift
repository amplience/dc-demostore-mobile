//
//  AmplienceTypes.swift
//  amp-rsa-mobile
//
//  Created by dave lilly on 6/21/21.
//

import SwiftUI
import Foundation

class Meta: Codable {
    var deliveryId: String
    var name: String
    var schema: String
}

class ContentRoot: Codable {
    var _meta: Meta?
    
    enum CodingKeys: String, CodingKey {
        case content
        
        enum ContentKeys: String, CodingKey {
            case meta = "_meta"
        }
    }

    func encode(to encoder: Encoder) throws {
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let containerContainer = try container.nestedContainer(keyedBy: CodingKeys.ContentKeys.self, forKey: .content)
        self._meta = try containerContainer.decode(Meta.self, forKey: .meta)
    }
}
