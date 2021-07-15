//
//  FDBaseTableViewController.swift
//  FoodDog
//
//  Created by JOSE CARLOS TORRES RIVERA on 11/12/19.
//  Copyright JOSE CARLOS. All rights reserved.
//

import UIKit

class FDBaseTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setThemeLightDefault()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modalDelegate()
    }
    
    func modalDelegate(){
        if let navigationController = self.navigationController {
            if let presentationController = navigationController.presentationController {
                presentationController.delegate = self
            }
        }
    }
    
    func refreshTable(){
        let refreshControl = UIRefreshControl()
        self.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
        
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        // Do your job, when done:
        refreshControl.endRefreshing()
    }
        
    func removeHeaderNFooter(){
        removeHeader()
        removeFooter()
    }
    
    func removeHeader(){
        tableView.tableHeaderView = UIView()
    }
    
    func removeFooter(){
        tableView.tableFooterView = UIView()
    }
    
    func setRegisterCustomCell0(){
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell0, bundle: nil),
                           forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell0)
    }

    func setRegisterCustomCell1() {
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell1,
                                 bundle: nil),
                           forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell1)
    }
    
    func setRegisterCustomCell2() {
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell2,
              bundle: nil),
        forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell2)
    }
    
    func setRegisterCustomCell3() {
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell3,
              bundle: nil),
        forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell3)
    }
    
    func setRegisterCustomCell4() {
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell4,
              bundle: nil),
        forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell4)
    }
    
    func setRegisterCustomCell5() {
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell5,
              bundle: nil),
        forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell5)
    }
    
    func setRegisterCustomCell6() {
        tableView.register(UINib(nibName: Constant.Cell.RegisterCell.CustomCell6,
              bundle: nil),
        forCellReuseIdentifier: Constant.Cell.ReuseIdentifier.Cell6)
    }
    
    func getCell0(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell0, for: indexPath) as? CustomCell0 else {
            return CustomCell0()
        }
        return cell
    }
    
    func getCell1(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell1 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell1, for: indexPath) as? CustomCell1 else {
            return CustomCell1()
        }
        return cell
    }
    
    func getCell2(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell2 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell2, for: indexPath) as? CustomCell2 else {
            return CustomCell2()
        }
        return cell
    }
    
    func getCell3(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell3 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell3, for: indexPath) as? CustomCell3 else {
            return CustomCell3()
        }
        return cell
    }
    
    
    func getCell4(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell4 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell4, for: indexPath) as? CustomCell4 else {
            return CustomCell4()
        }
        return cell
    }
    
    
    func getCell6(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CustomCell6 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.ReuseIdentifier.Cell6, for: indexPath) as? CustomCell6 else {
            return CustomCell6()
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool
//    {
//        return true
//    }
//    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let closeAction = UIContextualAction(style: .normal, title:  "OK", handler:
//        {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//            print("OK, marked as Closed")
//            success(true)
//        })
//        closeAction.backgroundColor = UIColor.custom(background: .Primary)
//        return UISwipeActionsConfiguration(actions: [closeAction])
//    }
}

extension FDBaseTableViewController:UIAdaptivePresentationControllerDelegate {
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }

           
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController){
        self.alertMessage()
    }
           
    func alertMessage(){
        let alert = UIAlertController(title: "¿Seguro que desea salir sin guardar sus cambios?", message: nil, preferredStyle: .actionSheet)
        

        alert.addAction(UIAlertAction(title: "Continuar", style: .cancel) { (_ ) in

        })
        if let navigationController = self.navigationController {
            if navigationController.viewControllers[0] != self {
                alert.addAction(UIAlertAction(title: "Regresar", style: .default) { (_ ) in
                    self.navigationController?.popToRootViewController(animated: true)
                })
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        alert.addAction(UIAlertAction(title: "Salír", style: .default) { (_ ) in
            self.dismiss(animated: true, completion: nil)
        })
        self.present(alert, animated: true, completion: nil)
    }
}

protocol FDBaseTableViewDataPickerControllerDelegate {
    func pickerTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

class FDBaseTableViewDataPickerController: FDBaseTableViewController {
    var indexData:IndexPath? = nil
    var cData = [Int:[FDCustomDataCell]]()
    var delegate:FDBaseTableViewDataPickerControllerDelegate!
    var heightToCell:CGFloat = 44.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegisterCustomCell3()
        setRegisterCustomCell1()
    }

    func mergeData(_ dataToMerge:[Int:[FDCustomDataCell]]...){
        for dtm in dataToMerge {
            mergeData(dtm)
        }
    }
    
    private func mergeData(_ dataToMerge:[Int:[FDCustomDataCell]]){
        cData.merge(dataToMerge){(current, _) in current}
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !setDataPicker(tableView, didSelectRowAt: indexPath)  {
            if let d = delegate {
                d.pickerTableView(tableView, didSelectRowAt: indexPath)
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return cData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cData[section]!.count
    }
        
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if let tempIndex = indexData,
//            IndexPath(row: tempIndex.row + 1, section: tempIndex.section) == indexPath {
//            return 162.0
//        }
//        return heightToCell
//    }
    
    func setDataPicker(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Bool{
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell3 {
            if  cell.isShowDatePicker {
                tableView.beginUpdates()
                self.hiddenDataPicker(cell: cell, didSelectRowAt: indexPath)
                cell.lblSave.alpha = 0.0
                tableView.endUpdates()
            }
            else {
                if indexData == nil {
                    tableView.beginUpdates()
                    self.showDataPicker(cell: cell, didSelectRowAt: indexPath)
                    cell.lblSave.alpha = 1.0
                    tableView.endUpdates()
                }
                else {
                    _ = setDataPicker(tableView, didSelectRowAt: indexData!)
                    _ = setDataPicker(tableView, didSelectRowAt: indexPath)
                }
            }
            return true
        }
        return false
    }
    
    func hiddenDataPicker(cell:CustomCell3, didSelectRowAt indexPath: IndexPath) {
        cell.isShowDatePicker = false
        if var section = cData[indexPath.section] {
            let position = (indexPath.row + 1)
            section.remove(at: position)
            cData[indexPath.section] = section
            tableView.deleteRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .fade)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        indexData = nil
    }
    
    func showDataPicker(cell:CustomCell3, didSelectRowAt indexPath: IndexPath) {
        if var section = cData[indexPath.section] {
            let position = (indexPath.row + 1)
            section.insert(FDCustomDataCell(type: .Cell1), at: position)
            cData[indexPath.section] = section
            cell.isShowDatePicker = true
            if let text = cell.dateTextFiel.text,
                text.count >  0 {
                cell.dateTextFiel.text = text
            }
            else {
                cell.dateTextFiel.text = self.getDate(date: Date())
            }
            tableView.insertRows(at: [IndexPath(row: position, section: indexPath.section)], with: .fade)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        indexData = indexPath
    }
    
    func getDate(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constant.DateFormat.Default
        return dateFormatter.string(from: date)
    }

}


extension FDBaseTableViewDataPickerController:CustomCell1Delegate {
    func pickerDateSelectionChanged(_ sender: UIDatePicker, forEvent event: UIEvent) {
        if let tempIndex = indexData {
            if let cell = tableView.cellForRow(at: tempIndex) as? CustomCell3 {
                cell.dateTextFiel.text = self.getDate(date: sender.date)
            }
        }
    }
}



