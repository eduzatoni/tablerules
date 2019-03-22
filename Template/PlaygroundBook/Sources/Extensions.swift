//
//  extensions.swift
//  Book_Sources
//
//  Created by Eduardo Curupana on 19/03/2019.
//

import Foundation
import SceneKit

extension SCNNode {
    
    func showAnimate(duration: TimeInterval) {
        runAction(SCNAction.fadeOpacity(to: 1, duration: duration))
    }
    
    func hideAnimate(duration: TimeInterval) {
        runAction(SCNAction.fadeOpacity(to: 0, duration: duration))
    }
    
    func setPlateMaterial() {
        let plateMaterial = SCNMaterial()
        plateMaterial.metalness.contents = 0.8
        plateMaterial.roughness.contents = 0.2
        geometry?.firstMaterial = plateMaterial
    }
    
    func setReflectiveMaterial() {
        let reflectiveMaterial = SCNMaterial()
        reflectiveMaterial.lightingModel = .physicallyBased
        reflectiveMaterial.metalness.contents = 1.0
        reflectiveMaterial.roughness.contents = 0
        geometry?.firstMaterial = reflectiveMaterial
    }
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func setStyle(cornerRadius: CGFloat, color: UIColor, alpha: CGFloat) {
        self.alpha = alpha
        self.setRounded(cornerRadius: cornerRadius)
        self.backgroundColor = color
    }
    
    func setRounded(cornerRadius: CGFloat) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.masksToBounds = false
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.2
        layer.cornerRadius = 20
    }
}

extension UILabel {
    func changeAnimate(text: String) {
        self.fadeTransition(1)
        self.text = text
    }
}
