//
//  InformationCell.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class InformationCell: UITableViewCell {

    static let reuseIdentifier = "InformationCell"
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        contentView.backgroundColor = .systemBackground
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(entity: InformationEntity) {
        titleLabel.text = entity.title
        contentLabel.text = entity.content
    }
}

private extension InformationCell {
    
    func configureLayout() {
        contentView.addSubviews(titleLabel,contentLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
