//
//  LooseCoupling.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// Loose coupling is a design principle that promotes independence and flexibility between components in a system. It minimizes dependencies between modules, allowing them to be easily modified, replaced, or extended without affecting other parts of the system. Let's illustrate loose coupling with an example in Swift:
/// Suppose we have a music player application that can play songs from different sources, such as a local library and an online streaming service. We'll design the application with loose coupling to allow easy integration of new sources in the future.
///
///In this example:
///We define a MusicSource protocol representing a source from which music can be played.
///We provide two implementations of MusicSource: LocalLibrary and OnlineStreamingService.
///The MusicPlayer class depends on the MusicSource protocol rather than concrete implementations. It can play songs from any source that conforms to the protocol.
///By injecting different implementations of MusicSource into MusicPlayer, we achieve loose coupling. The MusicPlayer class is not directly tied to specific music sources, allowing us to easily switch between or add new sources without modifying the MusicPlayer class.
///Loose coupling enhances the maintainability and extensibility of the application. It isolates changes to individual components, reducing the risk of unintended side effects and making the codebase more resilient to future modifications.

import Foundation

// Protocol representing a music source
protocol LSMusicSource {
    func play(song: String)
}

// LocalLibrary implementation
struct LSLocalLibrary: LSMusicSource {
    func play(song: String) {
        print("Playing \(song) from local library")
    }
}

// OnlineStreamingService implementation
struct LSOnlineStreamingService: LSMusicSource {
    func play(song: String) {
        print("Streaming \(song) from online service")
    }
}

// MusicPlayer class
class LSMusicPlayer {
    let musicSource: LSMusicSource

    init(musicSource: LSMusicSource) {
        self.musicSource = musicSource
    }

    func play(song: String) {
        musicSource.play(song: song)
    }
}

//// Usage
//let localLibrary = LSLocalLibrary()
//let onlineStreamingService = LSOnlineStreamingService()
//
//// Create MusicPlayer instances with different music sources
//let localPlayer = LSMusicPlayer(musicSource: localLibrary)
//let streamingPlayer = LSMusicPlayer(musicSource: onlineStreamingService)
//
//// Play songs using different players
//localPlayer.play(song: "Song1.mp3")
//streamingPlayer.play(song: "Song2.mp3")
