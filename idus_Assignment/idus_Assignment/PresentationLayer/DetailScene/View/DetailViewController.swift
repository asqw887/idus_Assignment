//
//  DetailViewController.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailVM = DetailViewModel()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
            guard let header = detailPageEntity?.header else { return }
            self?.titleView.set(entity: header)
        }
    }
    
    func configureLayout(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleView)
        
        
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
        
    }
}
