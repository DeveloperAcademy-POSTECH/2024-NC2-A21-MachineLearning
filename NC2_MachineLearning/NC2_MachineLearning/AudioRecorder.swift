import Foundation
import AVFoundation

class AudioRecorder: NSObject, ObservableObject, AVAudioPlayerDelegate {
    // 녹음
    var audioRecorder: AVAudioRecorder?
    @Published var isRecording = false
    @Published var isNext = false
    
    // 재생
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var isPaused = false
    
    // 음성 메모된 데이터
    var recordedFile: URL? = URL(string: "")
    
    // Singleton instance
    static let shared = AudioRecorder()
    
    override init() {
        super.init()
        configureAudioSession()
        checkAudioRecordingPermission()
    }
    
    func configureAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Failed to configure audio session: \(error.localizedDescription)")
        }
    }
    
    // 음성 메모 녹음 관련 메서드
    // 받아올 때 형식과 확장자를 
    func startRecording() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("recording-\(Date().timeIntervalSince1970).wav")
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 16000.0,
            AVNumberOfChannelsKey: 1, // mono
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
            AVLinearPCMBitDepthKey: 16,
            AVLinearPCMIsBigEndianKey: false,
            AVLinearPCMIsFloatKey: false
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            audioRecorder?.record()
            isRecording = true
            isNext = false
            print("Recording started")
        } catch {
            print("Failed to start recording: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        guard let recorder = audioRecorder else {
            print("Audio recorder is not initialized.")
            return
        }
        recorder.stop()
        recordedFile = recorder.url
        isRecording = false
        isNext = true
        print("Recording stopped: \(String(describing: recordedFile))")
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // 음성 메모 재생 관련 메서드
    func startPlaying(recordingURL: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recordingURL)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            isPlaying = true
            isPaused = false
            print("Playback started")
        } catch {
            print("Failed to start playback: \(error.localizedDescription)")
        }
    }
    
    func stopPlaying() {
        audioPlayer?.stop()
        isPlaying = false
        isPaused = false
        print("Playback stopped")
    }
    
    func pausePlaying() {
        audioPlayer?.pause()
        isPaused = true
        print("Playback paused")
    }
    
    func resumePlaying() {
        audioPlayer?.play()
        isPaused = false
        print("Playback resumed")
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        isPaused = false
        print("Playback finished")
    }
    
    // 녹음 파일 목록 출력
    func listRecordings() {
        let documentsDirectory = getDocumentsDirectory()
        do {
            let files = try FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            let recordings = files.filter { $0.pathExtension == "wav" }
            if recordings.isEmpty {
                print("No recordings found.")
            } else {
                print("Recordings:")
                for recording in recordings {
                    print(recording.lastPathComponent)
                }
            }
        } catch {
            print("Failed to list recordings: \(error.localizedDescription)")
        }
    }
    
    func checkAudioRecordingPermission() {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .granted:
            print("Permission granted")
        case .denied:
            print("Permission denied")
        case .undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                if granted {
                    print("Permission granted")
                } else {
                    print("Permission denied")
                }
            }
        @unknown default:
            fatalError("Unknown AVAudioSession record permission status")
        }
    }
}
