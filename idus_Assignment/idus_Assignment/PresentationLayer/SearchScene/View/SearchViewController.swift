//
//  SearchViewController.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/11.
//

import UIKit

class SearchViewController: UIViewController {

    private var searchVM = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setNavigationController()
        bind()
    }
}

private extension SearchViewController {
    
    // MARK: Navigation SearchBar 셋팅
    func setNavigationController(){
        self.navigationItem.title = "검색"
        self.navigationItem.searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController?.searchBar.placeholder = "게임, 앱, 스토리 등"
        self.navigationItem.searchController?.searchBar.delegate = self
    }
    
    func bind() {
        searchVM.isValidAppID.bind { isValid in
            if isValid {
                DispatchQueue.main.async {
                    guard let id = self.navigationItem.searchController?.searchBar.text else { return }
                    let nextVC = DetailViewController(appID: id)
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
            else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "알림", message: "잘못된 APP ID 입니다.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true)
                }
                
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchVM.searchAppID(with: searchBar.text ?? "")
    }
    
}
