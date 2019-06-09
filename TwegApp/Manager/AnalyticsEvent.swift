//
//  AnalyticsEvent.swift
//  Common
//
//  Created by erric alfajri on 24/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import Foundation

enum SDK {
    case facebook
    case moengage
    case adjust
    case siburung
}

enum AnalyticsEvent: Int {
    case purchaseV2
    case purchaseV4
    case firstPurchase
}
