//
//  ViewController.swift
//  FlexibleSteppedProgressBar
//
//  Created by Amrata Baghel on 09/28/2016.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar

class ViewController: UIViewController, FlexibleSteppedProgressBarDelegate {

    var progressBar: FlexibleSteppedProgressBar!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    var progressBarWithDifferentDimensions: FlexibleSteppedProgressBar!
    
    var backgroundColor = UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    var progressColor = UIColor(red: 53.0 / 255.0, green: 226.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0)
    var textColorHere = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    
    var maxIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupProgressBarWithoutLastState()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupProgressBarWithoutLastState() {
        progressBarWithoutLastState = FlexibleSteppedProgressBar()
        progressBarWithoutLastState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressBarWithoutLastState)
        
        // iOS9+ auto layout code
        if #available(iOS 9.0, *) {
            let horizontalConstraint = progressBarWithoutLastState.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
            let verticalConstraint = progressBarWithoutLastState.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 300
            )
            let widthConstraint = progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: 450)
            let heightConstraint = progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 150)
        
            // Fallback on earlier versions
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        }else{
            let horizontalConstraint =  NSLayoutConstraint(item: progressBarWithoutLastState,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: self.view,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           multiplier: 1.0,
                                                           constant: 0)
            
            let verticalConstraint =  NSLayoutConstraint(item: progressBarWithoutLastState,
                                                         attribute: NSLayoutConstraint.Attribute.topMargin,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: self.view,
                                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                                         multiplier: 1.0,
                                                         constant:0)
            
            let widthConstraint = NSLayoutConstraint(item: progressBarWithoutLastState,
                                                      attribute: NSLayoutConstraint.Attribute.width,
                                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: self.view,
                                                      attribute: NSLayoutConstraint.Attribute.width,
                                                      multiplier: 1.0,
                                                      constant:0)
                                                     
            _ = NSLayoutConstraint(item: progressBarWithoutLastState,
                                   attribute: NSLayoutConstraint.Attribute.topMargin,
                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                   toItem: self.view,
                                   attribute: NSLayoutConstraint.Attribute.centerY,
                                   multiplier: 1.0,
                                   constant:0)
            // Fallback on earlier versions
            
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint])
            //progressBarWithoutLastState.frame

            
        }
        // Customise the progress bar here
        progressBarWithoutLastState.numberOfPoints = 4
        progressBarWithoutLastState.lineHeight = 3
        progressBarWithoutLastState.radius = 20
        progressBarWithoutLastState.progressRadius = 25
        progressBarWithoutLastState.progressLineHeight = 3
        progressBarWithoutLastState.delegate = self
        progressBarWithoutLastState.selectedBackgoundColor = progressColor
        progressBarWithoutLastState.selectedOuterCircleStrokeColor = backgroundColor
        progressBarWithoutLastState.currentSelectedCenterColor = progressColor
        progressBarWithoutLastState.stepTextColor = textColorHere
        progressBarWithoutLastState.currentSelectedTextColor = progressColor
        
        progressBarWithoutLastState.currentIndex = 0
        
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     didSelectItemAtIndex index: Int) {
        progressBar.currentIndex = index
        if index > maxIndex {
            maxIndex = index
            progressBar.completedTillIndex = maxIndex
        }
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     canSelectItemAtIndex index: Int) -> Bool {
        return true
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if progressBar == self.progressBar || progressBar == self.progressBarWithoutLastState {
            if position == FlexibleSteppedProgressBarTextLocation.top {
                switch index {
                    
                case 0: return "Choose"
                case 1: return "Click"
                case 2: return "Checkout"
                case 3: return "Buy"
                case 4: return "Pay"
                default: return "Step"
                    
                }
            } else if position == FlexibleSteppedProgressBarTextLocation.bottom {
                switch index {
                    
                case 0: return "First"
                case 1: return "Second"
                case 2: return "Third"
                case 3: return "Fourth"
                case 4: return "Fifth"
                default: return "Date"
                    
                }
                
            } else if position == FlexibleSteppedProgressBarTextLocation.center {
                switch index {
                    
                case 0: return "1"
                case 1: return "2"
                case 2: return "3"
                case 3: return "4"
                case 4: return "5"
                default: return "0"
                    
                }
            }
        } else if progressBar == progressBarWithDifferentDimensions {
            if position == FlexibleSteppedProgressBarTextLocation.bottom {
                switch index {
                    
                case 0: return "First"
                case 1: return "Second"
                case 2: return "Third"
                case 3: return "Fourth"
                case 4: return "Fifth"
                default: return "Date"
                    
                }
            }
        }
        return ""
    }
    

}

