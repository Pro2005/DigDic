//
//  IDDictionaryDetailFlashcardView.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/5/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionaryDetailFlashcardView: UIView {
    let flashcard: IDFlashcard
    let frontView = IDDictionaryDetailFlashcardSubView()
    let backView = IDDictionaryDetailFlashcardSubView()
    var frontDataDisplayManager: IDDictionaryDetailDataDisplayManager?
    var backDataDisplayManager: IDDictionaryDetailDataDisplayManager?
    
    var visibleView: IDDictionaryDetailFlashcardSubView {
        return frontView.hidden ? backView : frontView
    }
    var hiddenView: IDDictionaryDetailFlashcardSubView {
        return frontView.hidden ? frontView : backView
    }
    var setNeedsAddConstraints = false
    
    // MARK: Initializer
    
    init(flashcard: IDFlashcard) {
        self.flashcard = flashcard
        super.init(frame: CGRectZero)
        self.setup(flashcard)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action
    
    func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .Began {
            self.flipFlashcard(true)
        }
    }
    
    // MARK: Public
    
    func reloadData() {
        self.frontView.reloadData()
        self.backView.reloadData()
    }
    
    // MARK: 
    
    override func updateConstraints() {
        if (self.setNeedsAddConstraints) {
            self.autoPinEdgesToSuperviewEdges()
            
            self.frontView.autoPinEdgesToSuperviewEdges()
            self.backView.autoPinEdgesToSuperviewEdges()
            
            self.setNeedsAddConstraints = false
        }
        
        super.updateConstraints()
    }
    
    // MARK: Private
    
    func setup(flashcard: IDFlashcard) {
        self.frontDataDisplayManager = IDDictionaryDetailDataDisplayManager(card: flashcard.frontCard!)
        self.backDataDisplayManager = IDDictionaryDetailDataDisplayManager(card: flashcard.backCard!)
        self.frontView.setupTableViewDataSource(self.frontDataDisplayManager!, delegate: self.frontDataDisplayManager!)
        self.backView.setupTableViewDataSource(self.backDataDisplayManager!, delegate: self.backDataDisplayManager!)
        self.addSubview(self.frontView)
        self.addSubview(self.backView)
        self.backView.hidden = true
        self.setNeedsAddConstraints = true
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    private func flipFlashcard(left: Bool) {
        var options: UIViewAnimationOptions = [.TransitionFlipFromRight, .ShowHideTransitionViews]
        if left {
            options = [.TransitionFlipFromLeft, .ShowHideTransitionViews]
        }
        UIView.transitionFromView(self.visibleView, toView: self.hiddenView, duration: 0.5, options:options, completion: nil)
    }
    
}