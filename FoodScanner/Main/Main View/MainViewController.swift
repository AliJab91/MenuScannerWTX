//
//  MainViewController.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit
import PixelEditor
import PixelEngine

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let menuViewModel = MainViewViewModel()
   
//    private lazy var stack = SquareEditingStack.init(
//        source: ImageSource(source: UIImage(named: "Album")!),
//        previewSize: CGSize(width: 300, height: 300),
//        colorCubeStorage: ColorCubeStorage.default
//    )
  
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        menuViewModel.fillCollectionItems()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        let imageId = UserdefaultHelper.getImageId()
        if imageId == 0 {
            UserdefaultHelper.setImageId(uId: 1)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
   private func setUpCollectionView()  {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MainViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}

extension MainViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0 : openCameraView()
            case 1 : openAlbumView()
            default:break
            }
        }else if indexPath.section == 1 {
            switch indexPath.row {
            case 0: goToAboutView()
            case 1: logout()
            default:break
            }
        }
    }
    func logout()  {
            UserdefaultHelper.loggetOut()
            let authStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
            let loginVC = authStoryboard.instantiateViewController(withIdentifier: "loginNav")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = loginVC
            let navigationController = self.presentingViewController as? UINavigationController
            self.dismiss(animated: true) {
                let _ = navigationController?.popToRootViewController(animated: true)
            }
        
    }
    
    func goToAboutView() {
          performSegue(withIdentifier: "aboutSegue", sender: self)
    }
    
    func openCameraView()  {
        showAlert()
    }
    
    func openAlbumView()  {
        performSegue(withIdentifier: "albumSegue", sender: self)
    }
}

extension MainViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuViewModel.numberOfItemsInSection()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return menuViewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainViewCell
        cell?.fillCell(with: menuViewModel.returnItem(for: indexPath.row, with: indexPath.section))
        return cell!
    }
    
    func showAlert()  {
        let alertVC = UIAlertController(title: "", message: "Please choose your image source:", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let libraryAction = UIAlertAction(title: "Album", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(cameraAction)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
    }

}

extension MainViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 2 - 50, height: self.view.frame.size.height / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 30, bottom: 10, right: 30)
    }
}

extension MainViewController : PixelEditViewControllerDelegate {
    
    func pixelEditViewController(_ controller: PixelEditViewController, didEndEditing editingStack: SquareEditingStack) {
        let image = editingStack.makeRenderer().render(resolution: .full)
        CoreDataFunctions.saveImageById( image: image)
        self.navigationController?.popToViewController(self, animated: true)
    }
    
    func pixelEditViewControllerDidCancelEditing(in controller: PixelEditViewController) {
        self.navigationController?.popToViewController(self, animated: true)
    }
}

extension MainViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            let controller = PixelEditViewController.init(
                image: image
            )
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
