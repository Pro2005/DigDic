//
//  DictionaryDetailIDDictionaryDetailViewController.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift

class IDDictionaryDetailViewController: IDBaseViewController, IDDictionaryDetailViewInput {
    var output: IDDictionaryDetailViewOutput!
    var swipeableView: ZLSwipeableView?
    var setNeedsUpdateConstraints: Bool = false
    @IBOutlet var goodLabel: UILabel!
    @IBOutlet var badLabel: UILabel!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func updateViewConstraints() {
        if self.setNeedsUpdateConstraints {
            if let swipeableView = self.swipeableView {
                swipeableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
                swipeableView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
                swipeableView.autoPinEdgeToSuperviewEdge(.Top, withInset: 70)
                swipeableView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 60)
            }

            self.setNeedsUpdateConstraints = false
        }
    
        super.updateViewConstraints()
    }
    
    // MARK: Actions
    
    @IBAction func didTapAddButton(sender: AnyObject) {
        self.output.didTapAddButton()
    }
    
    @IBAction func didTapRemoveButton(sender: AnyObject) {
        self.output.didTapRemoveButton()
    }

    // MARK: IDDictionaryDetailViewInput
    
    func updateTitle(title: String) {
        self.title = title
    }
    
    func displayFlashcards(flashcards: [IDFlashcard]) {
        guard let swpeableView = self.swipeableView else {
            return
        }
        swpeableView.numberOfActiveView = UInt(flashcards.count)
        var index = 0
        swpeableView.nextView = {
            if index < flashcards.count {
                let flashcard = flashcards[index]
                index += 1
                return IDDictionaryDetailFlashcardView(flashcard: flashcard)
            }
            return UIView()
        }
        swpeableView.loadViews()
    }
    
    func getConfirmationForRemoving() {
        let alertController = UIAlertController(title: "", message: "Are you sure?", preferredStyle: .Alert)
        let acceptAction = UIAlertAction(title: "Remove", style: .Destructive) { (alertAction) in
            if let topView = self.swipeableView?.topView() as? IDDictionaryDetailFlashcardView {
                guard let faceFlashcard = topView.faceDataDisplayManager?.flashcard else {
                    return
                }
                guard let backFlashcard = topView.backDataDisplayManager?.flashcard else {
                    return
                }
                self.output.removeFlashcards([faceFlashcard, backFlashcard])
                self.swipeableView?.swipeTopView(inDirection: .Down)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alertAction) in
            
        }
        alertController.addAction(acceptAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: override
    
    override func setupInitialState() {
        super.setupInitialState()
        
        let swipeableView = ZLSwipeableView(frame: CGRectZero)
        self.view.addSubview(swipeableView)
        self.swipeableView = swipeableView
        self.setNeedsUpdateConstraints = true
        self.swipeableView?.allowedDirection = .Horizontal
        self.swipeableView?.swiping = {view, location, translation in
            if abs(translation.x) < 10 {
                self.goodLabel.alpha = 0
                self.badLabel.alpha = 0
                return
            } else if translation.x > 0 {
                self.goodLabel.alpha = abs(translation.x) / 100.0
            } else if translation.x < 0 {
                self.badLabel.alpha = abs(translation.x) / 100.0
            }
        }
        self.swipeableView?.didEnd =  {view, location in
            self.goodLabel.alpha = 0
            self.badLabel.alpha = 0
        }
        self.goodLabel.alpha = 0
        self.badLabel.alpha = 0
    }
    
}
