//
//  SiburungAnalyticsService.swift
//  Common
//
//  Created by erric alfajri on 27/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//


final class SiburungAnalyticsService: AnalyticsService {
    

    var trackingEvents: Set<AnalyticsEvent> = []
    func trackPurchaseV2(invoice: Common.Invoice) {}
    func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?) {    }
    func trackFirstPurchase() {}
}
