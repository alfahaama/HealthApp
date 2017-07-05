//
//  treatment.swift
//  Health a-Z
//
//  Created by Yaseen on 21/06/17.
//  Copyright © 2017 Yaseen. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class Treatment: UIViewController {
    @IBOutlet weak var treatmentLabel: UILabel!
    
    @IBOutlet weak var treatmentDescription: UITextView!
    var treatmentLabelText = ""
    var treatmentDescriptionText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        treatmentLabel.text = treatmentLabelText
        treatmentDescription.text = treatmentDescriptionText
        self.automaticallyAdjustsScrollViewInsets = false
    }
}
