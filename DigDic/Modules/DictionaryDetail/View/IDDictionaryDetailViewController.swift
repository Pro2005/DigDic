//
//  DictionaryDetailIDDictionaryDetailViewController.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailViewController: IDBaseViewController, IDDictionaryDetailViewInput {
    var output: IDDictionaryDetailViewOutput!
    var flashcardView: IDDictionaryDetailFlashcardView?
    var setNeedsAddConstraintsForFlashcardView: Bool = false

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func updateViewConstraints() {
        if let flashcardView = self.flashcardView {
            if self.setNeedsAddConstraintsForFlashcardView {
                flashcardView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
                flashcardView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
                flashcardView.autoPinEdgeToSuperviewEdge(.Top, withInset: 70)
                flashcardView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 60)
                self.setNeedsAddConstraintsForFlashcardView = false
            }
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
        let view = IDDictionaryDetailFlashcardView(flashcard: flashcard)
        view.reloadData()
        self.view.addSubview(view)
        self.flashcardView = view
        self.setNeedsAddConstraintsForFlashcardView = true
    }
    
    func flipFlashcard(left: Bool) {
        self.flashcardView?.flipFlashcard(left)
    }
    
}
