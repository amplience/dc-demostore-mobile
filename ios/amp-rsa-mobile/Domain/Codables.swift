//
//  Codables.swift
//  amp-rsa-mobile
//
//  Created by dave lilly on 6/29/21.
//

import SwiftUI
import Foundation

// https://amp-rsa.amplience.com/di-image.json
struct DynamicMediaImageContainer: Codable {
    var img: DynamicMediaTransformedImage? = nil
    var imageAltText: String? = nil
}

struct DynamicMediaTransformedImage: Codable {
    var image: DynamicMediaImage? = nil
}

struct DynamicMediaImage: Codable {
    var image: DynamicMediaImageLink? = nil
    var crop: [Int] = [0, 0, 0, 0]
    var rot: Int = 0
    var hue: Int = 0
    var sat: Int = 0
    var bri: Int = 0
    var fliph: Bool = false
    var flipv: Bool = false
    var poi: Coordinate? = nil
    var aspectLock: String? = nil
    var query: String = ""
}

struct Coordinate: Codable {
    var x: Float = 0
    var y: Float = 0
}

// http://bigcontent.io/cms/schema/v1/core#/definitions/image-link
struct DynamicMediaImageLink: Codable {
    var id: String = ""
    var name: String = ""
    var endpoint: String = ""
    var defaultHost: String = ""
}
