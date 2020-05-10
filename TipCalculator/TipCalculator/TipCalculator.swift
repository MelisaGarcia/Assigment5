//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Andrea Dancek on 2020-05-09.
//  Copyright © 2020 Melisa Garcia. All rights reserved.
//

import Foundation


class TipCalculator{
    var billAmount : Double = 0
    var tipAmount : Double = 0
    var tipPercentaje : Double = 0
    
    init(billAmount : Double, tipPercentaje : Double){
        self.billAmount = billAmount
        self.tipPercentaje = tipPercentaje
    }
        func calculateTotal(){
        tipAmount = (tipPercentaje * billAmount)/100
    }
}
