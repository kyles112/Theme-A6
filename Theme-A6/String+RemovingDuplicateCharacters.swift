//
//  String+RemovingDuplicateCharacters.swift
//  Theme-A6
//
//  Created by user224517 on 9/5/22.
//

import Foundation

extension String {
    var removingDuplicateCharacters: String {
        reduce(into: "") { sofar, element in
            if !sofar.contains(element) {
                sofar.append(element)
            }
        }
    }
}
