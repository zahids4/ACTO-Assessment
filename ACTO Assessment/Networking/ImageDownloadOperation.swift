//
//  ImageDownloadOperation.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class ImageDownloadOperations {
    lazy var downloadsInProgress: [IndexPath: DownloadOperation] = [:]
    lazy var operationQueue = OperationQueue()
}

class DownloadOperation: Operation {
    var photoViewModel: PhotoViewModelProtocol
    
    init(_ photoViewModel: PhotoViewModelProtocol) {
        self.photoViewModel = photoViewModel
    }
    
    override func main() {
        if self.isCancelled { return }
        
        guard let imageData = self.photoViewModel.fetchPhoto() else { return }
        
        if self.isCancelled { return }
        
        if !imageData.isEmpty {
            self.photoViewModel.image = UIImage(data:imageData)!
            self.photoViewModel.imageDownloadState = .downloaded
        } else {
            // In a production app this control flow should show a button for the user
            // to re download the image
            self.photoViewModel.imageDownloadState = .failed
        }
    }
    
}
