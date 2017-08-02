//
//  DashboardExtensionm.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

extension DashboardViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, iCarouselDelegate, iCarouselDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! PlayerCollectionViewCell
    
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return self.users.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.getSwipeAction(_:)))
        
        view?.isUserInteractionEnabled = true
        view?.addGestureRecognizer(swipeGesture)
        
        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2 + 30 , height: UIScreen.main.bounds.height / 3 + 50))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(swipeGesture)
            if let profileImage = users[index].profileImageUrl {
                imageView.loadImageUsingCacheWithUrlString(profileImage)
            }
        }
        
        //imageView.layer.borderWidth = 2
        
        return imageView
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        print(index)
    }
    
//    func carousel(_ carousel: iCarousel, placeholderViewAt index: Int, reusing view: UIView?) -> UIView {
//        self.dashboardView.nameLabel.text = self.users[index].name
//    }
    
    func carouselDidEndDragging(_ carousel: iCarousel, willDecelerate decelerate: Bool) {
        let currentItemIndex = carousel.currentItemIndex
        if decelerate == true {
//            UILabel.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseIn, animations: {
//                self.dashboardView.nameLabel.isHidden = false
//                self.dashboardView.nameBackground.isHidden = false
//            }, completion: nil)
            
            self.dashboardView.nameLabel.text = self.users[currentItemIndex].name
            if let compatibility = self.users[currentItemIndex].compatibility {
                self.dashboardView.matchingStatus.text = "\(compatibility)%"
            }
            
        } else {
//            UILabel.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseIn, animations: {
//                self.dashboardView.nameLabel.isHidden = true
//                self.dashboardView.nameBackground.isHidden = true
//            }, completion: nil)
        }
    }
    
//    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
//        let currentItemIndex = carousel.currentItemIndex
//        if carousel.numberOfItems == self.users.count {
//            self.dashboardView.nameLabel.text = self.users[currentItemIndex].name
//        }
//    }
    
    func getSwipeAction( _ recognizer : UISwipeGestureRecognizer){
        
        if recognizer.direction == .right{
            print("Right Swiped")
            
        } else if recognizer.direction == .left {
            print("Left Swiped")
        } else if recognizer.direction == .down {
            print("got it")
        }
        
    }
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

