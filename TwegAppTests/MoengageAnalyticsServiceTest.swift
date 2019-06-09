//
//  MoengageAnalyticsServiceTest.swift
//  TwegAppTests
//
//  Created by Erric Alfajri on 09/06/19.
//  Copyright © 2019 Erric Alfajri. All rights reserved.
//

import XCTest
import Nimble
import Quick
import Cuckoo
import Foundation

@testable import TwegApp

class MoengageAnalyticsServiceTest: QuickSpec {
    
    override func spec() {
        class MockMoengage: MoengageAnalyticsService { }
        var mockMoengage: MockMoengage!
        
        describe("test moengage purchaseV2") {
            var mockCommonInvoice: Common.Invoice!
            context("purchaseV2") {
                beforeEach {
                    mockMoengage = MockMoengage()
                    mockCommonInvoice = Common.Invoice()
                }
                it("tracker went well") {
                    mockCommonInvoice = Common.Invoice()
                    mockCommonInvoice.paymentAmount = 100123
                    mockCommonInvoice.voucherAmount = 12000
                    mockCommonInvoice.invoiceId = "inv123123123"
                    
                    mockMoengage.trackPurchaseV2(invoice: mockCommonInvoice)
                    
                    expect(mockMoengage.eventParams.count != 0).toEventually(beTrue())
                    expect(mockMoengage.eventParams
                        .value(forKey: MoengageAnalyticsService.Payload.productPrice as String) as? Int)
                        .toEventually(equal(mockCommonInvoice.paymentAmount))
                    expect(mockMoengage.eventParams
                        .value(forKey: MoengageAnalyticsService.Payload.transactionId as String) as? String)
                        .toEventually(equal(mockCommonInvoice.invoiceId))
                    expect(mockMoengage.eventParams
                        .value(forKey: MoengageAnalyticsService.Payload.voucherAmount as String) as? Int)
                        .toEventually(equal(mockCommonInvoice.voucherAmount))

                }
                it("tracker went wrong") {
                    expect(mockMoengage.eventParams.count == 0).toEventually(beTrue())
                }
            }
        }
    }
}
