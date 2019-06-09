//
//  AdjustAnalyticsService.swift
//  Common
//
//  Created by erric alfajri on 27/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import Adjust

class AdjustAnalyticsService: AnalyticsService {
    struct EventName {
        public static let purchase = "a805cg"
        public static let firstPurchase = "b1lvjc"
    }

    var trackingEvents: Set<AnalyticsEvent> = [
        AnalyticsEvent.purchaseV2,
        AnalyticsEvent.purchaseV4,
        AnalyticsEvent.firstPurchase
    ]
    
    func trackPurchaseV2(invoice: Common.Invoice) {
        adjustTrack(
            event: EventName.purchase,
            amount: Double(invoice.totalAmount),
            invoiceId: invoice.invoiceId,
            callbackParams: [
                "user_id": "",
                "invoice_id": invoice.invoiceId,
                "transaction_id": invoice.transactionId
            ]
        )
    }
    
    func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?) {
        guard let invoice = invoice else { return }
        adjustTrack(
            event: EventName.purchase,
            amount: Double(invoice.amount),
            invoiceId: invoice.transactionId,
            callbackParams: [
                "user_id": "",
                "invoice_id": invoice.invoiceId,
                "transaction_id": invoice.transactionId
            ]
        )
    }
    
    func trackFirstPurchase() {
        
    }
    
    func adjustTrack(event: String,
                     amount: Double = 0,
                     invoiceId: String? = nil,
                     callbackParams: [String: String]? = nil) {
        let adjustEvent: ADJEvent? = ADJEvent(eventToken: event)
        if amount > 0 {
            adjustEvent?.setRevenue(amount, currency: "IDR")
        }
        if let invId: String = invoiceId {
            adjustEvent?.setTransactionId(invId)
        }
        if let params: [String: String] = callbackParams {
            for (key, value) in params {
                adjustEvent?.addCallbackParameter(key, value: value)
            }
        }
        Adjust.trackEvent(adjustEvent)
    }
}
