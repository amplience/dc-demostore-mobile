//
//  CMS.swift
//  amp-rsa-mobile
//
//  Created by dave lilly on 6/29/21.
//

import Foundation
import SwiftUI

let defaultBaseURL: String = "r2tmue06tnfg191anlfcy76n6.staging.bigcontent.io"
//let defaultBaseURL: String = "amp-retailstorefront.cdn.content.amplience.net"

//let defaultBaseURL: String = "1m83zadcvtu241tvgm9c47m0gc.staging.bigcontent.io"

struct CMS {
    static let baseURL: String = "https://\(UserDefaults.standard.string(forKey: "cms") ?? defaultBaseURL)"
    
    static func getContentViewById(id: String) -> some View {
        return CMS.getContentView(path: "/id/\(id)")
    }

    static func getContentViewByKey(key: String) -> some View {
        return CMS.getContentView(path: "/key/\(key)")
    }

    static let magicParameters: String = "w=1536&sm=aspect&scaleFit=poi&aspect=1:1&strip=true&qlt=80&poi=0.5,0.5,0,0"
    static func getImageURL(imageContainer: DynamicMediaImageContainer?) -> URL? {
        if let img = imageContainer?.img, let image = img.image, let link = image.image {
            return URL(string: "https://\(link.defaultHost)/i/\(link.endpoint)/\(link.name).webp?\(CMS.magicParameters)&\(image.query)")
        }
        return nil
    }

    static func query(address: String) -> Data? {
        let url = URL(string: address)
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: Data? = nil
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            result = data
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return result
    }
    
    @ViewBuilder
    static func getContentView(path: String) -> some View {
        let address: String = "\(CMS.baseURL)/content\(path)?depth=all&format=inlined"
        if let data = CMS.query(address: address),
           let root = try? JSONDecoder().decode(ContentRoot.self, from: data),
           let schema: String = root._meta?.schema {
            if schema.contains("simple-banner") {
                if let content: SimpleBannerContentRoot = try? JSONDecoder().decode(SimpleBannerContentRoot.self, from: data) {
                    SimpleBannerView(content: content)
                }
            }
            else if schema.contains("site/pages") {
                if let content: HomepageContentRoot = try? JSONDecoder().decode(HomepageContentRoot.self, from: data) {
                    HomepageView(content: content)
                }
            }
            else {
                Text("View type not found \(schema): \(address)")
            }
        }
    }
}
