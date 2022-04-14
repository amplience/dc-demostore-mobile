//
//  SimpleBannerView.swift
//  amp-rsa-mobile
//
//  Created by Dave Lilly on 6/10/21.
//

import SwiftUI
import URLImage

struct SimpleBannerView: View {
    typealias ContentType = SimpleBannerContentRoot
    private var content: ContentType
    
    init(content: ContentType) {
        self.content = content
    }
    
    var body: some View {
        if let imageUrl = CMS.getImageURL(imageContainer: content.image) {
            VStack {
                URLImage(imageUrl, content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 350)
                        .overlay(SimpleBannerImageOverlay(content: content), alignment: .bottom)
                })
            }
        }
    }
}

struct SimpleBannerImageOverlay: View {
    private var content: SimpleBannerContentRoot
    
    init(content: SimpleBannerContentRoot) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    if let bannerText = content.bannerText?.header {
                        Text(bannerText.uppercased())
                            .font(.system(size: 20.0).weight(.bold))
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 5, trailing: 15))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("dark_gray"))
                    }

                    if let buttonText = content.ctaSettings?.buttonText {
                        Button("\(buttonText) \(Image(systemName: "arrow.right.square.fill"))") {
                            // theoretically navigate to the link here
                        }
                        .font(.system(size: 16.0))
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .background(Color.black)
                        .foregroundColor(Color.white)
                    }
                }
            }
                .background(Color.white)
                .frame(width: metrics.size.width * 0.8, height: 200, alignment: .bottom)
                .offset(x: metrics.size.width * 0.1, y: 240)
        }
    }
}

class SimpleBannerContentRoot: ContentRoot {
    var image: DynamicMediaImageContainer? = nil
    var textPositioning: SimpleBannerTextPositioning? = nil
    var bannerText: SimpleBannerBannerText? = nil
    var ctaSettings: SimpleBannerCTASettings? = nil

    enum SimpleBannerCodingKeys: String, CodingKey {
        case content
        
        enum SimpleBannerContentKeys: String, CodingKey {
            case image, textPositioning, bannerText, ctaSettings
        }
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: SimpleBannerCodingKeys.self)
        let contentContainer = try container.nestedContainer(keyedBy: SimpleBannerCodingKeys.SimpleBannerContentKeys.self, forKey: .content)

        self.image = try? contentContainer.decode(DynamicMediaImageContainer.self, forKey: .image)
        self.textPositioning = try? contentContainer.decode(SimpleBannerTextPositioning.self, forKey: .textPositioning)
        self.bannerText = try? contentContainer.decode(SimpleBannerBannerText.self, forKey: .bannerText)
        self.ctaSettings = try? contentContainer.decode(SimpleBannerCTASettings.self, forKey: .ctaSettings)
    }
}

struct SimpleBannerTextPositioning: Codable {
    var textPositionHorizontal: String = "center"
    var textPositionVertical: String = "middle"

    func getHorizontalAlignment() -> HorizontalAlignment {
        switch textPositionHorizontal {
        case "left":
            return .leading
        case "right":
            return .trailing
        default:
            return .center
        }
    }

    func getVerticalAlignment() -> VerticalAlignment {
        switch textPositionVertical {
        case "top":
            return .top
        case "bottom":
            return .bottom
        default:
            return .center
        }
    }

    func getAlignment() -> Alignment {
        return Alignment(horizontal: getHorizontalAlignment(), vertical: getVerticalAlignment())
    }
}

struct SimpleBannerBannerText: Codable {
    var header: String? = nil
    var subheader: String? = nil
    var description: String? = nil
}

struct SimpleBannerCTASettings: Codable {
    var buttonText: String? = nil
    var linkUrl: String? = nil
}
