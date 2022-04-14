//
//  ProductDetailView.swift
//  amp-rsa-mobile
//
//  Created by Dave Lilly on 5/14/21.
//

import SwiftUI

struct ProductDetailView: View {
    private var id: String?
    private var slug: String?
    private var sku: String?
    
    @State var product: ProductQuery.Data.Product? = nil
    
    init(id: String? = nil, slug: String? = nil, sku: String? = nil) {
        self.id = id
        self.slug = slug
        self.sku = sku
    }

    func read() {
        Apollo.fetch(query: ProductQuery(id: self.id, slug: self.slug, sku: self.sku, locale: Locale.current.languageCode, currency: Locale.current.currencyCode)) { result in
            self.product = result.product
        }
    }
    
    var body: some View {
        if let product = product {
            Text(product.name)
                .padding()
            Text(product.variants?[0].prices?.list ?? "n/a")
        }
        else {
            ProgressView("Loading...")
                .onAppear() { self.read() }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(id: nil, slug: "lemare-booties-0572-black", sku: nil)
    }
}
