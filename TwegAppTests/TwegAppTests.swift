//
//  TwegAppTests.swift
//  TwegAppTests
//
//  Created by Erric Alfajri on 31/05/19.
//  Copyright © 2019 Erric Alfajri. All rights reserved.
//

import XCTest
import Nimble
import Quick
import Cuckoo
import Fakery

@testable import TwegApp

class TwegAppTests: QuickSpec {

    override func spec() {
        quickImpementation()
        fakeryImpementation()
    }
    
    func quickImpementation() {
        describe("comparing strings w/ ignoring case") {
            context("equal strings with different case") {
                let string1 = "lalala contoh string"
                let string2 = string1.uppercased()
                
                it("should return true") {
                    expect(string1.equalIgnoreCase(anotherString: string2)).to(beTrue())
                }
            }
            
            context("different strings") {
                let string1 = "lalala contoh string"
                let string2 = string1 + "abc"
                
                it("should return false") {
                    expect(string1.equalIgnoreCase(anotherString: string2)).to(beFalse())
                }
            }
        }
        
        describe("converting to Int") {
            context("contains only number") {
                let randomInt = 5
                let string1 = "\(randomInt)"
                
                it("should return the number correctly") {
                    expect(string1.intValue(def: 0)).to(equal(randomInt))
                }
            }
            
            context("contains number and char") {
                let randomInt = 5
                let string1 = "\(randomInt)" + "lalala contoh string"
                
                it("should return the default value") {
                    expect(string1.intValue(def: 0)).to(equal(0))
                }
            }
        }
        
        describe("decoding from base64") {
            context("valid encoded string") {
                let string1 = "QnVrYWxhcGFr8J+agA=="
                let string2 = "Bukalapak🚀"
                
                it("should return decoded string correctly") {
                    expect(string1.decodeFromBase64()).to(equal(string2))
                }
            }
            
            context("invalid encoded string") {
                let string1 = "おはよlapak🚀 ZZZZ"
                
                it("should return nil") {
                    expect(string1.decodeFromBase64()).to(beNil())
                }
            }
        }
    }
    
    func fakeryImpementation() {
        let faker = Faker()
        
        describe("comparing strings w/ ignoring case") {
            context("equal strings with different case") {
                let string1 = faker.lorem.sentence().lowercased()
                let string2 = string1.uppercased()
                
                it("should return true") {
                    expect(string1.equalIgnoreCase(anotherString: string2)).to(beTrue())
                }
            }
            
            context("different strings") {
                let string1 = faker.lorem.sentence()
                let string2 = string1 + "abc"
                
                it("should return false") {
                    expect(string1.equalIgnoreCase(anotherString: string2)).to(beFalse())
                }
            }
        }
        
        describe("converting to Int") {
            
            context("contains only number") {
                let randomInt = faker.number.randomInt() + 1
                let string1 = "\(randomInt)"
                
                it("should return the number correctly") {
                    expect(string1.intValue(def: 0)).to(equal(randomInt))
                }
            }
            
            context("contains number and char") {
                let randomInt = faker.number.randomInt() + 1
                let string1 = "\(randomInt)" + faker.lorem.sentence()
                
                it("should return the default value") {
                    expect(string1.intValue(def: 0)).to(equal(0))
                }
            }
        }
        
        describe("decoding from base64") {
            
            context("valid encoded string") {
                let string1 = "QnVrYWxhcGFr8J+agA=="
                let string2 = "Bukalapak🚀"
                
                it("should return decoded string correctly") {
                    expect(string1.decodeFromBase64()).to(equal(string2))
                }
            }
            
            context("invalid encoded string") {
                let string1 = "おはよlapak🚀 ZZZZ"
                
                it("should return nil") {
                    expect(string1.decodeFromBase64()).to(beNil())
                }
            }
        }
    }

}
