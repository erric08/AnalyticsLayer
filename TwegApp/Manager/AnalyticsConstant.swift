//
//  AnalyticsConstant.swift
//  Common
//
//  Created by erric alfajri on 27/05/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import Foundation

final class AnalyticsSdk {
    private var items: [String] = [
        "facebook", "adjust", "siburung"
    ]
    
    func add(sdk: String) {
        items.append(sdk)
    }
    
    func countSdk() -> Int {
        return items.count
    }
    
    func getSdk(atIndex index: Int) -> String? {
        if items.indices.contains(index) {
            return items[index]
        }
        return nil
    }
    
    func getFirstSdk() -> String? {
        return items.first
    }
    
    func has(sdk: String) -> Bool {
        return items.filter { $0 == sdk }.count > 0
    }
    
    func removeSdk(atIndex index: Int) {
        items.remove(at: index)
    }
}

class Common {
    class Invoice {
        public var transactionId: String = ""
        public var invoiceId: String = ""
        public var amount: Int = 0 // barang
        public var codedAmount: Int = 0
        public var adminAmount: Int = 0
        public var paymentAmount: Int = 0
        public var voucherAmount: Int = 0
        public var totalAmount: Int = 0
        public var type: String = ""

        public func setTotalAmount(amount: Int) {
            totalAmount = amount
        }
    }
}
class Invoiceable {
    
}
class InvoiceTrackable {
    public var purchaseEvent: String = ""
    public var purchaseParams: [String: Any] = [:]
    public var purchaseCustomParams: [String: Any]? = [:]
}
class APIV4 {
    class Invoice {
        public var transactionId: String = ""
        public var type: String = ""
        public var invoiceId: String = ""
        public var amount: Int = 0 // barang
        public var codedAmount: Int = 0
        public var totalAmount: Int = 0 // subtotalAmount - voucherAmount
        public var paymentAmount: Int = 0 // totalAmount + serviceFee
        public var voucherAmount: Int = 0 // potongan voucher
    }
}

public extension String {
    
    /// check if string equals other string (insensitive case)
    ///
    /// - Parameter otherString: other string
    /// - Returns: true if string equals other string
    public func equalIgnoreCase(anotherString: String) -> Bool {
        return self.lowercased() == anotherString.lowercased()
    }
    
    /// convert string to int
    ///
    /// - Returns: int value of this string, return default if string can't be converted
    public func intValue(def: Int = 0) -> Int {
        return Int(self) ?? def
    }
    
    public func decodeFromBase64() -> String? {
        guard let data: Data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
}
