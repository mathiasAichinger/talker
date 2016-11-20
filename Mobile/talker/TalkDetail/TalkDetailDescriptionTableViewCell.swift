//
//  TalkDetailDescriptionTableViewCell.swift
//  talker
//
//  Created by Mathias Aichinger on 20/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit

class TalkDetailDescriptionTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let descriptionTextView = UITextView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeUI()
        layoutUI()
        styleUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(descriptionText: String) {
        descriptionTextView.text = descriptionText
    }
    
    private func initializeUI() {
        addSubview(titleLabel)
        titleLabel.text = "Description"
        addSubview(descriptionTextView)
    }
    
    private func layoutUI() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self).inset(12)
        }
        
        descriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(self).inset(8)
            make.right.bottom.equalTo(self).inset(12)
        }
    }
    
    private func styleUI() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionTextView.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        descriptionTextView.isEditable = false
        accessoryType = .none
    }

}
