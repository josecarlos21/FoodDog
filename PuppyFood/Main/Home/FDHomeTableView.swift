//
//  FDHomeTableView.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDHomeTableView: FDBaseTableViewController {
    
    var data:FDResponse!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setRegisterCustomCell0()
        removeHeaderNFooter()
        refreshTable()
    }
    
    func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView?.isHidden = true;
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let d = data , d.result.count > 0 {
            return 1
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.getCell0(tableView, cellForRowAt: indexPath)
        let tracking = data.result[indexPath.row]
        cell.lblTitle.text = tracking.title
        cell.lblMedium.text = tracking.href
        cell.lblBottom.text = tracking.thumbnail
        cell.lblRight.text = ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let detail = UIStoryboard(name: Constant.SB.Name.Detail.rawValue, bundle: nil).instantiateInitialViewController() as? PSAMainDetail
//        {
//            self.navigationController?.pushViewController(detail, animated: true)
//            detail.set(data: data.tracking[indexPath.row])
//        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
