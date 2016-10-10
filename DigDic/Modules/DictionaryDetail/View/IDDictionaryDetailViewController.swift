//
//  DictionaryDetailIDDictionaryDetailViewController.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

private let FlashcardViewBottomOffset: CGFloat = 60.0

class IDDictionaryDetailViewController: IDBaseViewController, IDDictionaryDetailViewInput {
    var output: IDDictionaryDetailViewOutput!
    @IBOutlet var goodLabel: UILabel!
    @IBOutlet var badLabel: UILabel!
    
    var flashcards = [IDFlashcard]()
    var flashcardIndex = 0
    var reverseOrder = false

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func updateViewConstraints() {
        
        
        super.updateViewConstraints()
    }
    
    // MARK: Actions
    
    @IBAction func didTapAddButton(_ sender: AnyObject) {
        output.didTapAddButton()
    }
    
    @IBAction func didTapRemoveButton(_ sender: AnyObject) {
        output.didTapRemoveButton()
    }
    
    
    func handleLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        output.didLeftSwipe()
    }
    
    func handleRightSwipe(_ sender: UISwipeGestureRecognizer) {
        output.didRightSwipe()
    }

    // MARK: IDDictionaryDetailViewInput
    
    func updateTitle(_ title: String) {
        self.title = title
    }
    
    func displayFlashcards(_ flashcards: [IDFlashcard], reverseOrder: Bool) {
        self._removeFlashcardViewsFromSuperview()

        flashcardIndex = 0
        guard let firstFlashcard = flashcards.first else {
            return;
        }
        
        self.flashcards = flashcards
        self.reverseOrder = reverseOrder
        _addFlashcardViewWith(flashcard: firstFlashcard, reverseOrder: reverseOrder)
    }
    
    func getConfirmationForRemoving() {
        let alertController = UIAlertController(title: "", message: "Are you sure?", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Remove", style: .destructive) { (alertAction) in
            let flashcard = self.flashcards[self.flashcardIndex]
            self.output.removeFlashcard(flashcard)
            self.flashcards.remove(at: self.flashcardIndex)
            self.showNextFlashcards()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
            
        }
        alertController.addAction(acceptAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showNextFlashcards() {
        self._removeFlashcardViewsFromSuperview()
        var index = flashcardIndex
        index += 1
        if index >= flashcards.count {
            return
        }
        
        let nextFlashcard = flashcards[index]
        _addFlashcardViewWith(flashcard: nextFlashcard, reverseOrder: reverseOrder)
        flashcardIndex = index;
    }
    
    // MARK: override
    
    override func setupInitialState() {
        super.setupInitialState()

        self.goodLabel.alpha = 0
        self.badLabel.alpha = 0
        
        let handleLeftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        handleLeftSwipeGestureRecognizer.direction = .left
        view.addGestureRecognizer(handleLeftSwipeGestureRecognizer)
        
        let handleRightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        handleRightSwipeGestureRecognizer.direction = .right
        view.addGestureRecognizer(handleRightSwipeGestureRecognizer)
    }
    
    // MARK: private
    
    private func _addFlashcardViewWith(flashcard: IDFlashcard, reverseOrder: Bool) {
        let flashcardView = IDDictionaryDetailFlashcardView(flashcard: flashcard, reverseOrder: reverseOrder)

        if let visibleFlashcardView = _visibleFlashcardView() {
            view.insertSubview(flashcardView, belowSubview: visibleFlashcardView)
        } else {
            view.addSubview(flashcardView)
        }
        
        flashcardView.autoPinEdge(toSuperviewEdge: .left)
        flashcardView.autoPinEdge(toSuperviewEdge: .right)
        flashcardView.autoPinEdge(toSuperviewEdge: .bottom, withInset: FlashcardViewBottomOffset)
        flashcardView.autoPinEdge(toSuperviewEdge: .top)
    }
    
    private func _removeFlashcardViewsFromSuperview() {
        for view in self.view.subviews {
            if let flashcardView = view as? IDDictionaryDetailFlashcardView {
                flashcardView.removeFromSuperview()
            }
        }
    }
    
    private func _visibleFlashcardView() -> IDDictionaryDetailFlashcardView? {
        for view in self.view.subviews {
            if view is IDDictionaryDetailFlashcardView {
                return view as? IDDictionaryDetailFlashcardView
            }
        }
        return nil
    }
    
}
