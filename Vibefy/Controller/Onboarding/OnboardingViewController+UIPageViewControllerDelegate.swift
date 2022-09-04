//
//  OnboardingViewController+UIPageViewControllerDelegate.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import Foundation
import UIKit

extension OnboardingViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else {return}
        guard let currentIdx = pages.firstIndex(of: viewControllers[0]) else {return}
        
        pageControl.currentPage = currentIdx
        animateControls()
    }
    
    private func animateControls() {
        let lastPage = pageControl.currentPage == pages.count - 1
        
        if lastPage {
            hideControls()
        }else{
            showControls()
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {self.view.layoutIfNeeded()}, completion: nil)
    }
    
    private func hideControls(){
        pageControlBottomAnchor?.constant = -80
    }
    
    private func showControls(){
        pageControlBottomAnchor?.constant = 16
    }
    
}
