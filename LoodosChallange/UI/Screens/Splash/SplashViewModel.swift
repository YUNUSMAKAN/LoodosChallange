//
//  SplashViewModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import Foundation
import Network
import FirebaseRemoteConfig

class SplashViewModel {
    
    //MARK:Properties
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    //MARK:Funstions
    func fetchValuesIfNetworkAvailable(completion: @escaping (String?) -> ()) {
        monitorNetwork { (networkStatus) in
            networkStatus ? self.fetchValues(completion: completion) : completion(nil)
        }
    }
    
    private func fetchValues(completion: @escaping (String) -> ()) {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { (status, error) in
            if status == .success, error == nil {
                self.remoteConfig.activate { (changed, error) in
                    let title = self.remoteConfig.configValue(forKey: "titleText").stringValue ?? "Warning"
                    completion(title)
                    return
                }
            } else {
                print("Wrong")
            }
        }
    }
    
    private func monitorNetwork(completion: @escaping (Bool) -> ()) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion(true)
                return
            } else {
                completion(false)
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
}
