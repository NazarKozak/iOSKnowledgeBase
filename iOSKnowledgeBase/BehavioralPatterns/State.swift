//
//  State.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// State is a behavioral design pattern that allows an object to change the behavior when its internal state changes.
/// The pattern extracts state-related behaviors into separate state classes and forces the original object to delegate the work to an instance of these classes, instead of acting on its own.
/// Usage examples: The State pattern is commonly used in Swift to convert massive switch-base state machines into objects.
/// Identification: State pattern can be recognized by methods that change their behavior depending on the objects’ state, controlled externally.

import Foundation

class StateRealWorld {
    func test() {
        print("Client: I'm starting working with a location tracker")
        let tracker = LocationTracker()

        print()
        tracker.startTracking()

        print()
        tracker.pauseTracking(for: 2)

        print()
        tracker.makeCheckIn()

        print()
        tracker.findMyChildren()

        print()
        tracker.stopTracking()
    }
}

class LocationTracker {
    /// Location tracking is enabled by default
    private lazy var trackingState: TrackingState = EnabledTrackingState(tracker: self)

    func startTracking() {
        trackingState.startTracking()
    }

    func stopTracking() {
        trackingState.stopTracking()
    }

    func pauseTracking(for time: TimeInterval) {
        trackingState.pauseTracking(for: time)
    }

    func makeCheckIn() {
        trackingState.makeCheckIn()
    }

    func findMyChildren() {
        trackingState.findMyChildren()
    }

    func update(state: TrackingState) {
        trackingState = state
    }
}

protocol TrackingState {
    func startTracking()
    func stopTracking()
    func pauseTracking(for time: TimeInterval)

    func makeCheckIn()
    func findMyChildren()
}

class EnabledTrackingState: TrackingState {
    private weak var tracker: LocationTracker?

    init(tracker: LocationTracker?) {
        self.tracker = tracker
    }

    func startTracking() {
        print("EnabledTrackingState: startTracking is invoked")
        print("EnabledTrackingState: tracking location....1")
        print("EnabledTrackingState: tracking location....2")
        print("EnabledTrackingState: tracking location....3")
    }

    func stopTracking() {
        print("EnabledTrackingState: Received 'stop tracking'")
        print("EnabledTrackingState: Changing state to 'disabled'...")
        tracker?.update(state: DisabledTrackingState(tracker: tracker))
        tracker?.stopTracking()
    }

    func pauseTracking(for time: TimeInterval) {
        print("EnabledTrackingState: Received 'pause tracking' for \(time) seconds")
        print("EnabledTrackingState: Changing state to 'disabled'...")
        tracker?.update(state: DisabledTrackingState(tracker: tracker))
        tracker?.pauseTracking(for: time)
    }

    func makeCheckIn() {
        print("EnabledTrackingState: performing check-in at the current location")
    }

    func findMyChildren() {
        print("EnabledTrackingState: searching for children...")
    }
}

class DisabledTrackingState: TrackingState {
    private weak var tracker: LocationTracker?

    init(tracker: LocationTracker?) {
        self.tracker = tracker
    }

    func startTracking() {
        print("DisabledTrackingState: Received 'start tracking'")
        print("DisabledTrackingState: Changing state to 'enabled'...")
        tracker?.update(state: EnabledTrackingState(tracker: tracker))
    }

    func pauseTracking(for time: TimeInterval) {
        print("DisabledTrackingState: Pause tracking for \(time) seconds")

        for i in 0...Int(time) {
            print("DisabledTrackingState: pause...\(i)")
        }

        print("DisabledTrackingState: Time is over")
        print("DisabledTrackingState: Returing to 'enabled state'...\n")
        self.tracker?.update(state: EnabledTrackingState(tracker: self.tracker))
        self.tracker?.startTracking()
    }

    func stopTracking() {
        print("DisabledTrackingState: Received 'stop tracking'")
        print("DisabledTrackingState: Do nothing...")
    }

    func makeCheckIn() {
        print("DisabledTrackingState: Received 'make check-in'")
        print("DisabledTrackingState: Changing state to 'enabled'...")
        tracker?.update(state: EnabledTrackingState(tracker: tracker))
        tracker?.makeCheckIn()
    }

    func findMyChildren() {
        print("DisabledTrackingState: Received 'find my children'")
        print("DisabledTrackingState: Changing state to 'enabled'...")
        tracker?.update(state: EnabledTrackingState(tracker: tracker))
        tracker?.findMyChildren()
    }
}
