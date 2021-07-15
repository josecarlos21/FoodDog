//
//  FDSearchSettingsTableViewController.swift
//  FoodDog
//
//  Created by JOSE CARLOS TORRES RIVERA on 11/12/19.
//  Copyright JOSE CARLOS. All rights reserved.
//

import UIKit

class FDSearchSettingsTableViewController: FDBaseTableViewDataPickerController {
    private var data:FDHomeResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController.
        config()
    }
    
    func set(data:FDHomeResponse){
        self.data = data
    }
    
    func config(){
        mergeData(
            [0:[FDCustomDataCell(type: .Cell2, title: Constant.Text.ConQuienAcuerdo),
                FDCustomDataCell(type: .Cell3),
                FDCustomDataCell(type: .Cell2, title: Constant.Text.EstatusAtencion)]],
            [1:[FDCustomDataCell(type: .Cell2, title: Constant.Text.NivelImpacto),
                FDCustomDataCell(type: .Cell2, title: Constant.Text.RespCumplimiento),
                FDCustomDataCell(type: .Cell2, title: Constant.Text.ConQuienAcuerdo)]],
            [2:[FDCustomDataCell(type: .Cell4, title: Constant.Text.Vencidas),
                FDCustomDataCell(type: .Cell4, title: Constant.Text.DentroPeriodo)]]
        )
        setRegisterCustomCell2()
        setRegisterCustomCell4()
        self.navigationController?.presentationController?.delegate = self
    }
    
    @IBAction func onTapLeftBarButtom(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapRightBarButtom(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension FDSearchSettingsTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sData = cData[indexPath.section] else {
             return UITableViewCell()
        }
        let cellData = sData[indexPath.row]
        switch cellData.cType {
        case .some(.Cell1):
            let cell = getCell1(tableView, cellForRowAt: indexPath)
            cell.delegate = self
            return cell
        case .some(.Cell2):
            let cell = getCell2(tableView, cellForRowAt: indexPath)
            cell.set(title: cellData.title)
            return cell
        case .some(.Cell3):
            let cell = getCell3(tableView, cellForRowAt: indexPath)
            return cell
        case .some(.Cell4):
            let cell = getCell4(tableView, cellForRowAt: indexPath)
            cell.set(title: cellData.title)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func pickerTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if let sData = cData[indexPath.section]
        {
            switch sData[indexPath.row].identifier {
            default:
                break
            }
        }
    }
    
}

