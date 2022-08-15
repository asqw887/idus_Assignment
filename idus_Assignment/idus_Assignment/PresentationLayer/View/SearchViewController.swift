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
                print("다음 화면으로 이동")
            }
            else {
                print("뭔가 실패함.. ")
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // ViewModel 한테 유효한지 아닌지 물어봐서 얼럿 띄우기 // 화면전환 로직 수행하기
        // searchBar.text
        searchVM.searchAppID(with: searchBar.text ?? "")
    }
    
}
