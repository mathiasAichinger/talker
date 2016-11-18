//
//  TalkTableViewCell.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit
import SnapKit

class TalkTableViewCell: UITableViewCell {
    

    let speakerImageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let speakerLabel: UILabel = UILabel()
    let dateLabel: UILabel = UILabel()
    
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
        self.speakerImageView.image = UIImage(contentsOfFile: talk.speakerImageURL)
        self.titleLabel.text = talk.title
        self.speakerLabel.text = talk.speaker
        self.dateLabel.text = dateFormatter.string(from:Date(timeIntervalSince1970:talk.dateTimestamp))
    }
    
    private func initializeUI() {
        addSubview(speakerImageView)
        addSubview(titleLabel)
        addSubview(speakerLabel)
        addSubview(dateLabel)
    }
    
    private func layoutUI() {
        speakerImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self).inset(12)
            make.centerY.equalTo(self.snp.centerY)
            make.height.width.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(speakerImageView.snp.right).offset(12)
            make.right.equalTo(self).inset(12)
        }
        
        speakerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(speakerImageView.snp.right).offset(12)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self).inset(12)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(speakerImageView.snp.right).offset(12)
            make.top.equalTo(speakerLabel.snp.bottom).offset(5)
            make.right.equalTo(self).inset(12)
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
        
        accessoryType = .disclosureIndicator
    }
}
