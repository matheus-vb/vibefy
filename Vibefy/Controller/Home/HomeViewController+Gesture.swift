//
//  HomeViewController+Gesture.swift
//  Vibefy
//
//  Created by matheusvb on 12/09/22.
//

import Foundation
import UIKit

extension HomeViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let loc = touch.location(in: dragView)
        if dragView.bounds.contains(loc) {
            isDragging = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first else {
            return
        }
        
        let loc = touch.location(in: view)
        dragView.frame.origin.y = loc.y - (dragView.frame.size.width/2)
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDragging = false
    }
}
