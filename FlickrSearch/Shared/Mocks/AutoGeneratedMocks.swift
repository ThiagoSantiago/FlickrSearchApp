// Generated using Sourcery 2.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import FlickrSearch






















class FlickrSearchClientProtocolMock: FlickrSearchClientProtocol {


    var endpoint: String {
        get { return underlyingEndpoint }
        set(value) { underlyingEndpoint = value }
    }
    var underlyingEndpoint: String!
    var method: HTTPMethod {
        get { return underlyingMethod }
        set(value) { underlyingMethod = value }
    }
    var underlyingMethod: HTTPMethod!
    var parameters: [String: String] = [:]
    var headers: [String : String] = [:]


}
class FlickrSearchImageNavigatorMock: FlickrSearchImageNavigator {




    //MARK: - navigatToImageDetails

    var navigatToImageDetailsCallsCount = 0
    var navigatToImageDetailsCalled: Bool {
        return navigatToImageDetailsCallsCount > 0
    }
    var navigatToImageDetailsClosure: (() -> Void)?

    func navigatToImageDetails() {
        navigatToImageDetailsCallsCount += 1
        navigatToImageDetailsClosure?()
    }

}
class FlickrSearchImageRepositoryProtocolMock: FlickrSearchImageRepositoryProtocol {




    //MARK: - searchImage

    var searchImageThrowableError: Error?
    var searchImageCallsCount = 0
    var searchImageCalled: Bool {
        return searchImageCallsCount > 0
    }
    var searchImageReceivedText: String?
    var searchImageReceivedInvocations: [String] = []
    var searchImageReturnValue: [SearchedImageDomainModel]!
    var searchImageClosure: ((String) async throws -> [SearchedImageDomainModel])?

    func searchImage(_ text: String) async throws -> [SearchedImageDomainModel] {
        if let error = searchImageThrowableError {
            throw error
        }
        searchImageCallsCount += 1
        searchImageReceivedText = text
        searchImageReceivedInvocations.append(text)
        if let searchImageClosure = searchImageClosure {
            return try await searchImageClosure(text)
        } else {
            return searchImageReturnValue
        }
    }

}
