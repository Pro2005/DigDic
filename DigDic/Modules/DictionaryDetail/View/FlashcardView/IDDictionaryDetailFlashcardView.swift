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
    let faceView = IDDictionaryDetailFlashcardSubView()
    let backView = IDDictionaryDetailFlashcardSubView()
    var faceDataDisplayManager: IDDictionaryDetailDataDisplayManager?
    var backDataDisplayManager: IDDictionaryDetailDataDisplayManager?
    
    var visibleView: IDDictionaryDetailFlashcardSubView {
        return faceView.hidden ? backView : faceView
    }
    var hiddenView: IDDictionaryDetailFlashcardSubView {
        return faceView.hidden ? faceView : backView
    }
    var setNeedsAddConstraints = false
    
    // MARK: Initializer
    
    init(flashcard: IDFlashcard) {
        super.init(frame: CGRectZero)
        self.setup(flashcard)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public
    
    func reloadData() {
        self.faceView.reloadData()
        self.backView.reloadData()
    }
    
    func flipFlashcard(left: Bool) {
        var options: UIViewAnimationOptions = [.TransitionFlipFromRight, .ShowHideTransitionViews]
        if left {
            options = [.TransitionFlipFromLeft, .ShowHideTransitionViews]
        }
        UIView.transitionFromView(self.visibleView, toView: self.hiddenView, duration: 0.5, options:options, completion: nil)
    }
    
    // MARK: 
    
    override func updateConstraints() {
        if (self.setNeedsAddConstraints) {
            self.autoPinEdgesToSuperviewEdges()
            
            self.faceView.autoPinEdgesToSuperviewEdges()
            self.backView.autoPinEdgesToSuperviewEdges()
            
            self.setNeedsAddConstraints = false
        }
        
        super.updateConstraints()
    }
    
    // MARK: Private
    
    func setup(flashcard: IDFlashcard) {
        self.faceDataDisplayManager = IDDictionaryDetailDataDisplayManager(flashcard: flashcard)
        self.backDataDisplayManager = IDDictionaryDetailDataDisplayManager(flashcard: flashcard.connectedFlashcard!)
        self.faceView.setupTableViewDataSource(self.faceDataDisplayManager!, delegate: self.faceDataDisplayManager!)
        self.backView.setupTableViewDataSource(self.backDataDisplayManager!, delegate: self.backDataDisplayManager!)
        self.addSubview(self.faceView)
        self.addSubview(self.backView)
        self.backView.hidden = true
        self.setNeedsAddConstraints = true
    }
    
}