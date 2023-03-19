//
//  ProductsViewModel.swift
//

import BANetwork

typealias ProductCallback = ((ProductResponse) -> Void)?
typealias ErrorCallback = ((Error) -> Void)?

class ProductsViewModel: BaseViewModel {
    func getProduct(id: String, completion: ProductCallback, failure: ErrorCallback) {
        let endpoint = BAEndpoint()
            .set(method: .get)
            .set(path: "products/\(id)")
            .add(header: BAHeaderModel(field: "id", value: "3"))
            .add(header: BAHeaderModel(field: "name", value: "burak"))
            .add(queryItem: BAQueryModel(name: "item", value: "key"))
            .add(queryItem: BAQueryModel(name: "do", value: "like"))
            .build()

        network.request(to: endpoint) { (r: BaseResult<ProductResponse?, Error>) in
            switch r {
            case let .success(r):
                guard let response = r else {
                    return
                }
                completion?(response)
            case let .failure(error):
                failure?(error)
            }
        }
    }
}
