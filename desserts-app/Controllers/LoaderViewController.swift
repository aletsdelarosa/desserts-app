//
//  LoaderViewController.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import UIKit

class LoaderViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let dessertsRepository = DessertsRepository()
    private var desserts = [Dessert]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.startAnimating()
        dessertsRepository.delegate = self
        dessertsRepository.getDesserts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDessertsList" {
            let navigationViewController = segue.destination as! UINavigationController
            
            let destinationViewController = navigationViewController.topViewController as! DessertsCollectionViewController
            
            destinationViewController.desserts = desserts
        }
    }
}

// MARK: - DessertsRepositoryDelegate
extension LoaderViewController: DessertsRepositoryDelegate {
    func didGetDessertDetails(_ dessert: Dessert) { }
    
    func didGetDesserts(_ desserts: [Dessert]) {
        self.desserts = desserts
        performSegue(withIdentifier: "toDessertsList", sender: self)
    }
}
