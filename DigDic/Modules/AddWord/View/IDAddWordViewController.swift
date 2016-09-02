//
//  AddWordIDAddWordViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit
import BlocksKit

class IDAddWordViewController: IDBaseViewController, IDAddWordViewInput, IDAddWordFooterViewDelegate, IDAddWordDataDisplayManagerDelegate {

    var output: IDAddWordViewOutput!
    @IBOutlet weak var frontView: IDAddWordFormView!
    let dataDisplayManager = IDAddWordDataDisplayManager()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Actions
    
    @IBAction func didTapCloseButton(sender: AnyObject) {
        self.output.didTapCloseButton()
    }

    // MARK: IDAddWordViewInput
    
    func addFormForSelectingImage() {
        self.dataDisplayManager.addCellForSelectingImage()
        self.frontView.reloadData()
    }
    
    func displayDialogForSelectingImage(completion: (result: UIImage?) -> Void) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
        }
        alertController.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let takePhotoAction = UIAlertAction(title: "take photo", style: .Default, handler: {[unowned self] (action) in
                self.showImagePickerController(.Camera, completion: { (image) in
                    completion(result: image)
                });
            })
            alertController.addAction(takePhotoAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let selectExistingPhotoAction = UIAlertAction(title: "choose img", style: .Default, handler: {[unowned self] (action) in
                self.showImagePickerController(.PhotoLibrary, completion: { (image) in
                    completion(result: image)
                });
            })
            alertController.addAction(selectExistingPhotoAction)
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: IDAddWordFooterViewDelegate
    
    func addWordFooterViewDidTapAddImageButton(footerView: IDAddWordFooterView) {
        self.output.didTapAddImageButton()
    }
    
    // MARK: IDAddWordDataDisplayManagerDelegate
    
    func dataDisplayManagerWantSelectImage(dataDisplayManager: IDAddWordDataDisplayManager, indexPath: NSIndexPath) {
        self.output.didTapSelectImageButton {[unowned self] (result) in
            guard let image = result else {
                return
            }
            dataDisplayManager.updateImage(image, indexPath: indexPath)
            self.frontView.reloadData()
        }
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddWordFooterView
            footerView.delegate = self
            self.frontView.setupTableViewFooter(footerView, footerHeight: IDAddWordFooterView.height())
        }
        self.frontView.setupTableViewDataSource(self.dataDisplayManager, delegate: self.dataDisplayManager)
        self.dataDisplayManager.delegate = self
    }
    
    // MARK: Private
    
    private func showImagePickerController(sourceType: UIImagePickerControllerSourceType, completion: (UIImage?) -> Void) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        let didFinishPickingMediaBlock: (UIImagePickerController!, [NSObject: AnyObject]!) -> Void = {(imagePickerController, info) in
            imagePickerController.dismissViewControllerAnimated(true, completion: nil)
            let image = info[UIImagePickerControllerEditedImage]
            completion(image as? UIImage)
        }
        imagePickerController.bk_didFinishPickingMediaBlock = didFinishPickingMediaBlock
        let didCancelBlock: (UIImagePickerController!) -> Void = {(imagePickerController) in
            imagePickerController.dismissViewControllerAnimated(true, completion: nil)
            completion(nil)
        }
        imagePickerController.bk_didCancelBlock = didCancelBlock
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
}
