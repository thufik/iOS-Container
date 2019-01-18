//
//  ViewController.swift
//  ContainerTutorial
//
//  Created by EquipeSuporteAplicacao on 4/23/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var summaryViewController : SummaryViewController{
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        
        self.addChildViewController(viewController)
        
        return viewController
    }
    
    private var sessionsViewController : SessionsViewController{
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController
        
        self.addChildViewController(viewController)
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupView(){
        self.setupSegmentedControl()
    }
    
    private func updateView(){
        if self.segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: sessionsViewController)
            add(asChildViewController: summaryViewController)
        }else{
            remove(asChildViewController: summaryViewController)
            add(asChildViewController: sessionsViewController)
        }
    }
    
    private func setupSegmentedControl(){
        self.segmentedControl.removeAllSegments()
        self.segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        self.segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
        self.segmentedControl.addTarget(self, action: #selector(self.selectionDidChange(_:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc private func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func add(asChildViewController viewController : UIViewController){
        //self.addChildViewController(viewController)
        
        self.view.addSubview(viewController.view)
        
//        viewController.view.frame = view.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController : UIViewController){
        viewController.willMove(toParentViewController: nil)
        
        viewController.view.removeFromSuperview()
        
        viewController.removeFromParentViewController()
    }
}

