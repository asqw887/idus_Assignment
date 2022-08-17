//
//  SubInfoCell.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class SubInfoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SubInfoCell"
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.sizeToFit()
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private var footerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.sizeToFit()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(entity: SubInfoEntity) {
        
        titleLabel.text = entity.title
        footerLabel.text = entity.footer
        guard let content = entity.content else {
            contentImageView.image = UIImage(systemName: "person.crop.square")
            configureLayout(isShowImage: true)
            return }
        contentLabel.text = content
        configureLayout(isShowImage: false)
        contentView.invalidateIntrinsicContentSize()
    }

}

private extension SubInfoCell {
    
    func configureLayout(isShowImage: Bool) {
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        if isShowImage {
            stackView.addArrangedSubview(contentImageView)
        } else {
            stackView.addArrangedSubview(contentLabel)
        }
        stackView.addArrangedSubview(footerLabel)
        
        NSLayoutConstraint.activate([
            
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 110),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
