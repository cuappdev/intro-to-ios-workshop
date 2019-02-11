//
//  ViewController.swift
//  RandomGIF
//
//  Created by Kevin Chan on 2/8/19.
//  Copyright © 2019 Kevin Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel: UILabel!
    var gifImageView: UIImageView!
    var newGIFButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Random GIF"
        view.backgroundColor = .white

        setupViews()
        getRandomGIF()
    }

    // MARK: - Initialize and layout views
    func setupViews() {
        // Setup UIImageView which will be used to display the GIF
        gifImageView = UIImageView()
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
        gifImageView.contentMode = .scaleAspectFit
        view.addSubview(gifImageView)

        NSLayoutConstraint.activate([
            gifImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gifImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gifImageView.widthAnchor.constraint(equalToConstant: 300),
            gifImageView.heightAnchor.constraint(equalToConstant: 300)
            ])

        // Setup a label:
        // - has centered text
        // - has blue background color
        // - has white text color
        // - font size of text is 20
        // - has 5 pixel rounded corners
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .blue
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.layer.cornerRadius = 5
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: gifImageView.topAnchor, constant: -30)
            ])

        // Setup a button:
        // - whose title is "Get new GIF!"
        // - has red background color
        // - whose title color is red
        // - title has a font size of 20
        // - has 5 pixel rounded corners
        // - when tapped on, call the newGIFButtonPressed function which will:
        //    - changes the background color of this button to red
        //    - fetches a new GIF from Giphy API
        //    - updates the text of the titleLabel to be the title of the gif
        newGIFButton = UIButton()
        newGIFButton.translatesAutoresizingMaskIntoConstraints = false
        newGIFButton.setTitle("Get new GIF!", for: .normal)
        newGIFButton.backgroundColor = .red
        newGIFButton.setTitleColor(.black, for: .normal)
        newGIFButton.titleLabel?.font = .systemFont(ofSize: 20)
        newGIFButton.layer.cornerRadius = 5
        newGIFButton.addTarget(self, action: #selector(newGIFButtonPressed), for: .touchUpInside)
        view.addSubview(newGIFButton)

        // - Make the button's center x position equal to the center x of the view
        // - Make the button's top edge be 50 pixels below the image view's bottom edge
        NSLayoutConstraint.activate([
            newGIFButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newGIFButton.topAnchor.constraint(equalTo: gifImageView.bottomAnchor, constant: 50)
            ])
    }

    /// The function that is going to be called when we tap on the button
    @objc func newGIFButtonPressed() {
        // Set the newGIFButton background color back to red
        newGIFButton.backgroundColor = .red
        getRandomGIF()
    }

    // MARK: - GET A RANDOM GIF FROM GIPHY API
    func getRandomGIF() {
        let networking = URLSession.shared.request
        let future = networking(Endpoint.getRandomGIF()).decode(APIResponse.self)
        future.observe { (result) in
            switch result {
            case .value(let apiResponse):
                DispatchQueue.main.async {
                    // Get the image URL from the Giphy API and then convert it to a UIImage
                    let gifImage = UIImage.gifImageWithURL(apiResponse.data.image_original_url)
                    self.gifImageView.image = gifImage

                    // Set the titleLabel's text to the title of the gif from Giphy API
                    self.titleLabel.text = apiResponse.data.title

                    // Set the newGIFButton background color back to green
                    self.newGIFButton.backgroundColor = .green
                }
            case .error(let error):
                print(error)
            }
        }
    }

}

