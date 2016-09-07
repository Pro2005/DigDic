//
//  IDImageManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/3/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

enum ImageManagerError: ErrorType {
    case NameConflict
}

class IDImageManager {
    private var documentsURL: NSURL {
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    }
    
    // MARK: - Public
    
    func saveImage(image: UIImage) throws -> String? {
        let filename = self.filename()
        let fullPath = try self.fileInDocumentsDirectory(filename)
        if NSFileManager.defaultManager().fileExistsAtPath(fullPath) {
            throw ImageManagerError.NameConflict
        }
        let result = self.saveImage(image, path: fullPath)
        if result {
            return filename
        }
        return nil
    }
    
    func imageByFilename(filename: String) throws -> UIImage? {
        let fullPath = try self.fileInDocumentsDirectory(filename)
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
        return "image_\(Int(timestamp))"
    }
    
    private func fileInDocumentsDirectory(filename: String) throws -> String {
        var fileURL = self.documentsURL.URLByAppendingPathComponent("images")
        if !NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!) {
            try NSFileManager.defaultManager().createDirectoryAtPath(fileURL.path!, withIntermediateDirectories: false, attributes: nil)
        }
        fileURL = fileURL.URLByAppendingPathComponent(filename)
        return fileURL.path!
    }
    
}