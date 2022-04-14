//
//  ApolloClient.swift
//  GraphQLSwiftUI
//
import Foundation
import Apollo

public typealias ResultHandler<Data> = (Data) -> Void

class Apollo {
    static let shared = Apollo()

    private(set) lazy var cache = InMemoryNormalizedCache()
    private(set) lazy var store = ApolloStore(cache: cache)
    private(set) lazy var transport = RequestChainNetworkTransport(
        interceptorProvider: LegacyInterceptorProvider(store: store),
        endpointURL: URL(string: "https://graphql.amprsa-dev.net/graphql")!,
        additionalHeaders: ["X-Commerce-Backend-Key": "commercetools/anyafinn"]);
    private(set) lazy var apollo = ApolloClient(networkTransport: transport, store: store)
    
    static func fetch<Query: GraphQLQuery>(query: Query, resultHandler: ResultHandler<Query.Data>? = nil) {
        shared.apollo.fetch(query: query) { result in
            guard let data = try? result.get().data else {
                print("error")
                return
            }
            resultHandler?(data)
        }
    }
}
