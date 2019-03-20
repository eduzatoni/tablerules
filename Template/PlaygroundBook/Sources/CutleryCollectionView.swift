
//
//  CutleryRulesCollectionView.swift
//  AR Cotlery
//
//  Created by Eduardo Curupana on 18/03/2019.
//  Copyright © 2019 Eduardo Curupana. All rights reserved.
//

import Foundation
import UIKit

extension LiveViewController_1_2: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setCutleryPosition(status: dataArray[indexPath.row])
        let cell = collectionView.cellForItem(at: indexPath)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        cell?.layer.backgroundColor = UIColor.red.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.backgroundColor = UIColor.white.cgColor
    }
}

extension LiveViewController_1_2: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cutleryRuleCell", for: indexPath) as! CutleryRuleCell
        
        let cutleryRule = dataArray[indexPath.row]
        cell.imageView.image = cutleryRule.image
        
        return cell
    }
}

class CutleryRuleCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        self.setRounded(cornerRadius: 20)
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.layer.backgroundColor = UIColor.red.cgColor
            }
            else {
                self.layer.backgroundColor = UIColor.white.cgColor
            }
        }
    }
}
