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
    var setNeedsAddConstraints: Bool = false

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func updateViewConstraints() {
        if self.setNeedsAddConstraints {
            if let swipeableView = self.swipeableView {
                swipeableView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
                swipeableView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
                swipeableView.autoPinEdgeToSuperviewEdge(.Top, withInset: 70)
                swipeableView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 60)
            }

            self.setNeedsAddConstraints = false
        }
        
        super.updateViewConstraints()
    }
    
    // MARK: Actions
    
    @IBAction func didTapAddButton(sender: AnyObject) {
        self.output.didTapAddButton()
    }
    
    @IBAction func didTapLeftButton(sender: AnyObject) {
        self.output.didTapLeftButton()
    }
    
    @IBAction func didTapRightButton(sender: AnyObject) {
        self.output.didTapRightButton()
    }

    // MARK: IDDictionaryDetailViewInput
    
    func updateTitle(title: String) {
        self.title = title
    }
    
    func displayFlashcard(flashcard: IDFlashcard) {
        let swipeableView = ZLSwipeableView(frame: CGRectZero)
        self.view.addSubview(swipeableView)
        
        swipeableView.numberOfActiveView = 1
        swipeableView.nextView = {
            return IDDictionaryDetailFlashcardView(flashcard: flashcard)
        }
        swipeableView.loadViews()
        self.swipeableView = swipeableView
        
        self.setNeedsAddConstraints = true
    }
    
    func flipFlashcard(left: Bool) {
        
//        self.flashcardView?.flipFlashcard(left)
    }
    
}
