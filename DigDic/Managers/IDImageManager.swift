//
//  IDImageManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/3/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

enum ImageManagerError: Error {
    case nameConflict
}

class IDImageManager {
    fileprivate var documentsURL: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    // MARK: - Public
    
    func saveImage(_ image: UIImage) throws -> String? {
        var filename = self.filename()
        var fullPath = try self.fileInDocumentsDirectory(filename)
        
        let separator = "_"
        var attempt = 1
        while FileManager.default.fileExists(atPath: fullPath) {
            var components = filename.components(separatedBy: separator)
            if components.count == 1 {
                filename += "_\(attempt)"
            } else {
                attempt += 1
                components[components.count - 1] = "\(attempt)"
                filename = components.joined(separator: separator)
            }
            fullPath = try self.fileInDocumentsDirectory(filename)
        }
        let result = self.saveImage(image, path: fullPath)
        if result {
            return filename
        }
        return nil
    }
    
    func imageByFilename(_ filename: String) throws -> UIImage? {
        let fullPath = try self.fileInDocumentsDirectory(filename)
        let image = UIImage(contentsOfFile: fullPath)
        return image
    }
    
    func removeImageWithFilename(_ filename: String) throws -> Bool {
        let fullPath = try self.fileInDocumentsDirectory(filename)
        try FileManager.default.removeItem(atPath: fullPath)
        return true
    }
    
    // MARK: - Private
    
    fileprivate func saveImage(_ image: UIImage, path: String) -> Bool {
        guard let jpgImageData = UIImageJPEGRepresentation(image, 1.0) else {
            return false
        }
        let result = (try? jpgImageData.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil
        return result
    }
    
    fileprivate func filename() -> String {
        let timestamp = Date().timeIntervalSince1970
        return "image_\(Int(timestamp))"
    }
    
    fileprivate func fileInDocumentsDirectory(_ filename: String) throws -> String {
        var fileURL = self.documentsURL.appendingPathComponent("images")
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            try FileManager.default.createDirectory(atPath: fileURL.path, withIntermediateDirectories: false, attributes: nil)
        }
        fileURL = fileURL.appendingPathComponent(filename)
        return fileURL.path
    }
    
}
