//
//  AnalyticsUtil.swift
//  Common
//
//  Created by erric alfajri on 27/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import Foundation

final class AnalyticsUtil {
    class func isFirstPurchase() -> Bool {
        if UserDefaults.standard.bool(forKey: "hasPurchasedOnce") {
            return true
        }
        return false
    }
}
