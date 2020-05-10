//
//  backgroundGradient.swift
//  TipCalculator
//
//  Created by Andrea Dancek on 2020-05-10.
//  Copyright © 2020 Melisa Garcia. All rights reserved.
//


import UIKit

class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]

        guard let theLayer = self.layer as? CAGradientLayer else {
            return;
        }

        theLayer.colors = [UIColor(hue: 0.5944, saturation: 1, brightness: 0.86, alpha: 1.0).cgColor, UIColor(hue: 0.6444, saturation: 1, brightness: 0.4, alpha: 1.0).cgColor]
        theLayer.locations = [0.0, 1.0]
        theLayer.frame = self.bounds
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
