//
//  MKCDashboradMessageView.swift
//  MKCCAPKit
//
//  Created by zh on 2020/6/17.
//

import UIKit

protocol  MKCDashboradMessageViewDelegate : class {

    func didSelectMessageItemView(item: String)
}

class  MKCDashboradMessageCell: UITableViewCell {

    let titlLabel :UILabel = {
        let a = UILabel()
        a.font = UIFont.systemFont(ofSize: 13)
        a.textColor = UIColor(hexString: "#333333")
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.clear
        titlLabel.numberOfLines = 1
        contentView.addSubview(titlLabel)
        titlLabel.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.right.equalTo(-10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MKCDashboradMessageView: UIView {

    let bgImageView = UIImageView(image: UIImage(named: "icon_communication"))
        //UIImageView(image: UIImage(named: "icon_communication")).mode(.scaleAspectFit)
    
    
    let tableView = UITableView()
    var dataSource: [String] = []
    var timer: DispatchSourceTimer?
    var currentRows:Int = -1
    var currentSection:Int = -1
    weak var delegate: MKCDashboradMessageViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        bgImageView.contentMode = .scaleAspectFit
        bgImageView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.clear
        tableView.register(MKCDashboradMessageCell.self, forCellReuseIdentifier: "MKCDashboradMessageCell")
        addSubview(bgImageView)
//        bgImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(90)
            make.center.right.equalTo(bgImageView)
            make.height.equalTo(30)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func reloadData(dataArray:[String]) {
        dataSource = dataArray
        if !dataSource.isEmpty{
            self.tableView.reloadData()
            self.startLoopTimer()
        }
    }
    func startLoopTimer() {
        currentSection = 0
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: DispatchTime.now(), repeating: .seconds(3), leeway: .milliseconds(10))
        timer?.setEventHandler(handler: {
            DispatchQueue.main.sync {
                if !self.dataSource.isEmpty{
                    self.currentRows+=1
                    if self.currentRows >= self.dataSource.count {
                        self.currentRows = 0
                        self.currentSection = 1
                        if self.currentSection == 0 {
                            self.tableView.scrollToRow(at: IndexPath(row: self.currentRows, section: self.currentSection), at: .top, animated: true)//跳到section:1 item:0 有动画
                        } else if self.currentSection == 1 {
                            self.tableView.scrollToRow(at: IndexPath(row: self.dataSource.count - 1, section: 0), at: .top, animated: false)//跳到section:0 item:last 无动画直接切过去
                            self.tableView.scrollToRow(at: IndexPath(row: self.currentRows, section: self.currentSection), at: .top, animated: true)//跳到section:1 item:0 有动画
                        }
                    } else {
                        self.tableView.scrollToRow(at: IndexPath(row: self.currentRows, section: self.currentSection), at: .top, animated: true)
                    }
                }
            }
        })
        
        timer?.resume()

    }
}

extension MKCDashboradMessageView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MKCDashboradMessageCell") as? MKCDashboradMessageCell else {
            return UITableViewCell()
        }
        let model = self.dataSource[indexPath.row]
        cell.titlLabel.text = model
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("fkdlfkld")
//        let model = self.dataSource[indexPath.row]
//        delegate?.didSelectMessageItemView(item: model)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
