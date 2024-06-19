//
//  AudioRecorder.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/19/24.
//

import Foundation
import AVFoundation

class AudioRecorder: NSObject, ObservableObject, AVAudioPlayerDelegate{
    //녹음
    var audioRecorder: AVAudioRecorder?
    @Published var isRecording = false
    //다음 화면 전환
    @Published var isNext = false
    
    //재생
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var isPaused = false
    
    // 음성메모된 데이터
    var recordedFile: URL?
}

// MARK: - 음성메모 녹음 관련 메서드
extension AudioRecorder {
    func startRecording() {
        
        //저장될 URL과 setting 파라미터를 두어 인스턴스 생성
        
        let fileURL = getDocumentsDirectory().appendingPathComponent("recording-\(Date().timeIntervalSince1970).m4a")
        let settings = [
            //오디오 녹음 파일 포맷
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            // 오디오 샘플링 비율 설정
            AVSampleRateKey: 12000,
            // 오디오 녹음 파일의 채널 수 지정
            AVNumberOfChannelsKey: 1, //mono
            // 오디오 인코더 품질
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            //녹음 시작
            audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            audioRecorder?.record()
            self.isRecording = true
            self.isNext = false
            print("notNext")
        } catch {
            print("녹음 중 오류 발생: \(error.localizedDescription)")
        }
    }
    
    //녹음 중지
    func stopRecording() {
        audioRecorder?.stop()
        //recordedFile에 녹음한 음성 저장
        self.recordedFile = self.audioRecorder!.url
        self.isRecording = false
        self.isNext = true
        print("gotNext")
    }
    
    //음성이 저장된 경로를 추적하여 URL을 받아옴
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

// MARK: - 음성메모 재생 관련 메서드
extension AudioRecorder {
    
    //저장한 오디오 URL을 받아와서 재생
    func startPlaying(recordingURL: URL) {
        do {
            //재생해~
            audioPlayer = try AVAudioPlayer(contentsOf: recordingURL)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            self.isPlaying = true
            self.isPaused = false
        } catch {
            print("재생 중 오류 발생: \(error.localizedDescription)")
        }
    }
    
    func stopPlaying() {
        audioPlayer?.stop()
        self.isPlaying = false
    }
    
    func pausePlaying() {
        audioPlayer?.pause()
        self.isPaused = true
    }
    
    func resumePlaying() {
        audioPlayer?.play()
        self.isPaused = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.isPlaying = false
        self.isPaused = false
    }
}
