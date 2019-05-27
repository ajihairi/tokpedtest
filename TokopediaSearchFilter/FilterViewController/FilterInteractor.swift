//
//  FilterInteractor.swift
//  TokopediaFilterFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class FilterInteractor: FilterInteractorInput {
    unowned let output: FilterInteractorOutput
    
    init(output: FilterInteractorOutput) {
        self.output = output
    }
}

