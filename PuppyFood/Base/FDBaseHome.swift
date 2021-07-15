//
//  FDBaseHome.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDBaseHome: FDBase {
    var searchFilterTableVC:FDSearchTableViewController? {
        let storyboard = UIStoryboard(name: "FDTableViewSearch", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? FDSearchTableViewController {
            return vc
        }
        return nil
    }
    var search:UISearchController! {
        let searchController = UISearchController(searchResultsController: searchFilterTableVC)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constant.Text.Buscar
        ///Genera Filtros
        searchController.isActive = true
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        return searchController
    }
}

extension FDBaseHome {
    func showNhiddenSearchBar() {
        if let navController = navigationController  {
            self.navigationItem.searchController = !(self.navigationItem.searchController != nil) ? self.search : nil
            if self.navigationItem.searchController != nil {
                self.navigationItem.hidesSearchBarWhenScrolling = false
                self.search.searchBar.sizeToFit()
                self.definesPresentationContext = true
            }
            let bounds = navController.navigationBar.bounds
            self.navigationController?.navigationBar.frame =
            CGRect(x: 0, y: 0,
                   width: bounds.width,
                   height: bounds.height + ((self.navigationItem.searchController != nil) ? self.search.searchBar.height: -self.search.searchBar.height))
        }
    }
}

extension FDBaseHome:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
}
extension FDBaseHome:UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController){
        
    }

    func didPresentSearchController(_ searchController: UISearchController){
        
    }

    func willDismissSearchController(_ searchController: UISearchController){
        
    }

    func didDismissSearchController(_ searchController: UISearchController){
        
    }
}

extension FDBaseHome:UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }// return NO to not become first

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }// called when text starts editing

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    } // return NO to not resign first responder

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }// called when text ends editing

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
    } // called when text changes (including clear)

    func searchBar(_ searchBar: UISearchBar,
                   shouldChangeTextIn range: NSRange,
                   replacementText text: String) -> Bool
    {
        return true
    }// called before text changes
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }// called when keyboard search button pressed

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar){
        
    } // called when bookmark button pressed

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }// called when cancel button pressed

    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }// called when search results button pressed

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
    }
    
}

