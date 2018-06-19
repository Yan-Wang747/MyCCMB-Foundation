//
//  ViewController.swift
//  MyCCMB Foundation
//
//  Created by Student on 2018-06-15.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ChildTabelViewController: UITableViewController, UISearchResultsUpdating, CategorySelectionDelegate {
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    func categorySelected(_ categoryIndex: Int) {
        tableView.scrollToRow(at: IndexPath(row: 0, section: categoryIndex), at: .top, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            
            tableView.reloadData()
        }
    }
    
    var categories: [String]?
    var facts: [[String]]?
    var searchFacts: [[String]]?
    var searchCategories: [String]?
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        
        let displayModeButton = self.splitViewController?.displayModeButtonItem
        
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = displayModeButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return searchCategories?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchFacts?[section].count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactCell")
        cell?.detailTextLabel?.text = searchFacts?[indexPath.section][indexPath.row] ?? ""
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchCategories?[section]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func filterContent(for searchText: String) {
        
        if searchText == "" {
            self.searchFacts = facts
            self.searchCategories = categories
            
            return
        }
        
        guard let categories = categories, let facts = facts else {
            return
        }
        
        var searchFacts: [[String]] = []
        var searchCategories: [String] = []
        
        for categoryIndex in 0..<categories.count {
            let selectedFacts = facts[categoryIndex].filter { fact in
                return fact.lowercased().contains(searchText.lowercased())
            }
            
            if selectedFacts.count > 0 {
                searchFacts.append(selectedFacts)
                searchCategories.append(categories[categoryIndex])
            }
        }
        
        self.searchFacts = searchFacts
        self.searchCategories = searchCategories
    }
    
    @IBAction func tapToTop(_ gestureRecognizer : UITapGestureRecognizer ) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .ended {      // Move the view down and to the right when tapped.
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}
