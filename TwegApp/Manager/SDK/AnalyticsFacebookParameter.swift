//
//  AnalyticsFacebookParameter.swift
//  bl_ios
//
//  Created by Dicky Christian on 03/01/19.
//  Copyright © 2019 Bukalapak. All rights reserved.
//

import FBSDKCoreKit

/// Manajemen parameter khusus untuk EventTracker Facebook.
class AnalyticsFacebookParameter {
    private var dictionary: [String: Any] = [:]
    
    public init(addDefaultValue: Bool = false) {
        guard addDefaultValue else { return }
        contentType = "product"
        currency = "IDR"
    }
    
    public func getValue() -> [String: Any] {
        return dictionary
    }
    
    private func set<T>(_ key: String, _ value: T?) {
        if let value: T = value {
            if value is NSNumber {
                dictionary[key] = value
            } else {
                dictionary[key] = "\(value)"
            }
        } else {
            dictionary[key] = nil
        }
    }
    
    private func set<T>(_ key: String, _ values: [T]?) {
        if let values: [T] = values {
            dictionary[key] = "\(values)"
        } else {
            dictionary[key] = nil
        }
    }
    
    private func get<T>(_ key: String) -> T? {
        return dictionary[key] as? T
    }
    
    private func getArr<T>(_ key: String) -> [T]? {
        return (dictionary[key] as? [T])
    }
    
    @discardableResult
    public func join(_ param: AnalyticsFacebookParameter) -> AnalyticsFacebookParameter {
        for (key, value) in param.dictionary {
            set(key, value)
        }
        return self
    }
    
    // Note:
    // - Urutkan setiap variabel dari nilai tunggal ke nilai ganda lalu
    //   urutkan nama variabel dari A~Z untuk mempermudah pemeliharaan(maintenance).
    // - Tambahkan note jika diperlukan agar lebih mudah
    //   mengetahui isi dari variabel tersebut.
    
    public var appVersion: String? {
        get {
            return get("fb_app_version")
        } set {
            set("fb_app_version", newValue)
        }
    }
    
    /// Kategori-0 dari sebuah produk.
    ///
    /// Jika produk ini tidak ada kategorinya,
    /// cukup kirimkan nil.
    public var category0: String? {
        get {
            return get("fb_product_category")
        } set {
            set("fb_product_category", newValue)
        }
    }
    
    /// Kategori-0 dari masing-masing produk.
    ///
    /// Jika produk-i tidak ada kategorinya, tidak perlu dimasukkan
    /// ke array ini ataupun mengirim string kosong ataupun nil.
    public var categories0: [String]? {
        get {
            return getArr("fb_product_category")
        } set {
            set("fb_product_category", newValue)
        }
    }
    
    /// Kategori-1 dari sebuah produk.
    ///
    /// Jika produk ini tidak ada kategorinya,
    /// cukup kirimkan nil.
    public var category1: String? {
        get {
            return get("fb_product_subcategory_1")
        } set {
            set("fb_product_subcategory_1", newValue)
        }
    }
    
    /// Kategori-1 dari masing-masing produk.
    ///
    /// Jika produk-i tidak ada kategorinya, tidak perlu dimasukkan
    /// ke array ini ataupun mengirim string kosong ataupun nil.
    public var categories1: [String]? {
        get {
            return getArr("fb_product_subcategory_1")
        } set {
            set("fb_product_subcategory_1", newValue)
        }
    }
    
    /// Kategori-2 dari sebuah produk.
    ///
    /// Jika produk ini tidak ada kategorinya,
    /// cukup kirimkan nil.
    public var category2: String? {
        get {
            return get("fb_product_subcategory_2")
        } set {
            set("fb_product_subcategory_2", newValue)
        }
    }
    
    /// Kategori-2 dari masing-masing produk.
    ///
    /// Jika produk-i tidak ada kategorinya, tidak perlu dimasukkan
    /// ke array ini ataupun mengirim string kosong ataupun nil.
    public var categories2: [String]? {
        get {
            return getArr("fb_product_subcategory_2")
        } set {
            set("fb_product_subcategory_2", newValue)
        }
    }
    
    /// Kategori dari Event Tracker(?).
    public var contentCategory: String? {
        get {
            return get("fb_content_category")
        } set {
            set("fb_content_category", newValue)
        }
    }
    
    /// ID dari sebuah produk.
    ///
    /// Harus dalam bentuk String36.
    public var contentID: String? {
        get {
            return get(FBSDKAppEventParameterNameContentID)
        } set {
            set(FBSDKAppEventParameterNameContentID, newValue)
        }
    }
    
    /// ID dari masing-masing produk.
    ///
    /// Harus dalam bentuk String36.
    public var contentsID: [String]? {
        get {
            return getArr(FBSDKAppEventParameterNameContentID)
        } set {
            set(FBSDKAppEventParameterNameContentID, newValue)
        }
    }
    
    /// Nama dari sebuah produk.
    public var contentName: String? {
        get {
            return get("fb_content_name")
        } set {
            set("fb_content_name", newValue)
        }
    }
    
    /// Nama dari masing-masing produk.
    public var contentsName: [String]? {
        get {
            return getArr("fb_content_name")
        } set {
            set("fb_content_name", newValue)
        }
    }
    
