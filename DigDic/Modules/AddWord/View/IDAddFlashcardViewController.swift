//
//  AddFlashcardIDAddFlashcardViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit
import BlocksKit
import TOCropViewController

class IDAddFlashcardViewController: IDBaseViewController, IDAddFlashcardViewInput, IDAddFlashcardFooterViewDelegate, IDAddFlashcardDataDisplayManagerDelegate, TOCropViewControllerDelegate {

    var output: IDAddFlashcardViewOutput!
    @IBOutlet weak var frontView: IDAddFlashcardFormView!
    @IBOutlet weak var backView: IDAddFlashcardFormView!
    
    var currentView: IDAddFlashcardFormView {
        if (!frontView.hidden) {
            return frontView
        } else {
            return backView
        }
    }
    
    let frontDataDisplayManager = IDAddFlashcardDataDisplayManager()
    let backDataDisplayManager = IDAddFlashcardDataDisplayManager()
    
    enum IDWordFrom: Int {
        case frontView = 0
        case BackView
    }
    
    var currentDataDisplayManager: IDAddFlashcardDataDisplayManager {
        if (!frontView.hidden) {
            return frontDataDisplayManager
        } else {
            return backDataDisplayManager
        }
    }
    
    var cropImageCompletionBlock: ((image: UIImage) -> Void)?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Actions
    
    @IBAction func didTapCloseButton(sender: AnyObject) {
        self.output.didTapCloseButton()
    }
    
    @IBAction func didTapAddButton(sender: AnyObject) {
        self.output.didTapAddButton()
    }

    // MARK: IDAddFlashcardViewInput
    
    func addFormForSelectingImage() {
        self.currentDataDisplayManager.addCellForSelectingImage()
        self.currentView.reloadData()
    }
    
    func addFormForText() {
        self.currentDataDisplayManager.addCellForText()
        self.currentView.reloadData()
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
    
    func displayDialogForCropImage(image: UIImage, dataHolder: IDAddFlashcardDataHolder) {
        let cropViewController = TOCropViewController(image: image)
        cropViewController.delegate = self
        self.cropImageCompletionBlock = {[unowned self](image) in
            self.output.didCropImage(image, dataHolder: dataHolder)
        }
        self.presentViewController(cropViewController, animated: true, completion: nil)
    }
    
    func updateImageForDataHolder(image: UIImage, dataHolder: IDAddFlashcardDataHolder) {
        guard let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder else {
            return
        }
        imageDataHolder.image = image
        self.currentView.reloadData()
    }
    
    func frontDataHolders() -> [IDAddFlashcardDataHolder] {
        return self.frontDataDisplayManager.dataSource
    }
    
    func backDataHolders() -> [IDAddFlashcardDataHolder] {
        return self.backDataDisplayManager.dataSource
    }
    
    // MARK: TOCropViewControllerDelegate

    func cropViewController(cropViewController: TOCropViewController!, didCropToImage image: UIImage!, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismissViewControllerAnimated(true, completion: nil)
        if let completionBlock = self.cropImageCompletionBlock {
            completionBlock(image: image)
        }
    }
    
    // MARK: IDAddFlashcardFooterViewDelegate
    
    func addFlashcardFooterViewDidTapAddImageButton(footerView: IDAddFlashcardFooterView) {
        self.output.didTapAddImageButton()
    }
    
    func addFlashcardFooterViewDidTapAddTextButton(footerView: IDAddFlashcardFooterView) {
        self.output.didTapAddTextButton()
    }
    
    func addFlashcardFooterViewDidTapLeftButton(footerView: IDAddFlashcardFooterView) {
        UIView.transitionFromView(self.currentView, toView: self.currentView == self.frontView ? self.backView : self.frontView, duration: 0.5, options:[.TransitionFlipFromRight, .ShowHideTransitionViews], completion: nil)
    }
    
    func addFlashcardFooterViewDidTapRightButton(footerView: IDAddFlashcardFooterView) {
        UIView.transitionFromView(self.currentView, toView: self.currentView == self.frontView ? self.backView : self.frontView, duration: 0.5, options:[.TransitionFlipFromLeft, .ShowHideTransitionViews], completion: nil)
    }
    
    // MARK: IDAddFlashcardDataDisplayManagerDelegate
    
    func dataDisplayManagerWantSelectImage(dataDisplayManager: IDAddFlashcardDataDisplayManager, dataHolder: IDAddFlashcardDataHolder) {
        self.output.didTapSelectImageButton(dataHolder)
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddFlashcardFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddFlashcardFooterView
            footerView.delegate = self
            self.frontView.setupTableViewFooter(footerView, footerHeight: IDAddFlashcardFooterView.height())
        }
        
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddFlashcardFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddFlashcardFooterView
            footerView.delegate = self
            self.backView.setupTableViewFooter(footerView, footerHeight: IDAddFlashcardFooterView.height())
        }
        
        self.frontView.setupTableViewDataSource(self.frontDataDisplayManager, delegate: self.frontDataDisplayManager)
        self.frontDataDisplayManager.delegate = self
        
        self.backView.setupTableViewDataSource(self.backDataDisplayManager, delegate: self.backDataDisplayManager)
        self.backDataDisplayManager.delegate = self
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
