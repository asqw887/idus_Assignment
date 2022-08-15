//
//  TitleView.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import UIKit

class TitleView: UIView {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        //TODO: 임시 이미지 교체
        imageView.image = UIImage(systemName: "lightbulb.circle.fill")
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("열기", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TODO: 외부에서 엔티티를 받아와 컴포넌트를 셋팅해주는 메소드
    func set(entity: HeaderEntity){
        DispatchQueue.main.async {
            self.nameLabel.text = entity.appName
            self.imageView.image = entity.image
        }
    }
}

private extension TitleView {
    
    func configureLayout(){
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(openButton)
        
        
        // ImageView AutoLayout
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: self.heightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        // nameLabel AutoLayout
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        // openButton AutoLayout
        NSLayoutConstraint.activate([
            openButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            openButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            openButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    
    
}
