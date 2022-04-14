//
//  amp_rsa_mobileApp.swift
//  amp-rsa-mobile
//
//  Created by Dave Lilly on 5/14/21.
//

import SwiftUI

@main
struct amp_rsa_mobileApp: App {
    init() {
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            HeaderView()

            TabView(selection: .constant(2),
                    content:  {
                        Text("")
//                CMS.getContentViewByKey(key: "homepage")
                            .tabItem { Label(
                                title: { Text("Home") },
                                icon: { Image(systemName: "house") }
                            ) }
                            .tag(0)

                        Text("")
                            .tabItem { Label(
                                title: { Text("Categories") },
                                icon: { Image(systemName: "tag") }
                            ) }
                            .tag(1)

                        // "73f3dbbb-f3de-47b8-9699-e6020389c836"
                        CMS.getContentViewById(id: UserDefaults.standard.string(forKey: "contentId") ?? "77d86f90-1af3-4b34-a859-5ffaa7b1cb72")
                            .tabItem { Label(
                                title: { Text("Visualization") },
                                icon: { Image(systemName: "eye") }
                            ) }
                            .tag(2)
                    })
            
//            ProductDetailView(slug: "lemare-booties-0572-black")
        }
    }
}
