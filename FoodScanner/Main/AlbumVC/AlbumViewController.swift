//
//  AlbumViewController.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var images:[ImageObject]!
    var albumViewModel = AlbumViewViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        images = albumViewModel.getAllImages()
        setCollectionView()
       title = albumViewModel.setTitle()
    }
    
    func setCollectionView()  {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "imageCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
    }
}

extension AlbumViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension AlbumViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? imageCell
        cell?.fillCellWithImage(image: albumViewModel.returnImageByIndexpath(indexPath: indexPath.row))
        return cell!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return albumViewModel.NumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumViewModel.numberOfRowsInSection()
    }
}

extension AlbumViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //  return CGSize(width: 150, height: 135)
        return CGSize(width: self.view.frame.size.width - 30, height: self.view.frame.size.width - 30)
       // return albumViewModel.sizeForCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return albumViewModel.setCellLayout()
    }
}
