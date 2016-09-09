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
        var filename = self.filename()
        var fullPath = try self.fileInDocumentsDirectory(filename)
        
        let separator = "_"
        var attempt = 1
        while NSFileManager.defaultManager().fileExistsAtPath(fullPath) {
            var components = filename.componentsSeparatedByString(separator)
            if components.count == 1 {
                filename += "_\(attempt)"
            } else {
                attempt += 1
                components[components.count - 1] = "\(attempt)"
                filename = components.joinWithSeparator(separator)
            }
            fullPath = try self.fileInDocumentsDirectory(filename)
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
    
    func removeImageWithFilename(filename: String) throws -> Bool {
        let fullPath = try self.fileInDocumentsDirectory(filename)
        try NSFileManager.defaultManager().removeItemAtPath(fullPath)
        return true
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