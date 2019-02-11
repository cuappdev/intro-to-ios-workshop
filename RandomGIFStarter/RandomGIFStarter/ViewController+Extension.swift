//
//  ViewController+Extension.swift
//  RandomGIFStarter
//
//  Created by Kevin Chan on 2/10/19.
//  Copyright © 2019 Kevin Chan. All rights reserved.
//

import UIKit

extension ViewController {

//    // UNCOMMENT THIS
//    // MARK: - GET A RANDOM GIF FROM GIPHY API AND THEN UPDATE
//    // THE IMAGE VIEW AND TITLE LABEL APPROPRIATELY
//    func getRandomGIF() {
//        let networking = URLSession.shared.request
//        let future = networking(Endpoint.getRandomGIF()).decode(APIResponse.self)
//        future.observe { (result) in
//            switch result {
//            case .value(let apiResponse):
//                DispatchQueue.main.async {
//                    // Get the image URL from the Giphy API and then convert it to a UIImage
//                    let gifImage = UIImage.gifImageWithURL(apiResponse.data.image_original_url)
//                    self.gifImageView.image = gifImage
//
//                    // Set the titleLabel's text to the title of the gif from Giphy API
//                    self.titleLabel.text = apiResponse.data.title
//
//                    // Set the newGIFButton background color back to green
//                    self.newGIFButton.backgroundColor = .green
//                }
//            case .error(let error):
//                print(error)
//            }
//        }
//    }

}
