//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {
    lazy var viewModel = ProductsViewModel()

    @IBAction func didGetProduct(_: Any) {
        getProduct()
    }

    @IBAction func didAddProduct(_: Any) {
        addProduct()
    }

    private func getProduct() {
        viewModel.getProduct(id: "1") { response in
            print(response)
        } failure: { error in
            print(error)
        }
    }

    private func addProduct() {
        viewModel.addProduct { response in
            print(response)
        } failure: { error in
            print(error)
        }
    }
}
