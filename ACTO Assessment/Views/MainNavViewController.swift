//
//  MainNavViewController.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class MainNavViewController: UINavigationController {
    let viewModel = NavigationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchAlbums()
        viewModel.fetchPhotos()
    }
}
