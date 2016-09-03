//
//  AddWordIDAddWordViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit
import BlocksKit
import TOCropViewController

class IDAddWordViewController: IDBaseViewController, IDAddWordViewInput, IDAddWordFooterViewDelegate, IDAddWordDataDisplayManagerDelegate, TOCropViewControllerDelegate {

    var output: IDAddWordViewOutput!
    @IBOutlet weak var frontView: IDAddWordFormView!
    @IBOutlet weak var backView: IDAddWordFormView!
    
    var currentView: IDAddWordFormView {
        if (!frontView.hidden) {
            return frontView
        } else {
            return backView
        }
    }
    
    let frontDataDisplayManager = IDAddWordDataDisplayManager()
    let backDataDisplayManager = IDAddWordDataDisplayManager()
    
    enum IDWordFrom: Int {
        case FaceView = 0
        case BackView
    }
    
    var currentDataDisplayManager: IDAddWordDataDisplayManager {
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
        
    }

    // MARK: IDAddWordViewInput
    
    func addFormForSelectingImage() {
        self.currentDataDisplayManager.addCellForSelectingImage()
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
    
    func displayDialogForCropImage(image: UIImage, dataHolder: IDAddWordDataHolder) {
        let cropViewController = TOCropViewController(image: image)
        cropViewController.delegate = self
        self.cropImageCompletionBlock = {[unowned self](image) in
            self.output.didCropImage(image, dataHolder: dataHolder)
        }
        self.presentViewController(cropViewController, animated: true, completion: nil)
    }
    
    func updateImageForDataHolder(image: UIImage, dataHolder: IDAddWordDataHolder) {
        guard let imageDataHolder = dataHolder as? IDAddWordImageDataHolder else {
            return
        }
        imageDataHolder.image = image
        self.currentView.reloadData()
    }
    
    func numberWords() -> Int {
        return 2
    }
    
    func dataHoldersForWordNumber(number: Int) -> [IDAddWordDataHolder]? {
        switch number {
        case IDWordFrom.BackView.rawValue:
            return self.frontDataDisplayManager.dataSource
        case IDWordFrom.FaceView.rawValue:
            return self.backDataDisplayManager.dataSource
        default:
            return nil
        }
    }
    
    // MARK: TOCropViewControllerDelegate

    func cropViewController(cropViewController: TOCropViewController!, didCropToImage image: UIImage!, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismissViewControllerAnimated(true, completion: nil)
        if let completionBlock = self.cropImageCompletionBlock {
            completionBlock(image: image)
        }
    }
    
    // MARK: IDAddWordFooterViewDelegate
    
    func addWordFooterViewDidTapAddImageButton(footerView: IDAddWordFooterView) {
        self.output.didTapAddImageButton()
    }
    
    func addWordFooterViewDidTapLeftButton(footerView: IDAddWordFooterView) {
        UIView.transitionFromView(self.currentView, toView: self.currentView == self.frontView ? self.backView : self.frontView, duration: 0.5, options:[.TransitionFlipFromRight, .ShowHideTransitionViews], completion: nil)
    }
    
    func addWordFooterViewDidTapRightButton(footerView: IDAddWordFooterView) {
        UIView.transitionFromView(self.currentView, toView: self.currentView == self.frontView ? self.backView : self.frontView, duration: 0.5, options:[.TransitionFlipFromLeft, .ShowHideTransitionViews], completion: nil)
    }
    
    // MARK: IDAddWordDataDisplayManagerDelegate
    
    func dataDisplayManagerWantSelectImage(dataDisplayManager: IDAddWordDataDisplayManager, dataHolder: IDAddWordDataHolder) {
        self.output.didTapSelectImageButton(dataHolder)
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddWordFooterView
            footerView.delegate = self
            self.frontView.setupTableViewFooter(footerView, footerHeight: IDAddWordFooterView.height())
        }
        
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddWordFooterView
            footerView.delegate = self
            self.backView.setupTableViewFooter(footerView, footerHeight: IDAddWordFooterView.height())
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
