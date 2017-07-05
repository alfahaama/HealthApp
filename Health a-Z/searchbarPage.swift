//
//  searchbarPage.swift
//  Health a-Z
//
//  Created by Yaseen on 12/06/17.
//  Copyright © 2017 Yaseen. All rights reserved.
//

import Foundation
import UIKit


class searchbarPage: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var btnClicked = ""
    var filteredSearch = [String]()
    var currentValue = String()
    var jsonToBeloaded = ""
    let searchController = UISearchController(searchResultsController: nil)
    var items = [String]()
    var symptomDescrip = [String]()
    var diagnosisDescrip = [String]()
    let cellReuseIdentifier = "cell"
    var symptomDescriptionCombined = [String:String]()
    var symptomDiagnosisCombined = [String:String]()
    var testDictionary = [(String,String)]()
    var jsnnn:[String:String]?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    //MARK: Switch case to select JSOn file
        //pathToJson urlToJson dataOfJson
        
        
        switch btnClicked {
        case "symptom" :
            guard let pathToJson = Bundle.main.path(forResource: "symptom_description" , ofType: "json")
                else{return}
            let u = URL(fileURLWithPath: pathToJson)
            do{
                let d = try Data(contentsOf: u)
                print(d)
                 let jsn =  try JSONSerialization.jsonObject(with: d, options: .allowFragments) //as? [String:Any]
                guard let dict = jsn as? [String:String] else{return}
                jsnnn = dict
                //print(dict["Foreign Body in the Eye Symptoms and Signs"]!)
                
            }
            catch{
                print("************ lalallalaal *****")
                print(error)
            }
            //jsonDescriptionToBeloaded(str:"symptom_description")
               jsonToBeloaded = "symptomsnames"

        case "drugs" :
           
                jsonToBeloaded = "drugname"
        case "disease" :
            guard let pathToJson = Bundle.main.path(forResource: "disease_desc" , ofType: "json")
                else{return}
            let u = URL(fileURLWithPath: pathToJson)
            do{
                let d = try Data(contentsOf: u)
                print(d)
                let jsn =  try JSONSerialization.jsonObject(with: d, options: .allowFragments) //as? [String:Any]
                guard let dict = jsn as? [String:String] else{return}
                jsnnn = dict
//                print(dict["Abscesses, Skin (Boils)"]!)
                    print(jsnnn)
            }
            catch{
                print("************ lalallalaal *****")
                print(error)
            }
                jsonToBeloaded = "diseasenames"
        case "tests" :
            guard let pathToJson = Bundle.main.path(forResource: "test_desc" , ofType: "json")
                else{return}
            let u = URL(fileURLWithPath: pathToJson)
            do{
                let d = try Data(contentsOf: u)
                print(d)
                let jsn =  try JSONSerialization.jsonObject(with: d, options: .allowFragments) //as? [String:Any]
                guard let dict = jsn as? [String:String] else{return}
                jsnnn = dict
                print(dict["Stitches"]!)
                
            }
            catch{
                print("************ lalallalaal *****")
                print(error)
            }
                jsonToBeloaded = "testnames"
        default:
                print("no buton clicked")
        }
        
        
       // print (jsn?["Foreign Body in the Eye Symptoms and Signs"])
