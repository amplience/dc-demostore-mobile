//
//  HomepageView.swift
//  amp-rsa-mobile
//
//  Created by dave lilly on 7/16/21.
//

import SwiftUI
import Foundation

struct HomepageView: View {
    typealias ContentType = HomepageContentRoot
    private var content: ContentType
    
    init(content: ContentType) {
        self.content = content
    }
    
    var body: some View {
        List {
            ForEach(0..<content.slots.count) { i in
//                Text("\(self.content.slots[i].id)")
//                CMS.getContentViewById(id: self.content.slots[i].id)
            }
        }
    }
}

class HomepageContentRoot: ContentRoot {
    var slots: [Slot] = []

    enum HomepageCodingKeys: String, CodingKey {
        case content
        
        enum HomepageContentKeys: String, CodingKey {
            case slots
        }
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: HomepageCodingKeys.self)
        let contentContainer = try container.nestedContainer(keyedBy: HomepageCodingKeys.HomepageContentKeys.self, forKey: .content)

        do {
            self.slots = try contentContainer.decode([Slot].self, forKey: .slots)
        } catch {
            print("Decoding error: \(error)")
        }
    }
}

struct Slot: Decodable {
    let contentType: String
    let id: String
}
