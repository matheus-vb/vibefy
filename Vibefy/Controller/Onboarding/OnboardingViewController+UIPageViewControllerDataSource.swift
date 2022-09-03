//
//  OnboardingViewController+UIPageViewControllerDataSource.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import Foundation
import UIKit

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIdx = pages.firstIndex(of: viewController) else {return nil}
        
        if currentIdx == 0 {
            return pages.last
        }else{
            return pages[currentIdx - 1]
        }
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIdx = pages.firstIndex(of: viewController) else {return nil}

        if currentIdx < pages.count - 1 {
            return pages[currentIdx + 1]
        }else{
            return pages.first
        }
        
    }
    
    
}
