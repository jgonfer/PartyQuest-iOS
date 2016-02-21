//
//  CollectionViewController.swift
//  PartyQuest
//
//  Created by Josep Gonzalez Fernandez on 21/2/16.
//  Copyright © 2016 Josep Gonzalez Fernandez. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    private let maxItems = 10
    private let sectionInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    private var currentIndex = NSIndexPath(forRow: 0, inSection: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // If we receive a memmory warning, we have to clean up 
        // the cache with a method provided by ImageHelper class
        // and the NSCache will do it when it's necessary
        ImageHelper.sharedInstance.cleanCache()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kImagesCollection.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "colell", forIndexPath: indexPath) as! Colell
        
        currentIndex = indexPath
        
        cell.delegate = self
        cell.setupCell(indexPath)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath)
        view.backgroundColor = kColorOrangeLight
        
        return view
    }
    
    // MARK: Own Methods
    
    private func setupController() {
        //collectionView?.backgroundColor = kColorOrangeLight
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            let collectionViewWidth = collectionView.bounds.size.width
            let sizeForCell = (collectionViewWidth/2) - 10
            return CGSize(width: sizeForCell, height: sizeForCell)
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
}

extension CollectionViewController: ColellDelegate {
    func isVisibleCurrentCell(indexPath: NSIndexPath) -> Bool {
        let isInside = abs(currentIndex.row - indexPath.row) <= maxItems
        if !isInside { print("Current: \(currentIndex.row)  --  cellIndex \(indexPath.row) \(isInside ? "YES" : "NO")") }
        return isInside
    }
}