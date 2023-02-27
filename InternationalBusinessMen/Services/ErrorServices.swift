//
//  errorServices.swift
//  InternationalBusinessMen
//
//  Created by Claudenir on 03/02/2023.
//

import Foundation
import Alamofire

/// A custom error type that encapsulates both an `AFError` and a `ErrorServicesBackend` error.
struct ErrorServices: Error {
    let initialError: AFError  // The initial error that occurred.
    let backendError: ErrorServicesBackend?  // The backend error, if there is one.
}

/// A Codable struct that represents an error from the backend API.
struct ErrorServicesBackend: Codable, Error {
    var status: String  // The status code of the error.
    var message: String  // The error message.
}
