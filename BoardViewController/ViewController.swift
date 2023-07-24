//
//  ViewController.swift
//  BoardViewController
//
//  Created by 염성필 on 2023/07/19.
//

import UIKit
import SwiftUI

@available(iOS 16.0, *)
class ViewController: UIViewController {
    
    @IBOutlet var searchBgView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var ButtonCollection: [UIButton]!
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var changeTextBtn: UIButton!
    
    
    let colorNames: [String] = ["Color 0",
                               "Color 1",
                               "Color 2",
                               "Color 3",
                               "Color 4",
                               "Color 5",
                               "Color 6",
                               "Color 7",
                               "Color 8",
                               "Color 9",
                               "Color 10"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTextField()
        settingBtn()
        settingMainLabel()
        self.view.backgroundColor = .black
        
        searchBgView.backgroundColor = .white
        
    }
    
    func settingTextField() {
        inputTextField.borderStyle = .none
        inputTextField.backgroundColor = .white
        inputTextField.placeholder = "경고 5글자만 적어주세요"
    }
    
    // 텍스트 필드 return 키 눌렀을 때 mainLabel에 적용하기
    @IBAction func inputTextFieldReturnClicked(_ sender: UITextField) {
        
        guard let textFieldText = sender.text else { return }
        
        if textFieldText.count == 5 {
            let alert = UIAlertController(title: "힝 속았지?", message: "1초 뒤 앱이 꺼집니다.", preferredStyle: .alert)

            
            let ok = UIAlertAction(title: "확인", style: .default) { action in
                DispatchQueue.main.async {
                    // spiderversify 적용하기
                    // https://github.com/Jager-yoo/Spiderversify
                    self.openSwiftUIView()
                }
            }
            alert.addAction(ok)
            present(alert, animated: true)
            
        } else {
            let alert = UIAlertController(title: "경고!", message: "1초 뒤 앱이 꺼집니다.", preferredStyle: .alert)

            
            let ok = UIAlertAction(title: "확인", style: .default) { action in
                DispatchQueue.main.async {
                    // spiderversify 적용하기
                    // https://github.com/Jager-yoo/Spiderversify
                    self.openSwiftUIView()
                }
            }
            alert.addAction(ok)
            present(alert, animated: true)
        }
        inputTextField.text = ""
        
    }
    
    func settingBtn() {
        for button in ButtonCollection {
            button.settingButton()
        }
    }
    
    func settingMainLabel() {
        mainLabel.textColor = .red
        mainLabel.text = "환영합니다."
    }
    
    // 전송 버튼
    @IBAction func sendBtnClicked(_ sender: UIButton) {
        guard let textFieldText = inputTextField.text else { return }
        
        if textFieldText.count == 5 {
            let alert = UIAlertController(title: "경고!", message: "1초 뒤 앱이 꺼집니다.", preferredStyle: .alert)

            
            let ok = UIAlertAction(title: "확인", style: .default) { action in
                DispatchQueue.main.async {
                    // spiderversify 적용하기
                    // https://github.com/Jager-yoo/Spiderversify
                    self.openSwiftUIView()
                }
            }
            alert.addAction(ok)
            present(alert, animated: true)
            
        } else {
            let alert = UIAlertController(title: "경고!", message: "1초 뒤 앱이 꺼집니다.", preferredStyle: .alert)

            
            let ok = UIAlertAction(title: "확인", style: .default) { action in
                DispatchQueue.main.async {
                    // spiderversify 적용하기
                    // https://github.com/Jager-yoo/Spiderversify
                    self.openSwiftUIView()
                }
            }
            
            alert.addAction(ok)
            present(alert, animated: true)
        }
        inputTextField.text = ""
    }
    
    private func openSwiftUIView() {
        let hostingController = UIHostingController(rootView: SayHelloView())
        hostingController.sizingOptions = .preferredContentSize
        hostingController.modalPresentationStyle = .popover
        self.present(hostingController, animated: true)
    }
    
    @IBAction func changeTextColorBtnClicked(_ sender: UIButton) {
        inputTextField.textColor =
        UIColor(named: textColorSuffled())
        print("inputTextField.textColor",inputTextField.textColor)
    }
    
    func textColorSuffled() -> String {
        
        let colorName = colorNames.randomElement()!
        print("randomColor",colorName)
        return colorName
    }
    
    
    
    
    
    // 빈 화면 클릭시 키보드 내리기
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
 
        view.endEditing(true)
        searchBgView.isHidden.toggle()
        
    }
    
    
    

}
extension UIButton {
    func settingButton() {
        self.tintColor = .black
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}

