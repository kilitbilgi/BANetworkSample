//
//  ProductsViewModel.swift
//

import BANetwork

typealias ProductCallback = ((ProductResponse) -> Void)?
typealias AddProductCallback = ((AddProductResponse) -> Void)?
typealias ErrorCallback = ((Error) -> Void)?

class ProductsViewModel: BaseViewModel {
    func getProduct(id: String, completion: ProductCallback, failure: ErrorCallback) {
        let endpoint = BAEndpoint()
            .set(method: .get)
            .set(path: BAPathModel(path: "products", value: id))
            .add(header: BAHeaderModel(field: "fieldOne", value: "valueOne"))
            .add(header: BAHeaderModel(field: "fieldTwo", value: "valueTwo"))
            .add(queryItem: BAQueryModel(name: "nameOne", value: "valueOne"))
            .add(queryItem: BAQueryModel(name: "nameTwo", value: "valueTwo"))
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

    func addProduct(completion: AddProductCallback, failure: ErrorCallback) {
        let endpoint = BAEndpoint()
            .set(method: .post)
            .set(path: "products/add")
            .add(header: BAHeaderModel(field: "fieldOne", value: "valueOne"))
            .add(header: BAHeaderModel(field: "fieldTwo", value: "valueTwo"))
            .add(param: BABodyModel(key: "title", value: "valueOne"))
            .add(param: BABodyModel(key: "description", value: "valueTwo"))
            .add(param: BABodyModel(key: "price", value: 100))
            .build()

        network.request(to: endpoint) { (r: BaseResult<AddProductResponse?, Error>) in
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
