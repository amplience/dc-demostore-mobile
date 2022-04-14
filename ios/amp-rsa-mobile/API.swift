// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CategoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Category {
      category(slug: "women", locale: "de") {
        __typename
        name
        products {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "Category"

  public let operationIdentifier: String? = "cce0120d7773e4b44cb96c185476b1131201ba06cab8e656fd469fbacd8aa741"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("category", arguments: ["slug": "women", "locale": "de"], type: .object(Category.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(category: Category? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }])
    }

    public var category: Category? {
      get {
        return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "category")
      }
    }

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Category"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("products", type: .list(.object(Product.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, products: [Product?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Category", "name": name, "products": products.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var products: [Product?]? {
        get {
          return (resultMap["products"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Product?] in value.map { (value: ResultMap?) -> Product? in value.flatMap { (value: ResultMap) -> Product in Product(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }, forKey: "products")
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Product", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class ProductQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Product($id: String, $slug: String, $sku: String, $locale: String, $currency: String) {
      product(id: $id, slug: $slug, sku: $sku, locale: $locale, currency: $currency) {
        __typename
        name
        variants {
          __typename
          prices {
            __typename
            list
          }
        }
      }
    }
    """

  public let operationName: String = "Product"

  public let operationIdentifier: String? = "c26a77eda837149df0425da8f8ece27d9cc361b3ca88a5a706fa8a43f7793ce4"

  public var id: String?
  public var slug: String?
  public var sku: String?
  public var locale: String?
  public var currency: String?

  public init(id: String? = nil, slug: String? = nil, sku: String? = nil, locale: String? = nil, currency: String? = nil) {
    self.id = id
    self.slug = slug
    self.sku = sku
    self.locale = locale
    self.currency = currency
  }

  public var variables: GraphQLMap? {
    return ["id": id, "slug": slug, "sku": sku, "locale": locale, "currency": currency]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("product", arguments: ["id": GraphQLVariable("id"), "slug": GraphQLVariable("slug"), "sku": GraphQLVariable("sku"), "locale": GraphQLVariable("locale"), "currency": GraphQLVariable("currency")], type: .object(Product.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("variants", type: .list(.nonNull(.object(Variant.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, variants: [Variant]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "name": name, "variants": variants.flatMap { (value: [Variant]) -> [ResultMap] in value.map { (value: Variant) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var variants: [Variant]? {
        get {
          return (resultMap["variants"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Variant] in value.map { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Variant]) -> [ResultMap] in value.map { (value: Variant) -> ResultMap in value.resultMap } }, forKey: "variants")
        }
      }

      public struct Variant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Variant"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("prices", type: .object(Price.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(prices: Price? = nil) {
          self.init(unsafeResultMap: ["__typename": "Variant", "prices": prices.flatMap { (value: Price) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var prices: Price? {
          get {
            return (resultMap["prices"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "prices")
          }
        }

        public struct Price: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Prices"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("list", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(list: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Prices", "list": list])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var list: String? {
            get {
              return resultMap["list"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "list")
            }
          }
        }
      }
    }
  }
}
