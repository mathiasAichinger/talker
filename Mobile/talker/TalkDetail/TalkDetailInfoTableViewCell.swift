//
//  TalkDetailInfoTableViewCell.swift
//  talker
//
//  Created by Mathias Aichinger on 20/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit
import TalkerFramework
import HCSStarRatingView

class TalkDetailInfoTableViewCell: UITableViewCell {
    
    let speakerImageView: UIImageView = UIImageView()
    let titleView = UIView()
    let titleLabel: UILabel = UILabel()
    let speakerLabel: UILabel = UILabel()
    let dateLabel: UILabel = UILabel()
    let ratingView = HCSStarRatingView()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd.MM.yy, HH:mm"
        
        return dateFormatter
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeUI()
        layoutUI()
        styleUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(talk: Talk) {
        titleLabel.text = talk.title
        speakerLabel.text = talk.loadedSpeaker?.speakerName
        dateLabel.text = dateFormatter.string(from:Date(timeIntervalSince1970:talk.dateTimestamp))
        ratingView.value = CGFloat(talk.averageRating)
        
        layoutIfNeeded()
        self.speakerImageView.hnk_setImage(from: URL(string:talk.loadedSpeaker!.speakerImageURL!))
    }
    
    private func initializeUI() {
        addSubview(speakerImageView)
        addSubview(titleView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(speakerLabel)
        addSubview(ratingView)
    }
    
    private func layoutUI() {
        speakerImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self).inset(12)
            make.centerY.equalTo(self.snp.centerY)
            make.height.width.equalTo(50)
        }
        
        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(speakerImageView.snp.right).offset(12)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleView)
            make.right.equalTo(titleView)
            make.top.equalTo(titleView)
        }
        
        speakerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.equalTo(titleView)
            make.right.equalTo(titleView)
            make.bottom.equalTo(titleView)
        }
        ratingView.snp.makeConstraints { (make) in
            make.right.equalTo(self).inset(12)
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(titleView.snp.right).offset(8)
            make.height.equalTo(25)
            make.width.equalTo(75)
        }
    }
    
    private func styleUI() {
        speakerImageView.layer.cornerRadius = 25
        speakerImageView.layer.masksToBounds = true
        speakerImageView.clipsToBounds = true
        
        speakerLabel.font = UIFont.systemFont(ofSize: 12)
        speakerLabel.textColor = UIColor(red:1.00, green:0.38, blue:0.22, alpha:1.00)
        
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.textColor = UIColor.gray
        
        ratingView.maximumValue = 5
        ratingView.minimumValue = 0
        ratingView.allowsHalfStars = true
        ratingView.isUserInteractionEnabled = false
        
        accessoryType = .none
    }

}
