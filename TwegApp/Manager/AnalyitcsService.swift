//
//  AnalyticsService.swift
//  Common
//
//  Created by erric alfajri on 24/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//


protocol AnalyticsService {
    // We can be tracking some events with a SDK that aren't tracking with another SDK.
    var trackingEvents: Set<AnalyticsEvent> { get set }

    func trackPurchaseV2(invoice: Common.Invoice)
    func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?)
    func trackFirstPurchase()
}

// Convenience methods
extension AnalyticsService {
    func shouldTrack(event: AnalyticsEvent) -> Bool {
        return trackingEvents.contains(event)
    }
}

// Default behavior: empty event
extension AnalyticsService {
    var trackingEvents: Set<AnalyticsEvent> {
        get {
            return []
        }
        set (newArea){
            trackingEvents = newArea
        }
    }
}
