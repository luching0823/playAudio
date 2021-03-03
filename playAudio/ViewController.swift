//
//  ViewController.swift
//  playAudio
//
//  Created by 廖昱晴 on 2021/3/3.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let path = Bundle.main.path(forResource: "Right", ofType: "mp3") { //音檔路徑
//            let url = URL(fileURLWithPath: path) //將路徑轉換成URL
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf: url) //AVAudioPlayer會丟錯誤訊息(throw)，所以要包在do catch內並前面要加try
//                audioPlayer?.enableRate = true //可以調整播放速度，預設為1
//                audioPlayer?.rate = 2.0 //播放速度調為2
//                audioPlayer?.numberOfLoops = 2 //播放次數，預設為0(播一次)，-1為一直無限重播
//                audioPlayer?.volume = 0.3 //音量大小，預設為1
//            } catch { // 發生錯誤時執行
//                print(error.localizedDescription)
//            }
//        } else {
//            print("no such file")
//        }
        
        guard let newPath = Bundle.main.path(forResource: "Right", ofType: "mp3") else { //確保有值，若找不到進入else並不再執行下面的程式碼(return)
            print("no such file")
            return
        }
        
        let url = URL(fileURLWithPath: newPath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
        
    }

    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop() //停止所有播放
        audioPlayer?.currentTime = 0 //音檔播放時間軸為0
        audioPlayer?.play() //播放音檔
    }
    
}

