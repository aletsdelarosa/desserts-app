//
//  DessertsCollectionViewController.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import UIKit

private let reuseIdentifier = "DessertsCollectionViewCell"

class DessertsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let dessertsRepository = DessertsRepository()
    var desserts = [Dessert]()
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        
        self.collectionView!.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DessertDetailTableViewController
        detailViewController.dessert = desserts[selectedIndex]
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return desserts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DessertsCollectionViewCell
        
        cell.setCell(for: desserts[indexPath.row])
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        if desserts[selectedIndex].containsAllData {
            performSegue(withIdentifier: "toDessertDetail", sender: self)
        }
        else {
            dessertsRepository.delegate = self
            dessertsRepository.getDetails(dessert: desserts[selectedIndex])
        }
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width / 2.0) - 15.0
        
        return CGSize(width: width, height: width)
    }
}

extension DessertsCollectionViewController: DessertsRepositoryDelegate {
    func didGetDesserts(_ desserts: [Dessert]) { }
    
    func didGetDessertDetails(_ dessert: Dessert) {
        desserts[selectedIndex] = dessert
        
        performSegue(withIdentifier: "toDessertDetail", sender: self)
    }
}