    /// Tipe dari event tracker(?).
    public var contentType: String? {
        get {
            return get(FBSDKAppEventParameterNameContentType)
        } set {
            set(FBSDKAppEventParameterNameContentType, newValue)
        }
    }
    
    public var coupon: String? {
        get {
            return get("fb_coupon")
        } set {
            set("fb_coupon", newValue)
        }
    }
    
    public var currency: String? {
        get {
            return get(FBSDKAppEventParameterNameCurrency)
        } set {
            set(FBSDKAppEventParameterNameCurrency, newValue)
        }
    }
    
    public var isSuccess: Bool? {
        get {
            if let value: Int = get(FBSDKAppEventParameterNameSuccess) {
                return value == 1
            }
            return nil
        } set {
            let value: Int
            if newValue == true {
                value = 1
            } else {
                value = 0
            }
            set(FBSDKAppEventParameterNameSuccess, value)
        }
    }
    
    public var keyword: String? {
        get {
            return get(FBSDKAppEventParameterNameSearchString)
        } set {
            set(FBSDKAppEventParameterNameSearchString, newValue)
        }
    }
    
    /// Versi terakhir dari aplikasi.
    public var lastVersion: String? {
        get {
            return get("fb_last_version")
        } set {
            set("fb_last_version", newValue)
        }
    }
    
    /// ID dari sebuah transaksi.
    public var orderID: String? {
        get {
            return get("fb_order_id")
        } set {
            set("fb_order_id", newValue)
        }
    }
    
    public var paymentOption: String? {
        get {
            return get("fb_payment_option")
        } set {
            set("fb_payment_option", newValue)
        }
    }
    
    /// Merek dari sebuah produk.
    public var productBrand: String? {
        get {
            return get("fb_product_brand")
        } set {
            set("fb_product_brand", newValue)
        }
    }
    
    /// Merek dari masing-masing produk.
    public var productsBrand: [String]? {
        get {
            return getArr("fb_product_brand")
        } set {
            set("fb_product_brand", newValue)
        }
    }
    
    /// Harga original dari sebuah produk.
    public var productPrice: Int64? {
        get {
            return get("fb_product_price")
        } set {
            set("fb_product_price", newValue)
        }
    }
    
    /// Total harga dari sebuah produk (bukan total keseluruhan produk).
    ///
    /// Contoh: [produk1 ada 3, produk2 ada 5] masing-masing harganya 15k dan 25k,
    /// maka nilai yang harus diisi adalah [45k, 125k].
    public var productsPrice: [Int64]? {
        get {
            return getArr("fb_product_price")
        } set {
            set("fb_product_price", newValue)
        }
    }
    
    /// SKU dari sebuah produk.
    public var productSKU: String? {
        get {
            return get("fb_product_sku")
        } set {
            set("fb_product_sku", newValue)
        }
    }
    
    /// SKU dari masing-masing produk.
    public var productsSKU: [String]? {
        get {
            return getArr("fb_product_sku")
        } set {
            set("fb_product_sku", newValue)
        }
    }
    
    /// Jumlah dari sebuah produk.
    public var quantity: Int64? {
        get {
            return get("fb_product_quantity")
        } set {
            set("fb_product_quantity", newValue)
        }
    }
    
    /// Jumlah dari masing-masing produk.
    ///
    /// Contoh: [produk1 ada 3, produk2 ada 5],
    /// maka nilai yang harus diisi adalah [3, 5]
    public var quantities: [Int64]? {
        get {
            return getArr("fb_product_quantity")
        } set {
            set("fb_product_quantity", newValue)
        }
    }
    
    /// Metode yang digunakan dalam melakukan pendaftaran.
    ///
    /// Opsi:
    /// - email
    /// - facebook
    /// - google
    /// - phone number
    public var registrationMethod: String? {
        get {
            return get(FBSDKAppEventParameterNameRegistrationMethod)
        } set {
            set(FBSDKAppEventParameterNameRegistrationMethod, newValue)
        }
    }
    
    /// Bulan sewaktu user melakukan pendaftaran.
    public var registrationMonth: String? {
        get {
            return get("fb_registration_month")
        } set {
            set("fb_registration_month", newValue)
        }
    }
    
    /// ID penjual dari sebuah produk.
    public var sellerID: String? {
        get {
            return get("fb_seller_id")
        } set {
            set("fb_seller_id", newValue)
        }
    }
    
    /// Kumpulan ID penjual dari masing-masing produk.
    public var sellersID: [String]? {
        get {
            return getArr("fb_seller_id")
        } set {
            set("fb_seller_id", newValue)
        }
    }
    
    public var shippingOption: String? {
        get {
            return get("fb_shipping_option")
        } set {
            set("fb_shipping_option", newValue)
        }
    }
    
    public var shippingOptions: [String]? {
        get {
            return get("fb_shipping_option")
        } set {
            set("fb_shipping_option", newValue)
        }
    }
    
    /// Jumlah produk dari sebuah transaksi.
    public var totalItems: Int64? {
        get {
            return get(FBSDKAppEventParameterNameNumItems)
        } set {
            set(FBSDKAppEventParameterNameNumItems, newValue)
        }
    }
    
    public var value: Int64? {
        get {
            return get("value")
        } set {
            set("value", newValue)
        }
    }
}
