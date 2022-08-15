//
//  DetailPageDTO.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

struct DetailPageDTO: Codable {
    let screenshotUrls: [String]
    let ipadScreenshotUrls, appletvScreenshotUrls: [String]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewURL: String
    let isGameCenterEnabled: Bool
    let advisories: [String]
    let supportedDevices: [String]
    let features: [String]
    let kind: String
    let averageUserRating: Double
    let formattedPrice, minimumOSVersion, trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes, contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let trackViewURL: String
    let trackContentRating: String
    let currentVersionReleaseDate: Date
    let releaseNotes, resultDescription: String
    let genreIDS: [String]
    let releaseDate: String
    let primaryGenreName: String
    let primaryGenreID: Int
    let bundleID: String
    let trackID: Int
    let trackName, sellerName, currency: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let version, wrapperType: String
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case screenshotUrls, ipadScreenshotUrls, appletvScreenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
        case artistViewURL = "artistViewUrl"
        case isGameCenterEnabled, advisories, supportedDevices, features, kind, averageUserRating, formattedPrice
        case minimumOSVersion = "minimumOsVersion"
        case trackCensoredName, languageCodesISO2A, fileSizeBytes, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion
        case trackViewURL = "trackViewUrl"
        case trackContentRating, currentVersionReleaseDate, releaseNotes
        case resultDescription = "description"
        case genreIDS = "genreIds"
        case releaseDate, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case bundleID = "bundleId"
        case trackID = "trackId"
        case trackName, sellerName, currency, isVppDeviceBasedLicensingEnabled
        case artistID = "artistId"
        case artistName, genres, price, version, wrapperType, userRatingCount
    }
}
