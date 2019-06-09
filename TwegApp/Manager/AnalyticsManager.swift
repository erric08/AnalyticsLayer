//
//  AnalyticsManager.swift
//  Common
//
//  Created by erric alfajri on 24/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import Foundation

class AnalyticsManager: AnalyticsService {
    
    // The list of services added to this class as observers.
    internal private(set) var services = [AnalyticsService]()
    
    public static var instance = AnalyticsManager()
    
    #if DEBUG
    internal class func swap(instance: AnalyticsManager) {
        guard (NSClassFromString("XCTest") != nil) else {
            fatalError("Don't use this outside unit test!")
        }
        AnalyticsManager.instance = instance
    }
    #endif
    
    private init() {}
    
    /**
     Adds a service as an observer.
     */
    func initiateActiveService() {
        let adjustAnalyticsService: AdjustAnalyticsService = AdjustAnalyticsService()
        let facebookAnalyticsService: FacebookAnalyticsService = FacebookAnalyticsService()
        let moengageAnalyticsService: MoengageAnalyticsService = MoengageAnalyticsService()
        let siburungAnalyticsService: SiburungAnalyticsService = SiburungAnalyticsService()
        
        self.services =
            [adjustAnalyticsService,
             facebookAnalyticsService,
             moengageAnalyticsService,
             siburungAnalyticsService]
    }
    
    func trackPurchaseV2(invoice: Common.Invoice) {
        // When an event is tracked by AnalyticsManager,
        // it will notify all the services that has been added to it.
        for service in services where service.shouldTrack(event: .purchaseV2) {
            service.trackPurchaseV2(invoice: invoice)
        }
        if AnalyticsUtil.isFirstPurchase() {
            trackFirstPurchase()
        }
    }
    
    func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?) {
        // When an event is tracked by AnalyticsManager,
        // it will notify all the services that has been added to it.
        for service in services where service.shouldTrack(event: .purchaseV4) {
            service.trackPurchaseV4(invoice: invoice, transactions: transactions, invoiceTrackable: invoiceTrackable)
            if AnalyticsUtil.isFirstPurchase() {
                service.trackFirstPurchase()
            }
        }
    }
    
    func trackFirstPurchase() {
        for service in services where service.shouldTrack(event: .firstPurchase) {
            service.trackFirstPurchase()
        }
    }
}
