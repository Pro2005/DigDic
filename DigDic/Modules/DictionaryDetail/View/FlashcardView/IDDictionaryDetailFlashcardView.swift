//
//  IDDictionaryDetailFlashcardView.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/5/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

private let animationDuration = 0.5

class IDDictionaryDetailFlashcardView: UIView {
    let flashcard: IDFlashcard
    let frontView = IDDictionaryDetailFlashcardSubView()
    let backView = IDDictionaryDetailFlashcardSubView()
    var frontDataDisplayManager: IDDictionaryDetailDataDisplayManager?
    var backDataDisplayManager: IDDictionaryDetailDataDisplayManager?
    
    var visibleView: IDDictionaryDetailFlashcardSubView {
        return frontView.isHidden ? backView : frontView
    }
    var hiddenView: IDDictionaryDetailFlashcardSubView {
        return frontView.isHidden ? frontView : backView
    }
    var setNeedsAddConstraints = false
    
    var swipeLeftCompletionBlock: ((IDDictionaryDetailFlashcardView) -> ())?
    var swipeRightCompletionBlock: ((IDDictionaryDetailFlashcardView) -> ())?
    
    // MARK: Initializer
    
    init(flashcard: IDFlashcard, reverseOrder: Bool) {
        self.flashcard = flashcard
        super.init(frame: CGRect.zero)
        setup(flashcard, reverseOrder: reverseOrder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action
    
    func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            self.flipFlashcard(true)
        }
    }
//    
//    func handleLeftSwipe(_ sender: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: animationDuration, animations: { [weak self] in
//            guard let strongSelf = self else { return }
//            strongSelf.center.x = -strongSelf.frame.maxX * 2.0
//            }) {[weak self] (completed) in
//                guard let strongSelf = self else { return }
//                if let completionBlock = strongSelf.swipeLeftCompletionBlock {
//                    completionBlock(strongSelf)
//                }
//        }
//    }
//    
//    func handleRightSwipe(_ sender: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: animationDuration, animations: { [weak self] in
//            guard let strongSelf = self else { return }
//            strongSelf.center.x = strongSelf.frame.maxX * 2.0
//        }) {[weak self] (completed) in
//            guard let strongSelf = self else { return }
//            if let completionBlock = strongSelf.swipeLeftCompletionBlock {
//                completionBlock(strongSelf)
//            }
//        }
//    }
    
    // MARK: Public
    
    func reloadData() {
        self.frontView.reloadData()
        self.backView.reloadData()
    }
//    
//    func hideWith(leftAnimation: Bool, completionBlock: @escaping () -> ()) {
//        UIView.animate(withDuration: animationDuration, animations: { [weak self] in
//                guard let strongSelf = self else { return }
//                if (leftAnimation) {
//                    strongSelf.center.x = -strongSelf.frame.maxX * 2.0
//                } else {
//                    strongSelf.center.x = strongSelf.frame.maxX * 2.0
//                }
//            }) { (completed) in
//                if completed {
//                    completionBlock()
//            }
//        }
//    }
    
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
    
    func setup(_ flashcard: IDFlashcard, reverseOrder: Bool) {
        self.frontDataDisplayManager = IDDictionaryDetailDataDisplayManager(card: flashcard.frontCard!)
        self.backDataDisplayManager = IDDictionaryDetailDataDisplayManager(card: flashcard.backCard!)
        self.frontView.setupTableViewDataSource(self.frontDataDisplayManager!, delegate: self.frontDataDisplayManager!)
        self.backView.setupTableViewDataSource(self.backDataDisplayManager!, delegate: self.backDataDisplayManager!)
        self.addSubview(self.frontView)
        self.addSubview(self.backView)
        if reverseOrder {
            self.frontView.isHidden = true
        } else {
            self.backView.isHidden = true
        }
//        self.backView.hidden = true
        self.setNeedsAddConstraints = true
        
        let handleLongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(handleLongPressGestureRecognizer)
        
//        let handleLeftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
//        handleLeftSwipeGestureRecognizer.direction = .left
//        self.addGestureRecognizer(handleLeftSwipeGestureRecognizer)
//        
//        let handleRightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
//        handleRightSwipeGestureRecognizer.direction = .right
//        self.addGestureRecognizer(handleRightSwipeGestureRecognizer)
    }
    
    fileprivate func flipFlashcard(_ left: Bool) {
        var options: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        if left {
            options = [.transitionFlipFromLeft, .showHideTransitionViews]
        }
        UIView.transition(from: self.visibleView, to: self.hiddenView, duration: 0.5, options:options, completion: nil)
    }
    
}
