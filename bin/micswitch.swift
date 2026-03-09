import CoreAudio
import Foundation

let preferredDeviceName = "Deity VO-7U"

func getDeviceName(_ deviceID: AudioDeviceID) -> String? {
    var name = "" as CFString
    var size = UInt32(MemoryLayout<CFString>.size)
    var addr = AudioObjectPropertyAddress(
        mSelector: kAudioDevicePropertyDeviceNameCFString,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMain
    )
    let err = AudioObjectGetPropertyData(deviceID, &addr, 0, nil, &size, &name)
    return err == noErr ? (name as String) : nil
}

func setDefaultInputDevice(named targetName: String) {
    var size = UInt32(0)
    var addr = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDevices,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMain
    )
    AudioObjectGetPropertyDataSize(AudioObjectID(kAudioObjectSystemObject), &addr, 0, nil, &size)
    let count = Int(size) / MemoryLayout<AudioDeviceID>.size
    var devices = [AudioDeviceID](repeating: 0, count: count)
    AudioObjectGetPropertyData(AudioObjectID(kAudioObjectSystemObject), &addr, 0, nil, &size, &devices)

    for id in devices {
        if getDeviceName(id) == targetName {
            var inputAddr = AudioObjectPropertyAddress(
                mSelector: kAudioHardwarePropertyDefaultInputDevice,
                mScope: kAudioObjectPropertyScopeGlobal,
                mElement: kAudioObjectPropertyElementMain
            )
            var devID = id
            AudioObjectSetPropertyData(AudioObjectID(kAudioObjectSystemObject), &inputAddr, 0, nil,
                                       UInt32(MemoryLayout<AudioDeviceID>.size), &devID)
            print("Switched input to: \(targetName)")
            return
        }
    }
    print("Device not found: \(targetName)")
}

var listenerAddr = AudioObjectPropertyAddress(
    mSelector: kAudioHardwarePropertyDefaultInputDevice,
    mScope: kAudioObjectPropertyScopeGlobal,
    mElement: kAudioObjectPropertyElementMain
)

AudioObjectAddPropertyListenerBlock(AudioObjectID(kAudioObjectSystemObject), &listenerAddr, nil) { _, _ in
    setDefaultInputDevice(named: preferredDeviceName)
}

print("Listening for audio input changes...")
RunLoop.main.run()
