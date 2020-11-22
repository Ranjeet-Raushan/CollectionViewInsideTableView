//  ViewController.swift
//  EnActSystemTask
//  Created by Ranjeet Raushan on 18/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchResultsUpdating { // search control - UISearchResultsUpdating
    var categories = [ImageCategory]() //to hold the data to be displayed
    var resultSearchController = UISearchController() // search control
    @IBOutlet weak var myTableView: UITableView!
    let headerReuseId = "TableHeaderViewReuseId"
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* search control - starts here */
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.placeholder = "Search By Location,Area or Pin Code"
            
            myTableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        /* search control - ends here */
        
        // Do any additional setup after loading the view, typically from a nib.
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
        self.myTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: headerReuseId)
        setupData()
        self.myTableView.reloadData()
    }
    
    
    //MARK: Data initlisers methods
    func setupData() {
        for index in 0..<3 {
            var infoDict = [String:Any]()
            infoDict = dataForIndex(index: index)
            let aCategory = ImageCategory(withInfo: infoDict)
            categories.append(aCategory)
        }
    }
    
    func dataForIndex(index:Int) -> [String:Any] {
        var data = [String:Any]()
        switch index {
        case 0:
            data["cat_name"] = "Just In"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "just-in pics shot in the Forest"
            data["cat_items"] = ["Image_0","Image_1","Image_2","Image_3","Image_4"]
        case 1:
            data["cat_name"] = "Designer Homes"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "designer-homes pics shot in the Forest"
            data["cat_items"] = ["Image_5","Image_6","Image_7","Image_8","Image_9"]
        case 2:
            data["cat_name"] = "Near You"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "near-you pics shot in the Lake"
            data["cat_items"] = ["Image_10","Image_11","Image_12","Image_13","Image_14"]
        default:
            break;
        }
        return data
    }
    /* search control - starts here */
    func updateSearchResults(for searchController: UISearchController) {
        print("Implementing Search in table view")
    }
    /* search control - ends here */
    
    //MARK:Tableview Delegates and Datasource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return  categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell.customCell
        }
        let aCategory = self.categories[indexPath.section]
        cell?.updateCellWith(category: aCategory)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerReuseId) as? CustomHeaderView
        if view == nil {
            view = CustomHeaderView.customView
        }
        let aCategory = self.categories[section]
        view?.headerLabel.text = aCategory.name
        return view
    }
}



