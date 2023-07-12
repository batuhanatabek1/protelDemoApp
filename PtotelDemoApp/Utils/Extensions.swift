//
//  Extensions.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 11.07.2023.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
   public subscript(safe index: Index) -> Iterator.Element? {
     return (startIndex <= index && index < endIndex) ? self[index] : nil
   }
}
