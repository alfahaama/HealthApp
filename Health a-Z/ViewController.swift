//
//  ViewController.swift
//  Health a-Z
//
//  Created by Yaseen on 12/06/17.
//  Copyright © 2017 Yaseen. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var symptoms: UIButton!
    @IBOutlet weak var drugs: UIButton!
    @IBOutlet weak var disease: UIButton!
    @IBOutlet weak var tests: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = .portrait
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = .all
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: Button action FUnctions
    
    
    @IBAction func symptomBtnClick(_ sender: AnyObject) {
        print("symptom clicked")
        let viewName = "searchListView"
        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: viewName) as! searchbarPage
        destinationView.btnClicked = "symptom"
        self.navigationController?.pushViewController(destinationView, animated: false)
        
    }
    @IBAction func drugsBtnClicked(_ sender: AnyObject) {
//        print("drugs clicked")
//        let viewName = "searchListView"
//        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: viewName) as! searchbarPage
//        destinationView.btnClicked = "drugs"
//        self.navigationController?.pushViewController(destinationView, animated: false)
    }

    @IBAction func diseaseBtnClick(_ sender: AnyObject) {
        print("disease clicked")
        let viewName = "searchListView"
        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: viewName) as! searchbarPage
        destinationView.btnClicked = "disease"
        self.navigationController?.pushViewController(destinationView, animated: false)
    }
    @IBAction func testsBtnCick(_ sender: AnyObject) {
        print("tests clicked")
        let viewName = "searchListView"
        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: viewName) as! searchbarPage
        destinationView.btnClicked = "tests"
        self.navigationController?.pushViewController(destinationView, animated: false)
    }

}

