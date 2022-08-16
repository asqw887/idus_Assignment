//
//  DetailViewController.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailVM = DetailViewModel()
    private var subInfoDataSource: SubInfoDataSource?
    private var previewDataSource: PreviewDataSource?
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var titleView: TitleView = {
        let view = TitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subInfoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 90, height: 90)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) 
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SubInfoCell.self, forCellWithReuseIdentifier: SubInfoCell.reuseIdentifier)
        collectionView.dataSource = self.subInfoDataSource
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    private var releaseNoteView: ReleaseNoteView = {
        let view = ReleaseNoteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var previewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.reuseIdentifier)
        collectionView.dataSource = self.previewDataSource
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        configureLayout()
        bind()
    }

    convenience init(appID: String){
        self.init()
        detailVM.enquireAllData(with: appID)
    }
    
}

private extension DetailViewController {
    
    func bind(){
        detailVM.detaPageData.bind { [weak self] detailPageEntity in
            guard let header = detailPageEntity?.header, let subInfo = detailPageEntity?.subInfo, let releaseNote = detailPageEntity?.releaseNote, let preview = detailPageEntity?.preview else { return }
            self?.titleView.set(entity: header)
            self?.subInfoDataSource = SubInfoDataSource(entity: subInfo)
            self?.releaseNoteView.set(entity: releaseNote)
            self?.previewDataSource = PreviewDataSource(entity: preview)
            
            DispatchQueue.main.async {
                self?.subInfoCollectionView.dataSource = self?.subInfoDataSource
                self?.subInfoCollectionView.reloadData()
                self?.previewCollectionView.dataSource = self?.previewDataSource
                self?.previewCollectionView.reloadData()
            }
        }
    }
    
    func configureLayout(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleView)
        contentView.addSubview(subInfoCollectionView)
        contentView.addSubview(releaseNoteView)
        contentView.addSubview(previewCollectionView)
        
        
        // ScrollView AutoLayout
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // ContentView AutoLayout
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // titleView AutoLayout
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        // SubcollectionView AutoLayout
        NSLayoutConstraint.activate([
            subInfoCollectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            subInfoCollectionView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 10),
            subInfoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subInfoCollectionView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        // ReleaseNoteView AutoLayout
        NSLayoutConstraint.activate([
            releaseNoteView.topAnchor.constraint(equalTo: subInfoCollectionView.bottomAnchor, constant: 10),
            releaseNoteView.leadingAnchor.constraint(equalTo: subInfoCollectionView.leadingAnchor),
            releaseNoteView.trailingAnchor.constraint(equalTo: subInfoCollectionView.trailingAnchor),
            releaseNoteView.heightAnchor.constraint(equalToConstant: 110),
        ])
        
        
        // previewCollectionView AutoLayout
        NSLayoutConstraint.activate([
            previewCollectionView.topAnchor.constraint(equalTo: releaseNoteView.bottomAnchor, constant: 20),
            previewCollectionView.leadingAnchor.constraint(equalTo: releaseNoteView.leadingAnchor),
            previewCollectionView.trailingAnchor.constraint(equalTo: releaseNoteView.trailingAnchor),
            previewCollectionView.heightAnchor.constraint(equalToConstant: 696 * 0.7),
            previewCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 392 * 0.7, height: 696 * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PreviewCell else { return }
        guard let image = cell.imageView.image else { return }
        let screenShotVC = ScreenShotViewController()
//        screenShotVC.modalPresentationStyle = .fullScreen
        screenShotVC.set(image: image)
        self.present(screenShotVC, animated: true)
    }
}
