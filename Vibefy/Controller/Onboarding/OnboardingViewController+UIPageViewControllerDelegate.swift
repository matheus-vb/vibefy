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
    }
}
