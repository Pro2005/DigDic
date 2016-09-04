//
//  IDImageManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/3/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDImageManager {
    private var documentsURL: NSURL {
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    }
    
    // MARK: - Public
    
    func saveImage(image: UIImage) -> String? {
        let filename = self.filename()
        let fullPath = self.fileInDocumentsDirectory(filename)
        let result = self.saveImage(image, path: fullPath)
        if result {
            return filename
        }
        return nil
    }
    
    func imageByFilename(filename: String) -> UIImage? {
        let fullPath = self.fileInDocumentsDirectory(filename)
        
        let image = UIImage(contentsOfFile: fullPath)
        return image
    }
    
    // MARK: - Private
    
    private func saveImage(image: UIImage, path: String) -> Bool {
        guard let jpgImageData = UIImageJPEGRepresentation(image, 1.0) else {
            return false
        }
        let result = jpgImageData.writeToFile(path, atomically: true)
        return result
    }
    
    private func filename() -> String {
        let timestamp = NSDate().timeIntervalSince1970
        return String(format: "image_%d", argument: timestamp)
    }
    
    private func fileInDocumentsDirectory(filename: String) -> String {
        let fileURL = self.documentsURL.URLByAppendingPathComponent(filename)
        return fileURL.path!
    }
    
}