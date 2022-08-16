//
//  PreviewCell.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PreviewCell"
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        contentView.backgroundColor = .systemBackground
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(entity: PreviewEntity){
        self.imageView.image = entity.image
    }
}

private extension PreviewCell {
    func configureLayout() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
