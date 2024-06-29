# 2024-NC2-A21-MachineLearning
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About Augmented Reality
(해당 기술에 대한 조사 내용 정리)
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/cb333f8c-e7af-4486-84f3-ea26c2cdd66d)

- 이미지나 텍스트, 사운드등을 학습하여 상황에 대한 동작을 일일이 지정하는 대신, 
스스로 학습하여 대응하도록 하는 방법론이다
- 물체나 소리를 인식하거나 분석할 수 있고 사용자의 패턴을 파악해 
어떠한 결과를 추천해주거나 예측할 수도 있다.
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/7f14c4f7-e06c-4218-8b9b-a3cc2e25814c)


## 🎯 What we focus on?
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/26617508-30c9-4fca-8696-645574bcfd23)
### SoundClassification

- 수많은 아이디어중 오브젝트 분류와 소리를 분석해주는것에 흥미를 느꼈고 
그중 소리에 집중해보고 싶은 생각이 들었습니다
- 소리를 과연 어떻게 분석하는지 원리를 알지 못해서 이번 기회에 배워보고싶었습니다

### AVFoundation

- input 값으로 오디오를 사용하기 위해, 녹음 할 수 있는 기능이 필요하다고 생각했습니다

### Idation
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/2a0bd799-4930-4fe6-bccf-d770e219ab90)
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/e4e96c3f-96f7-4c53-b633-08f6e2cbd0cf)


## 💼 Use Case
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/85c75bce-7cd2-4e2e-93a6-ce96ce9a992a)


## 🖼️ Prototype

### 1. 메인화면
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/1e0f130f-e4da-4b25-a506-c6e99168bb8b)
- Start 버튼을 누르면 recordView (음성녹음화면)으로 진입합니다


### 2. 음성 녹음화면
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/017cbbb4-c866-415f-a843-b24b6057e10d)
- 사용자가 보고 읽을 수 있는 지문을 랜덤으로 제시해 줍니다
- 음성 녹음 버튼을 누르면 음성이 녹음됩니다
- 녹음 정지 버튼을 누르면 바로 분석 결과 화면으로 이동합니다


### 3. 음성 분석 결과 화면
  ![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/e7134af6-243c-43c1-91fd-63c0459cbd8a) 
- 녹음된 음성과 학습한 모델을 적용하여 목소리 타입에 따른 결과 화면을 제공합니다

총 8개의 목소리 타입이 있습니다!
![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/d9d7ecad-ce1c-49eb-b749-010d32e2e88a)



## 🛠️ About Code
[(핵심 코드에 대한 설명 추가)](https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F2e999faf-43aa-426e-ba81-0a9f876c0c58%2F70245514-95c4-422a-ba7f-fc3c048ff64b%2F5864d500-a1dc-4f84-9066-c71623dfe3a3.png?table=block&id=9c80ce15-cd83-4743-9fe2-cfcafd1adda9&spaceId=2e999faf-43aa-426e-ba81-0a9f876c0c58&width=1420&userId=e7637d63-e92f-4d98-a02f-63f160a8b78e&cache=v2)
- 다음은 프로토타입에 적용된 모델 데이터를 수집하고 분류하는 과정을 담은 내용입니다.먼저 목소리 데이터를 수집하였는데, 저희는  최대한 비슷한 분류 기준으로, 많은 목소리 데이터를 수집하기 위해 러너들 목소리뿐만 아니라, 네이버 클로바 더빙에서 AI 목소리를 추출하였고,
백그라운드 소리도 함께 추가하였습니다.
*여기서 백그라운드 소리는 구별할 사운드가 없을 때 처리하기 위한 용도입니다.
- 이렇게 수집한 데이터는 총 340가지로, 이를 gender와 voiceType으로 나누어 분류하였습니다
Gender는 말 그대로 남자와 여자 목소리를 분류하여 담았고, voiceType은 목소리의 톤이나 억양, 분위기에 따라 남자 4가지, 여자 4가지의 목소리 유형으로 분류하여 총 8가지의 유형으로 구분하였습니다.

