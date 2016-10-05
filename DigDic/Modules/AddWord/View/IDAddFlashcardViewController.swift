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
        if (!frontView.isHidden) {
            return frontView
        } else {
            return backView
        }
    }
    
    let frontDataDisplayManager = IDAddFlashcardDataDisplayManager()
    let backDataDisplayManager = IDAddFlashcardDataDisplayManager()
    
    enum IDWordFrom: Int {
        case frontView = 0
        case backView
    }
    
    var currentDataDisplayManager: IDAddFlashcardDataDisplayManager {
        if (!frontView.isHidden) {
            return frontDataDisplayManager
        } else {
            return backDataDisplayManager
        }
    }
    
    var cropImageCompletionBlock: ((_ image: UIImage) -> Void)?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Actions
    
    @IBAction func didTapCloseButton(_ sender: AnyObject) {
        self.output.didTapCloseButton()
    }
    
    @IBAction func didTapAddButton(_ sender: AnyObject) {
        self.output.didTapAddButton()
    }
    
//    func setupInitialState()
//    func addFormForSelectingImage()
//    func addFormForText()
//    func displayDialogForSelectingImage(_ completion: (_ result: UIImage?) -> Void)
//    func displayDialogForCropImage(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder)
//    func updateImageForDataHolder(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder)
//    func frontDataHolders() -> [IDAddFlashcardDataHolder]
//    func backDataHolders() -> [IDAddFlashcardDataHolder]
//    

    // MARK: IDAddFlashcardViewInput
    
    func addFormForSelectingImage() {
        self.currentDataDisplayManager.addCellForSelectingImage()
        self.currentView.reloadData()
    }
    
    func addFormForText() {
        self.currentDataDisplayManager.addCellForText()
        self.currentView.reloadData()
    }
    
    internal func displayDialogForSelectingImage(_ completion: @escaping (UIImage?) -> Void) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alertController.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takePhotoAction = UIAlertAction(title: "take photo", style: .default, handler: {[weak self] (action) in
                guard let strongSelf = self else { return }
                strongSelf.showImagePickerController(.camera, completion: { (image) in
                    completion(image)
                })
            })
            alertController.addAction(takePhotoAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let selectExistingPhotoAction = UIAlertAction(title: "choose img", style: .default, handler: {[weak self] (action) in
                guard let strongSelf = self else { return }
                strongSelf.showImagePickerController(.photoLibrary, completion: { (image) in
                    completion(image)
                })
            })
            alertController.addAction(selectExistingPhotoAction)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayDialogForCropImage(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder) {
        let cropViewController = TOCropViewController(image: image)
        cropViewController?.delegate = self
        self.cropImageCompletionBlock = {[unowned self](image) in
            self.output.didCropImage(image, dataHolder: dataHolder)
        }
        self.present(cropViewController!, animated: true, completion: nil)
    }
    
    func updateImageForDataHolder(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder) {
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

    func cropViewController(_ cropViewController: TOCropViewController!, didCropTo image: UIImage!, with cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true, completion: nil)
        if let completionBlock = self.cropImageCompletionBlock {
            completionBlock(image)
        }
    }
    
    // MARK: IDAddFlashcardFooterViewDelegate
    
    func addFlashcardFooterViewDidTapAddImageButton(_ footerView: IDAddFlashcardFooterView) {
        self.output.didTapAddImageButton()
    }
    
    func addFlashcardFooterViewDidTapAddTextButton(_ footerView: IDAddFlashcardFooterView) {
        self.output.didTapAddTextButton()
    }
    
    func addFlashcardFooterViewDidTapLeftButton(_ footerView: IDAddFlashcardFooterView) {
        UIView.transition(from: self.currentView, to: self.currentView == self.frontView ? self.backView : self.frontView, duration: 0.5, options:[.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
    
    func addFlashcardFooterViewDidTapRightButton(_ footerView: IDAddFlashcardFooterView) {
        UIView.transition(from: self.currentView, to: self.currentView == self.frontView ? self.backView : self.frontView, duration: 0.5, options:[.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    // MARK: IDAddFlashcardDataDisplayManagerDelegate
    
    func dataDisplayManagerWantSelectImage(_ dataDisplayManager: IDAddFlashcardDataDisplayManager, dataHolder: IDAddFlashcardDataHolder) {
        self.output.didTapSelectImageButton(dataHolder)
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let view = Bundle.main.loadNibNamed(String(describing: IDAddFlashcardFooterView.self), owner: nil, options: nil)!.last {
            let footerView = view as! IDAddFlashcardFooterView
            footerView.delegate = self
            self.frontView.setupTableViewFooter(footerView, footerHeight: IDAddFlashcardFooterView.height())
        }
        
        if let view = Bundle.main.loadNibNamed(String(describing: IDAddFlashcardFooterView.self), owner: nil, options: nil)!.last {
            let footerView = view as! IDAddFlashcardFooterView
            footerView.delegate = self
            self.backView.setupTableViewFooter(footerView, footerHeight: IDAddFlashcardFooterView.height())
        }
        
        self.frontView.setupTableViewDataSource(self.frontDataDisplayManager, delegate: self.frontDataDisplayManager)
        self.frontDataDisplayManager.delegate = self
        self.frontView.registerNibsWithClassNames(self.frontDataDisplayManager.classNamesForRegistration())
        
        self.backView.setupTableViewDataSource(self.backDataDisplayManager, delegate: self.backDataDisplayManager)
        self.backDataDisplayManager.delegate = self
        self.backView.registerNibsWithClassNames(self.backDataDisplayManager.classNamesForRegistration())
    }
    
    // MARK: Private
    
    fileprivate func showImagePickerController(_ sourceType: UIImagePickerControllerSourceType, completion: @escaping (UIImage?) -> Void) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        let didFinishPickingMediaBlock: (UIImagePickerController?, [AnyHashable: Any]?) -> Void = {(imagePickerController, info) in
            imagePickerController?.dismiss(animated: true, completion: nil)
            let image = info?[UIImagePickerControllerEditedImage]
            completion(image as? UIImage)
        }
        imagePickerController.bk_didFinishPickingMediaBlock = didFinishPickingMediaBlock
        let didCancelBlock: (UIImagePickerController!) -> Void = {(imagePickerController) in
            imagePickerController.dismiss(animated: true, completion: nil)
            completion(nil)
        }
//        imagePickerController.bk_didCancelBlock = didCancelBlock
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
}