//        guard let p = Bundle.main.path(forResource: "symptom_description" , ofType: "json")
//            else{return}
//        print("************ lalallalaallalalalalaal *****")
//
//        let u = URL(fileURLWithPath: p)
//
//        do{
//            let d = try Data(contentsOf: u)
//            print(d)
//            let jsn =  try JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [String:Any]
//            print (jsn?["Foreign Body in the Eye Symptoms and Signs"])
//            
//        }
//        catch{
//            print("************ lalallalaal *****")
//            print(error)
//        }
        //MARK: JSON Parsing
        
        guard let path = Bundle.main.path(forResource: jsonToBeloaded , ofType: "json") else{ return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json =  try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let array = json as? [String]
           // guard let jsonArray = array?["symptoms"] as? [[String: Any]] else{return}
            for name in array!{
                guard let names = name as? String else{return}
                //print(names)
                items.append(names)
            }
            
            
//            print("helooooooooo testing ")
//            print((jsnnn?["Foreign Body in the Eye Symptoms and Signs"]!)!)
//            print("helooooooooo testing 2")
//            print(items[0])
//            var abc = 0
//            var pqr = 0
//            for xx in items{
//                print("helooooooooo testing 3")
//                if jsnnn?[xx] != nil{
////                    print(jsnnn?[xx])
//                    pqr += 1
//                }
//                else{
//                    abc += 1
//                    print("found no match *********** for \(xx)")
//                }
//            }
//            print(abc)
//            print(pqr)
//            for sympDesc in jsonArray{
//                guard let des = sympDesc["description"] as? String else {return}
//                symptomDescrip.append(des)
//                //print(des)
//            }
//            
//            for diagDesc in jsonArray{
//                guard let diag = diagDesc["diagnosis"] as? String else {return}
//                diagnosisDescrip.append(diag)
//                
//            }
//            for i in array! {
//               items.append(i)
//           }
            
        //MARK: forming dictioaries
         //  symptomDescriptionCombined = combine(str1: items, str2: symptomDescrip)
          //  symptomDiagnosisCombined = combine(str1: items, str2: diagnosisDescrip)
//            print(symptomDescriptionCombined)
//            print("******************laalalalalaalal************")
//            print(symptomDiagnosisCombined)
       }
            
        catch{
            print("The Error is ********** \(error)")
        }
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.contentInset = UIEdgeInsetsMake(-65, 0, 0, 0)
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredSearch.count
        }
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let tempName: String
        if searchController.isActive && searchController.searchBar.text != "" {
            tempName = filteredSearch[indexPath.row]
        } else {
            tempName = items[indexPath.row]
        }
        cell.textLabel?.text = tempName
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewName = "DynamicView"
        
        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: viewName) as! DynamicView
        
        if searchController.isActive && searchController.searchBar.text != "" {
            currentValue = filteredSearch[indexPath.row]
        } else {
            currentValue = items[indexPath.row]
        }
        print("You selected cell #\(currentValue)")
        destinationView.labelText = currentValue
        print("babababababababababababababababababababab")
        let dictReturned = combine(str1: items , str2: jsnnn!)
        let keys = Array(dictReturned.keys)
        print("************ lalallalaal *****")
        print(keys)
        print("************ lalallalaal *****")
        if(dictReturned[currentValue] != nil){
            
            destinationView.descriptionText = dictReturned[currentValue]!
        }
        else{
            destinationView.descriptionText = "description for \(currentValue) is currently unavailable"
        }
        self.navigationController?.pushViewController(destinationView, animated: false)
        
//testing json is working 
        print("helooooooooo testing ")
        //print((jsnnn?["Foreign Body in the Eye Symptoms and Signs"]!)!)
        print("helooooooooo testing 2")
        //print(items[0])
        var abc = 0
        var pqr = 0
        for xx in items{
            print("helooooooooo testing 3")
            if jsnnn?[xx] != nil{
                //                    print(jsnnn?[xx])
                pqr += 1
            }
            else{
                abc += 1
                print("found no match *********** for \(xx)")
            }
        }
        print(abc)
        print(pqr)
        
//
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSearch = items.filter { word in
            return word.lowercased().contains(searchText.lowercased())
            
        }
        
        tableView.reloadData()
    }
    
//Mark function to form dictinary
    func combine(str1 : [String], str2 :[String:String]) -> [String: String]{
        var dict = [String: String]()
        for i in str1{
            if str2[i] != nil {
                dict[i] = str2[i]
            }
        }
        
        return dict
    }

//    funtion to load json description dynamically 
//    func jsonDescriptionToBeloaded(str:String) -> [String:String]{
//        guard let pathToJson = Bundle.main.path(forResource: "disease_desc" , ofType: "json")
//            else{return ["oh":"error"]}
//        let u = URL(fileURLWithPath: pathToJson)
//        do{
//            let d = try Data(contentsOf: u)
//            print(d)
//            let jsn =  try JSONSerialization.jsonObject(with: d, options: .allowFragments) //as? [String:Any]
//            guard let dict = jsn as? [String:String] else{return ["oh":"error"]}
//            jsnnn = dict
//            //                print(dict["Abscesses, Skin (Boils)"]!)
//            print(jsnnn)
//        }
//        catch{
//            print("************ lalallalaal *****")
//            print(error)
//        }
//        return jsnnn!
//    }
}



extension searchbarPage: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContentForSearchText(searchText: searchController.searchBar.text!)
        
    }
}





