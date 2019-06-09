//
//  MoengageAnalyticsService.swift
//  Common
//
//  Created by erric alfajri on 27/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import MoEngage

class MoengageAnalyticsService: AnalyticsService {
    struct Payload {
        static let email: NSString = "email"
        static let phone: NSString = "mobile_number"
        static let customerId: NSString = "customer_id"
        static let medium: NSString = "medium"
        static let subcategory: NSString = "subcategory"
        static let subcategoryId: NSString = "subcategory_id"
        static let category: NSString = "category"
        static let productName: NSString = "product_name"
        static let productId: NSString = "product_id"
        static let productUrl: NSString = "product_url"
        static let productDeeplinkUrl: NSString = "product_deeplink_url"
        static let productPrice: NSString = "product_price"
        static let sellerId: NSString = "seller_id"
        static let sellerName: NSString = "seller_name"
        static let provider: NSString = "provider"
        static let shippingPrice: NSString = "shipping_price"
        static let totalItemPrice: NSString = "total_item_price"
        static let totalQuantity: NSString = "total_quantity"
        static let totalPrice: NSString = "total_price"
        static let paymentType: NSString = "payment_type"
        static let promoCampaignID: NSString = "promo_campaign_id"
        static let voucherCode: NSString = "voucher_code"
        static let voucherAmount: NSString = "voucher_amt"
        static let transactionId: NSString = "transaction_id"
        static let keyword: NSString = "keyword"
        static let isResultFound: NSString = "is_result_found"
        static let categoryNameMapping: NSString = "category_name_mapping"
        static let voucherkuData: NSString = "voucherku_data"
    }

    struct EventName {
        static let purchase: String = "MOE_ecommercePurchase"
    }
    
    var eventParams: NSMutableDictionary = NSMutableDictionary()

    private func sendData(_ name: String, andPayload: NSMutableDictionary) {
        MoEngage.sharedInstance().trackEvent(name, andPayload: andPayload)
    }

    var trackingEvents: Set<AnalyticsEvent> = [
        AnalyticsEvent.purchaseV2,
        AnalyticsEvent.purchaseV4
    ]
    
    func trackPurchaseV2(invoice: Common.Invoice) {
        eventParams.removeAllObjects()
        eventParams.setObject(invoice.paymentAmount, forKey: Payload.productPrice)
        eventParams.setObject(invoice.voucherAmount, forKey: Payload.voucherAmount)
        eventParams.setObject(invoice.invoiceId, forKey: Payload.transactionId)
        
        sendData(EventName.purchase, andPayload: eventParams)
    }
    
    func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?) {
        eventParams.removeAllObjects()
        eventParams.setObject("", forKey: Payload.productId)
        eventParams.setObject("", forKey: Payload.productUrl)
        eventParams.setObject(0, forKey: Payload.totalQuantity)
        eventParams.setObject(0, forKey: Payload.shippingPrice)
        
        sendData(EventName.purchase, andPayload: eventParams)
    }
    
    func trackFirstPurchase() {}
}
