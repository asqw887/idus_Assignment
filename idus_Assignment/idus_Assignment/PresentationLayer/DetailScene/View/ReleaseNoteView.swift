//
//  ReleaseNoteView.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class ReleaseNoteView: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "새로운 기능"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private var historyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("버전기록", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        
        return label
    }()
    
    private var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    
    private var releaseNoteLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(entity: ReleaseNoteEntity) {
        DispatchQueue.main.async {
            self.versionLabel.text = entity.version
            self.releaseDateLabel.text = entity.releaseDate
            self.releaseNoteLabel.text = entity.releaseNote
        }
    }
}

private extension ReleaseNoteView {
    
    func configureLayout() {
        self.addSubview(titleLabel)
        self.addSubview(historyButton)
        self.addSubview(versionLabel)
        self.addSubview(releaseDateLabel)
        self.addSubview(releaseNoteLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            historyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            versionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: versionLabel.topAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: historyButton.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            releaseNoteLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 10),
            releaseNoteLabel.leadingAnchor.constraint(equalTo: versionLabel.leadingAnchor),
            releaseNoteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            releaseNoteLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
    }
}