![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A21-MachineLearning/assets/163488928/32f2d601-042a-46a8-80ca-ad08b15ffcb4)
이후 모델을 앱에 적용할 때, 처음에는 gender 모델 없이 남,여가 모두 합쳐져 있는 voiceType 모델로 오디오 데이터를 분석하였는데 정확도가 많이 떨어지는 것을 확인하였습니다.. 
예를 들어 여자목소리여도, 억양이 낮아지는 부분에서는 남자 목소리로 인식 하는 문제가 있었어요.
따라서 gender를 구별하는 모델로 오디오 데이터를 male과 female로 구별한 후에,
각각의 성별에 맞는 voiceType을 구별해주는 모델을 적용하여 분석하도록 하였습니다.

### Code snippet

**오디오를 분석해서 얻는 결과값을 받을 수 있는 ResultsObserver 구현⬇️**

    import Foundation
    import SwiftUI
    import AVFoundation
    import SoundAnalysis
    
    //오디오 분석으로 부터 결과 받는 타입 구현
    /// An observer that receives results from a classify sound request.
    class ResultsObserver: NSObject, SNResultsObserving {
    
    @Binding var classificationResult: String
    
    //각 시간 범위의 classification 결과를 저장할 딕셔너리
    private var classifications: [String: Double] = [:]
    
    //가장 많이 도출된 오디오타입 값 받기
    var mostClassificationIdentifier: String
    
    //초기화
    init(result: Binding<String>){
           _classificationResult = result
           mostClassificationIdentifier = "" // Provide an initial value
           super.init() // Call super.init() after initializing all properties
       }
    
    /// Notifies the observer when a request generates a prediction.
    func request(_ request: SNRequest, didProduce result: SNResult) {
    
		    // 결과를 SNClassificationResult로부터 받아옴
        // SNClassificationResul은 시간 범위에 대해 가장 높은 순위의 예측 결과를 가져온다고 함
        guard let result = result as? SNClassificationResult else  { return }
        
        //classifications는 [SNClassification]임
        //이는 상위 분류 후보를 나열한 배열을 나타냄
        //classification.first니까 젤 높은 순위의 후보를 데려옴
        guard let classification = result.classifications.first else { return }
        
        classifications[classification.identifier, default: 0.0] 
        += classification.confidence
        
        //가장 많이 도출된 classification 결과값을 구하는 로직
        //BG는 딕셔너리에서 삭제
        classifications["BG"] = nil
        //딕셔너리 안에서 가장 많이 나온 값 구하기
        let mostFrequentClassification = classifications.max(by: 
        { $0.value < $1.value })
        
        // 가장 많이 도출된 identifier
        mostClassificationIdentifier = mostFrequentClassification!.key
     }
    }

모델을 연결해 오디오를 분석하는 메서드⬇️
 
        func classifyAudio(){
        
        let genderAnalyzer = try! SNAudioFileAnalyzer
        (url: audioRecorder.recordedFile!)
        
        let userTypeAnalyzer = try! SNAudioFileAnalyzer
        (url: audioRecorder.recordedFile!)
        
        let request = try! SNClassifySoundRequest
        (mlModel: genderClassifier().model)
        do{
            try? genderAnalyzer.add(request, withObserver: genderObserver)
            try genderAnalyzer.analyze()
        }
        
        gender = genderObserver.mostClassificationIdentifier
        print(gender)
        
        if gender == "male" {
            let request = try! SNClassifySoundRequest
            (mlModel: maleVoiceClassifier().model)
            do{
                try? userTypeAnalyzer.add(request, 
                withObserver: userTypeObserver)
                try userTypeAnalyzer.analyze()
            }
        }
        else if gender == "female" {
            let request = try! SNClassifySoundRequest
            (mlModel: femaleVoiceClassifier().model)
            do{
                try? userTypeAnalyzer.add(request, 
                withObserver: userTypeObserver)
                try userTypeAnalyzer.analyze()
            }
        }
        
        userType = userTypeObserver.mostClassificationIdentifier
    }

AVFoundation을 사용해 오디오를 녹음하는 기능 ⬇️
           
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
    var recordedFile: URL?
    
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
            print("Failed to configure audio session: 
            
            \(error.localizedDescription)")
        }
    }
    
    // 음성 메모 녹음 관련 메서드
    // 받아올 때 형식과 확장자를 
    func startRecording() {
        let fileURL = getDocumentsDirectory()
        .appendingPathComponent("recording-\(Date().timeIntervalSince1970).wav")
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
            audioRecorder = try AVAudioRecorder
            (url: fileURL, settings: settings)
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
        let paths = FileManager.default.urls(for: .documentDirectory, 
        in: .userDomainMask)
        return paths[0]
    }
     }
        
