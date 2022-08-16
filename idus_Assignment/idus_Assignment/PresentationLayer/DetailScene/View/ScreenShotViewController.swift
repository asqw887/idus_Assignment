//
//  ScreenShotViewController.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class ScreenShotViewController: UIViewController {

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        doneButton.addTarget(self, action: #selector(touchedDoneButton(_:)), for: .touchUpInside)
        configureLayout()
    }
    
    func set(image: UIImage) {
        self.imageView.image = image
    }

}

private extension ScreenShotViewController {
    func configureLayout() {
        view.addSubview(doneButton)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            doneButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    @objc
    func touchedDoneButton(_ sender: UIButton){
        self.dismiss(animated: true)
    }
}
