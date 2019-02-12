//
//  ProvidersRepository.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/11/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class PlistProvidersRepository: ProvidersRepositoryProtocol {
    
    private var plistName: String
    
    init(plistName: String) {
        self.plistName = plistName
    }
    
    func getProvidersJSON() -> [String : Any] {
        guard let path = Bundle.main.path(forResource: plistName, ofType: "plist") else { return [:] }
        guard let json = NSDictionary(contentsOfFile: path) as? [String: Any] else { return [:] }
        return json
    }
    
}
