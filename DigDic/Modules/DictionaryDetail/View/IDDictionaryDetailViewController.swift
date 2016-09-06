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
    
    // MARK: override
    
    override func setupInitialState() {
        super.setupInitialState()
        
        let swipeableView = ZLSwipeableView(frame: CGRectZero)
        self.view.addSubview(swipeableView)
        self.swipeableView = swipeableView
        self.setNeedsUpdateConstraints = true
    }
    
}
