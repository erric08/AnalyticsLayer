//
//  ViewController.swift
//  TwegApp
//
//  Created by Erric Alfajri on 31/05/19.
//  Copyright © 2019 Erric Alfajri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func trackPurchaseV2(_ sender: Any) {
        let invoice = Common.Invoice()
        AnalyticsManager.instance.trackPurchaseV2(invoice: invoice)
    }
    
    @IBAction func trackPurchaseV4(_ sender: Any) {
        let invoice = APIV4.Invoice()
        let transactions = [Invoiceable()]
        let invoiceTrackable = [InvoiceTrackable()]

        AnalyticsManager.instance.trackPurchaseV4(invoice: invoice, transactions: transactions, invoiceTrackable: invoiceTrackable)
    }
    
    @IBAction func trackFirstPurchase(_ sender: Any) {
        AnalyticsManager.instance.trackFirstPurchase()
    }
    
}

