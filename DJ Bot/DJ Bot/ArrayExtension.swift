//
//  ArrayExtension.swift
//  DJ Bot
//
//  Created by Jochem Toolenaar on 02/12/14.
//  Copyright (c) 2014 JTMS. All rights reserved.
//

import Foundation
extension Array {
    func find(includedElement: T -> Bool) -> Int? {
        for (idx, element) in enumerate(self) {
            if includedElement(element) {
                return idx
            }
        }
        return nil
    }
}
