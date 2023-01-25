//
//  ViewController.swift
//  Search
//
//  Created by nehag-solutelabs on 25/1/2023.
//  

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!

    var listingQueryWorkItem: DispatchWorkItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearch.delegate = self
    }

    func getSearchResult(query: String) {
        listingQueryWorkItem?.cancel()
        let newWorkItem = DispatchWorkItem {
            print("Make a API call for query \(query)")
        }
        listingQueryWorkItem = newWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1), execute: newWorkItem)
    }
}
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        getSearchResult(query: textField.text?.appending(string) ?? String())
        return true
    }
}
