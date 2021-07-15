//
//  FDTour.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDTour: UIPageViewController {
    
    fileprivate lazy var currentIndex = 0
    fileprivate var appearance:UIPageControl = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
    
    fileprivate(set) lazy var pages: [UIViewController] = {
        return [self.getViewController(withIdentifier: .TourPage1),
                self.getViewController(withIdentifier: .TourPage2),
                self.getViewController(withIdentifier: .TourPage3)]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: Constant.SB.Identifier) -> UIViewController
    {
        return UIStoryboard.getStoryBoardInitialController(name: .Tour, withIdentifier: identifier)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setFirstPage()
        setupPageControl()
        setDelegate()
    }
    
    private func setFirstPage() {
        guard let firstPage = pages.first else {
            return
        }
        setViewControllers([firstPage],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    private func setupPageControl() {
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.custom(background: .Primary)
    }
    
    private func setDelegate() {
        self.dataSource = self
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension FDTour:UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return pages.last }
        guard pages.count > previousIndex else { return nil }
        currentIndex = previousIndex
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return pages.first }
        guard pages.count > nextIndex else { return nil}
        currentIndex = nextIndex
        return pages[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    

}

