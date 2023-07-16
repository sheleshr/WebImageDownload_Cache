//
//  TableViewController.swift
//  ImageCacheTester
//
//  Created by Administrator on 23/06/23.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }


}

extension TableViewController:UITableViewDelegate{

}
extension TableViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count/2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier") as? TableViewCell{
    
            let ob1 = dataArray[indexPath.row*2]
            let ob2 = dataArray[indexPath.row*2+1]
            
            let lbl1 = dataArray[indexPath.row*2].keys.first!
            let lbl2 = dataArray[indexPath.row*2+1].keys.first!
            
            let url1 = URL(string: ob1[ob1.keys.first!]!)
            let url2 = URL(string: ob2[ob2.keys.first!]!)

            cell.leftLbl.text = lbl1
            cell.rightLbl.text = lbl2

            cell.leftImageView.setImageFor(url: url1, placeholder: UIImage(named: "01"))
            cell.rightImageView.setImageFor(url: url2, placeholder: UIImage(named: "02"))

            return cell
        }else{
            let cell = TableViewCell(style: .default, reuseIdentifier: "TableViewCellIdentifier")                      
            return cell
        }
    }
    
    
}
