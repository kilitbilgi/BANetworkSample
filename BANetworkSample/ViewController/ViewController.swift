//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {
    lazy var viewModel = ProductsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getProduct(id: "2") { response in

        } failure: { error in

        }
    }
}
