//
//  VideoView.swift
//  CustomListAndHeader
//
//  Created by Nguyễn Trung Kiên on 18/8/25.

import SwiftUI
import AVFoundation

struct CustomVideoView: View {
    @State private var goToCamera = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Futures")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            
            VideoPlayerContainer(videoName: "card2_video", videoType: "mp4")
                .frame(height: 400)
                .cornerRadius(16)
                .padding(.horizontal)
                .onTapGesture {
                    goToCamera = true
                }
        }
        .background(
            NavigationLink("", destination: CameraVC(), isActive: $goToCamera)
                .hidden()
        )
    }
}

struct VideoPlayerContainer: UIViewRepresentable {
    let videoName: String
    let videoType: String
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(videoName: videoName, videoType: videoType)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

class PlayerUIView: UIView {
    private var player: AVPlayer?
    
    init(videoName: String, videoType: String) {
        super.init(frame: .zero)
        
        if let url = Bundle.main.url(forResource: videoName, withExtension: videoType) {
            let player = AVPlayer(url: url)
            self.player = player
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.videoGravity = .resizeAspect
            layer.addSublayer(playerLayer)
            
            player.play()
            
            // Lặp lại liên tục
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: player.currentItem,
                queue: .main
            ) { _ in
                player.seek(to: .zero)
                player.play()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct CameraVC: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("CameraVC")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}
