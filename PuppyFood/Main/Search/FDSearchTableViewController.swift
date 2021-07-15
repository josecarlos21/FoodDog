//
//  FDSearchTableViewController.swift
//  FoodDog
//
//  Created by José Torres Rivera on 08/11/19.
//  Copyright JOSE CARLOS. All rights reserved.
//


import UIKit

class FDSearchTableViewController: FDBaseTableViewController {
    
    var data = [FDResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setRegisterCustomCell0()
        removeHeader()
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
        if data.count > 0 {
            return data.count
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell0,
                                                       for: indexPath) as? CustomCell0
        {
            if data.count > 0 {
                let r = data[indexPath.row]
                cell.lblTitle.text = r.title
                cell.lblMedium.text = ""
                cell.lblBottom.text = ""
                cell.lblRight.text = ""
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let sectionName: String
        switch section {
            case 0:
                sectionName = "Busqueda"
            default:
                sectionName = ""
        }
        return sectionName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navegation = RootControllerManager.getCurrentNavegation() else{
            return
        }
//        if let detail = UIStoryboard(name: Constant.SB.Name.Detail.rawValue, bundle: nil).instantiateInitialViewController() as? PSAMainDetail
//        {
//            detail.set(data: data.tracking[indexPath.row])
//            navegation.pushViewController(detail, animated: true)
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
        if let destination = segue.destination as? UINavigationController,
            let vc = destination.viewControllers.first as? FDSearchSettingsTableViewController
        {
//            if data.count > 0 {
//                vc.set(data: data)
//            }
        }
    }
    

}
