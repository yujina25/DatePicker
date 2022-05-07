//
//  ViewController.swift
//  DatePicker
//
//  Created by 이유진 on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {
    // 타이머가 구동되면 실행할 함수
    let timeSelector: Selector = #selector(ViewController.updateTime)
    // 1.0 은 1초
    let interval = 1.0
    // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    var count = 0
    
    @IBOutlet var IblCurrentTime: UILabel!
    @IBOutlet var IblPickerTime: UILabel!
    
    // 타이머를 설정하기 위한 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // timeInterval : 타이머 간격
        // target : 동작될 view
        // selector : 타이머가 구동될 때 실행할 함수
        // userInfo : 사용자 정보
        // repeats : 반복 여부
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        // 1. 함수의 인수인 UIDatePicker 자료형의 sender 를 상수에 담는다.
        let datePickerView = sender
        
        // 2. 날짜를 출력하기 위한 상수 선언
        let formatter = DateFormatter()
        // 3. DateFormmatter() 의 속성인 dateFormat 을 이용하여 원하는 형식을 지정
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        // 4. DatePicker 에서 선택한 날짜를 설정한 형식대로 string 메서드를 이용하여 문자열로 변환
        // 5. 변환된 문자열을 IblPuckerTime label 에 넣어준다.
        IblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    // #selector() 의 인자로 사용될 때 Objective-C 와의 호환성을 위해
    // 함수 앞에 반드시 @objc 키워드를 붙여야 한다.
    @objc func updateTime() {
        // count 값을 문자열로 반환하여 IblCurrentTime.text 에 출력
//        IblCurrentTime.text = String(count)
//        count = count + 1
        
        // NSDate() : 현재 시간을 가져오는 함수
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        IblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
}

