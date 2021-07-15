//
//  FDHome.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDHome: FDBaseHome {
    
    var workItem:DispatchWorkItem = DispatchWorkItem {}
    
        
    @IBOutlet weak var containerSearch: UIView!
    @IBOutlet weak var layoutConstraitTopHome: NSLayoutConstraint!
    var leftTable:FDHomeTableView!
    @IBOutlet weak var homeScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerSearch.alpha = 0
        homeScroll.delegate = self
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let followView = segue.destination as? FDHomeTableView {
            if segue.identifier == Constant.SB.SegueIdentifier.HomeTableLeft.rawValue{
                if let respConcluded = JSONHelper.getLocal(forResource: .puppyCatalog) as? FDResponse {
                    followView.data = respConcluded
                }
                leftTable = followView
            }
        }
    }
    
}

extension FDHome {
    @IBAction func homeSegmentAction(_ sender: UISegmentedControl, forEvent event: UIEvent)
    {
        let index = sender.selectedSegmentIndex 
        homeScroll.setContentOffset( CGPoint(x: (self.view.width * CGFloat(index)), y: 0), animated: true)
//        search.searchBar.selectedScopeButtonIndex = index
    }
    @IBAction func tapRightSeachButton(_ sender: Any) {
        showNhiddenSearchBar()
    }
    
    override func updateSearchResults(for searchController: UISearchController) {
        workItem.cancel()
        workItem = DispatchWorkItem {
            guard let searchText = searchController.searchBar.text else {
                return
            }
            guard let searchVC = searchController.searchResultsController as? FDSearchTableViewController else {
                return
            }
            guard searchText.count > 3 else {
                searchVC.data = [FDResult]()
                searchVC.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
                return
            }
            let index = searchController.searchBar.selectedScopeButtonIndex
            var array:[FDResult] = []
            switch index {
            case 1:
                if let data = self.leftTable.data {
                    array = array + data.result
                }
                break
            default:
                if let data = self.leftTable.data {
                    array = array + data.result
                }
                break
            }
            
            let dataTemp = array.filter { (element:FDResult) -> Bool in
                let tempArray = element.ingredients.split(separator: ",")
                for t in tempArray {
                    if String(t).trimmingCharacters(in: .whitespaces).contains(searchText.lowercased()) { return true }
                }
                return false
            }
            
            searchVC.data = dataTemp
            searchVC.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: workItem)
     

    }
    
    override func willPresentSearchController(_ searchController: UISearchController){
        homeScroll.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.containerSearch.alpha = 1.0
        }
    }
    override func willDismissSearchController(_ searchController: UISearchController){
        homeScroll.isHidden = false
        self.containerSearch.alpha = 0.0
    }
}

extension FDHome:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index:Int = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        search.searchBar.selectedScopeButtonIndex = index
    }
}
