//
//  FacebookAnalyticsService.swift
//  Common
//
//  Created by erric alfajri on 24/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import FBSDKCoreKit
import Alamofire

class FacebookAnalyticsService : AnalyticsService {
    struct EventName {
        static let appPurchase: String = "fb_mobile_purchase" //event for track all purchase
        static let paymentInfo: String = FBSDKAppEventNameAddedPaymentInfo //event for track vp purchase
        static let initiatedCheckout: String = FBSDKAppEventNameInitiatedCheckout
    }
    
    func sendFacebook(eventsName: [String?], eventParam: [String: Any], purchaseAmount: Double?) {
        eventsName.compactMap { $0 }.forEach { (eventName) in
            sendFacebook(
                eventName: eventName,
                eventParam: eventParam,
                purchaseAmount: purchaseAmount
            )
        }
    }
    
    /// submit event data to facebook
    func sendFacebook(eventName: String, eventParam: Parameters, purchaseAmount: Double? = nil) {
        FBSDKAppEvents.logEvent(eventName, valueToSum: purchaseAmount ?? 0, parameters: eventParam)
    }

    var trackingEvents: Set<AnalyticsEvent> = [
        AnalyticsEvent.purchaseV2,
        AnalyticsEvent.purchaseV4,
        AnalyticsEvent.firstPurchase
    ]
    
    func trackPurchaseV2(invoice: Common.Invoice) {
        
    }
    
    func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?) {

    }
    
    func trackFirstPurchase() {
        
    }
}

// Mark: Create param functions.
extension FacebookAnalyticsService {
    /// EventTrackerParam for track product purchase v4.
    private func createV4Param(invoice: APIV4.Invoice,
                               type: String,
                               invoiceTrackable: [InvoiceTrackable]? = nil) -> AnalyticsFacebookParameter {
        let param: AnalyticsFacebookParameter = AnalyticsFacebookParameter(addDefaultValue: true)
        
        // param value form invoice
        param.value = Int64(invoice.amount)
        param.orderID = invoice.invoiceId
        param.contentCategory = "marketplace"
        param.currency = "IDR"
        param.contentType = "product"
        param.totalItems = Int64(invoice.amount)
        
        return param
    }
    
}
