//
//  DynamicView.swift
//  Health a-Z
//
//  Created by Yaseen on 13/06/17.
//  Copyright © 2017 Yaseen. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class DynamicView: UIViewController {
    @IBOutlet weak var symptomName: UILabel!
    @IBOutlet weak var symptomDescription: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var labelText = String()
    var descriptionText = String()
    var diagnosisText = String()
    var sampleText = "inconvenience regretted no data available for now"
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("************************")
//        print(labelText)
        symptomName.text = labelText
        symptomDescription.text = descriptionText

        
        
        //MARK: Designing TextView and Labels
        
        symptomName.font = UIFont.boldSystemFont(ofSize: 20.0)
//        diagnosisLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
//        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        self.automaticallyAdjustsScrollViewInsets = false
        //symptomDescription.layer.borderWidth = 1
        symptomDescription.layer.cornerRadius = 5
        symptomDescription.textAlignment = NSTextAlignment.justified
        //diagnosisDescription.layer.borderWidth = 1
//        diagnosisDescription.layer.cornerRadius = 5
//        diagnosisDescription.textAlignment = NSTextAlignment.justified
        
    }

//    @IBAction func treatmentBtn(_ sender: AnyObject) {
//        print("tests clicked")
//        let viewName = "treatmentDescription"
//        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: viewName) as! Treatment
//        destinationView.treatmentLabelText = "testing"
//        destinationView.treatmentDescriptionText = "testingggggggggg"
//        self.navigationController?.pushViewController(destinationView, animated: false)
//        
//    }
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
}
