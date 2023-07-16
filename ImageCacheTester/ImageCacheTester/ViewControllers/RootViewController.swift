//
//  RootViewController.swift
//  ImageCacheTester
//
//  Created by Administrator on 16/07/23.
//

import UIKit
import SwiftUI

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openUIKITview(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSwiftUIview(_ sender: Any) {
        let vc = UIHostingController(rootView: ContentView())
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
