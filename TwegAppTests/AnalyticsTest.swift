//
//  AnalyticsTest.swift
//  TwegAppTests
//
//  Created by Erric Alfajri on 31/05/19.
//  Copyright © 2019 Erric Alfajri. All rights reserved.
//

import XCTest
import Nimble
import Quick
import Cuckoo
import Foundation

@testable import TwegApp

class AnalyticsTest: QuickSpec {
    
    override func spec() {
        analyticsService()
        analyticsEventList()
    }
    
    func analyticsService() {
        describe("test analytics service list") {
            class MockAnalyticsManager: AnalyticsService {
                let adjustAnalyticsService: AnalyticsService = AdjustAnalyticsService()
                let facebookAnalyticsService: AnalyticsService = FacebookAnalyticsService()
                let moengageAnalyticsService: AnalyticsService = MoengageAnalyticsService()
                let siburungAnalyticsService: AnalyticsService = SiburungAnalyticsService()

                var purchaseV2Services = [AnalyticsService]()
                var purchaseV4Services = [AnalyticsService]()
                var firstPurchaseServices = [AnalyticsService]()
                
                func trackPurchaseV2(invoice: Common.Invoice) {
                    purchaseV2Services = [
                        adjustAnalyticsService,
                        facebookAnalyticsService,
                        moengageAnalyticsService
                    ]
                }
                
                func trackPurchaseV4(invoice: APIV4.Invoice?, transactions: [Invoiceable]?, invoiceTrackable: [InvoiceTrackable]?) {
                    purchaseV4Services = [
                        adjustAnalyticsService,
                        facebookAnalyticsService,
                        moengageAnalyticsService
                    ]
                }
                
                func trackFirstPurchase() {
                    firstPurchaseServices = [
                        adjustAnalyticsService,
                        facebookAnalyticsService,
                    ]
                }
            }
            
            let mockAnalyticsManager = MockAnalyticsManager()
            context("get list event") {
                it("should return listed service") {
//                    let adjustAnalyticsService: AnalyticsService = AdjustAnalyticsService()
//                    let facebookAnalyticsService: AnalyticsService = FacebookAnalyticsService()
//                    let moengageAnalyticsService: AnalyticsService = MoengageAnalyticsService()

                    mockAnalyticsManager.trackPurchaseV2(invoice: Common.Invoice())
                    expect(mockAnalyticsManager.purchaseV2Services.count).toEventually(equal(3))
//                    expect(mockAnalyticsManager.purchaseV2Services as NSArray).to(contain(
//                        [adjustAnalyticsService, facebookAnalyticsService, moengageAnalyticsService] as NSArray)
//                    )

                    mockAnalyticsManager.trackPurchaseV4(invoice: nil, transactions: nil, invoiceTrackable: nil)
                    expect(mockAnalyticsManager.purchaseV4Services.count).toEventually(equal(3))
//                    expect(mockAnalyticsManager.purchaseV4Services as NSArray).to(contain(
//                        [adjustAnalyticsService, facebookAnalyticsService, moengageAnalyticsService] as NSArray)
//                    )

                    mockAnalyticsManager.trackFirstPurchase()
                    expect(mockAnalyticsManager.firstPurchaseServices.count).toEventually(equal(2))
//                    expect(mockAnalyticsManager.firstPurchaseServices as NSArray).to(contain(
//                        [adjustAnalyticsService, facebookAnalyticsService] as NSArray)
//                    )

                }
                it("list of service is wrong") {
                    
                }
            }
        }
    }
    
    func analyticsEventList() {
        describe("test facebook analytics event list") {
            class MockFacebookAnalytics: FacebookAnalyticsService { }
            
            var mockedFbAnalytics: MockFacebookAnalytics!
            var mockListEvent: Set<AnalyticsEvent> = []

            context("get list event") {
                beforeEach {
                    mockedFbAnalytics = MockFacebookAnalytics()
                    mockListEvent = []
                }
                it("should return listed event") {
                    mockListEvent = mockedFbAnalytics.trackingEvents
                    mockListEvent = [
                        AnalyticsEvent.purchaseV2,
                        AnalyticsEvent.purchaseV4,
                        AnalyticsEvent.firstPurchase
                    ]
                    expect(mockedFbAnalytics.trackingEvents.count).toEventually(equal(3))
                    expect(mockedFbAnalytics.trackingEvents).toEventually(equal(mockListEvent))
                }
                it("list of event is wrong") {
                    mockedFbAnalytics.trackingEvents.removeFirst()
                    expect(mockedFbAnalytics.trackingEvents.count).toEventually(equal(2))
                    
                    mockedFbAnalytics.trackingEvents.removeAll()
                    expect(mockedFbAnalytics.trackingEvents.isEmpty).toEventually(beTrue())
                    
                    expect(mockedFbAnalytics.trackingEvents).toEventually(equal(mockListEvent))
                }
            }
        }
        
        describe("test adjust analytics event list") {
            class MockAdjustAnalytics: AdjustAnalyticsService { }
            
            var mockedAdjAnalytics: MockAdjustAnalytics!
            var mockListEvent: Set<AnalyticsEvent> = []
            
            context("get list event") {
                beforeEach {
                    mockedAdjAnalytics = MockAdjustAnalytics()
                    mockListEvent = []
                }
                it("should return listed event") {
                    mockListEvent = mockedAdjAnalytics.trackingEvents
                    mockListEvent = [
                        AnalyticsEvent.purchaseV2,
                        AnalyticsEvent.purchaseV4,
                        AnalyticsEvent.firstPurchase
                    ]
                    expect(mockedAdjAnalytics.trackingEvents.count).toEventually(equal(3))
                    expect(mockedAdjAnalytics.trackingEvents).toEventually(equal(mockListEvent))
                }
                it("list of event is wrong") {
                    mockedAdjAnalytics.trackingEvents.removeFirst()
                    expect(mockedAdjAnalytics.trackingEvents.count).toEventually(equal(2))
                    
                    mockedAdjAnalytics.trackingEvents.removeAll()
                    expect(mockedAdjAnalytics.trackingEvents.isEmpty).toEventually(beTrue())
                    
                    expect(mockedAdjAnalytics.trackingEvents).toEventually(equal(mockListEvent))
                }
            }
        }
        
        describe("test moengage analytics event list") {
            //TODO
        }
        
        describe("test siburung analytics event list") {
            //TODO
        }
    }
    
    func facebookAnalyticsTest() {
        //TODO
    }
    
    func AdjustAnalyticsTest() {
        //TODO
    }
    func SiburungAnalyticsTest() {
        //TODO
    }
    
    func MoengageAnalyticsTest() {
        //TODO
    }
}
