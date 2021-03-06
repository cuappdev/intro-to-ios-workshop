//
//  ViewController.swift
//  RandomGIF
//
//  Created by Kevin Chan on 2/8/19.
//  Copyright © 2019 Kevin Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gifImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        /// SET THE TITLE OF THE NAVIGATION BAR

        setupViews()

//        getRandomGIF()
    }

    // MARK: - Initialize and layout views
    func setupViews() {

        // 1. Setup UIImageView which will be used to display the GIF
        gifImageView = UIImageView()
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
        gifImageView.contentMode = .scaleAspectFit
        // Set image to be image of a dog
        // Add it as a subview to the view so that it shows up on our application
        view.addSubview(gifImageView)

        // Constraints for the UIImageView
        // - Make the image view's center x position equal to the center x of the view
        // - Make the image view's center y position equal to the center y of the view
        // - Make the image view have a width of 300 pixels
        // - Make the image view have a height of 300 pixels
        NSLayoutConstraint.activate([
            gifImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gifImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gifImageView.widthAnchor.constraint(equalToConstant: 300),
            gifImageView.heightAnchor.constraint(equalToConstant: 300)
        ])

        //////////////////////////////////////////////////////////////////////////////////////////
        /// Setup the label

        // 2. Setup the label
        // - whose title is "Label!"
        // - has centered text
        // - has blue background color
        // - has white text color
        // - font size of text is 20
        // - has 5 pixel rounded corners
        // - allows text to span more than one line
        // - breaks the text by words to start a new line
        // Add it as a subview to the view so that it shows up on our application

        // Constraints for the label
        // - Make the label's center x position equal to the center x of the view
        // - Make the label's bottom edge be 30 pixels above the image view's top edge
        // - Make the label's left and right edge be 10 pixels from the edges of the screen
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.bottomAnchor.constraint(equalTo: gifImageView.topAnchor, constant: -30)
//            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
//            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
//        ])



        //////////////////////////////////////////////////////////////////////////////////////////
        /// Setup the button

        // 3. Setup the bottom
        // - whose title is "Get new GIF!"
        // - has red background color
        // - whose title color is black
        // - title has a font size of 20
        // - has 5 pixel rounded corners
        // - when tapped on, call the newGIFButtonPressed function which will:
        //    - changes the background color of this button to red
        //    - fetches a new GIF from Giphy API
        //    - updates the text of the titleLabel to be the title of the gif
        // Add it as a subview to the view so that it shows up on our application


        // - Make the button's center x position equal to the center x of the view
        // - Make the button's top edge be 50 pixels below the image view's bottom edge
//        NSLayoutConstraint.activate([
//            newGIFButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            newGIFButton.topAnchor.constraint(equalTo: gifImageView.bottomAnchor, constant: 50)
//            ])
    }

//    /// The function that is going to be called when we tap on the button
//    @objc func newGIFButtonPressed() {
//        print("Hello")
//        // Set the newGIFButton background color back to red
//        newGIFButton.backgroundColor = .red
//        getRandomGIF()
//    }

}

