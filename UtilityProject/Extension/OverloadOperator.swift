//
//  OverloadOperator.swift
//  UtilityProject
//
//  Created by shankars on 2/13/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import Foundation

func * (lhs: Double, rhs: Int) -> Double {
    return lhs * Double(rhs)
}

func * (lhs:Int, rhs:Double) -> Double {
    return Double(lhs) * rhs
}
