//
//  errorServices.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import Foundation
import Alamofire

struct ErrorServices: Error {
  let initialError: AFError
  let backendError: ErrorServicesBackend?
}

struct ErrorServicesBackend: Codable, Error {
    var status: String
    var message: String
}
