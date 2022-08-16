//
//  DescriptionView.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class DescriptionView: UIView {

    private var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textContainer.maximumNumberOfLines = 4
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.font = .systemFont(ofSize: 15)
        return textView
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemBackground
        button.addTarget(self, action: #selector(touchedMoreButton(_:)), for: .touchUpInside)
        button.setTitle("접기", for: .selected)
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
    
    func set(entity: DescriptionEntity) {
        DispatchQueue.main.async {
            self.descriptionTextView.text = entity.description
        }
    }
}

private extension DescriptionView {
    func configureLayout() {
        self.addSubview(descriptionTextView)
        self.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: self.topAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            moreButton.bottomAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            moreButton.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor)
        ])
    }
    
    @objc
    func touchedMoreButton(_ sender: UIButton){
        sender.isSelected.toggle()
        
        if sender.isSelected {
            descriptionTextView.textContainer.maximumNumberOfLines = 0
            descriptionTextView.invalidateIntrinsicContentSize()
        } else {
            descriptionTextView.textContainer.maximumNumberOfLines = 4
            descriptionTextView.invalidateIntrinsicContentSize()
        }
    }
}
