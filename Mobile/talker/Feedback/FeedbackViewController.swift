//
//  FeedbackViewController.swift
//  talker
//
//  Created by Mathias Aichinger on 20/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit
import HCSStarRatingView

class FeedbackViewController: UIViewController {

    let ratingView = HCSStarRatingView()
    let feedbackLabel = UILabel()
    let feedbackTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        layoutUI()
        styleUI()
    }

    
    private func initializeUI() {
        view.addSubview(ratingView)
        view.addSubview(feedbackLabel)
        view.addSubview(feedbackTextView)
        title = "Give Feedback"
        feedbackLabel.text = "Feedback:"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
    }
    
    private func layoutUI() {
        ratingView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).inset(100)
            make.left.right.equalTo(view).inset(15)
            make.height.equalTo(50)
        }
        
        feedbackLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ratingView.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(12)
        }
        feedbackTextView.snp.makeConstraints { (make) in
            make.top.equalTo(feedbackLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalTo(view).inset(12)
        }
    }
    
    private func styleUI() {
        view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        ratingView.minimumValue = 0
        ratingView.maximumValue = 5
        ratingView.isOpaque = false
    }
    
    @objc private func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    

}
