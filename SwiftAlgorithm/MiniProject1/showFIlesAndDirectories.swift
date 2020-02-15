//
//  showFIlesAndDirectories.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-13.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation


func showDirectories() {
    let path = "/Users/naoki/development/ciccc/Swift/SwiftAlgorithm/SwiftAlgorithm" // change your directory
    print("SwiftAlgorithm")  // change your target directory name
    var filesCount = 0
    var dirsCount = 0
    getAllFilesAndDirectories(url: path, targetName: "SwiftAlgorithm", sign: "", filesCount: &filesCount, dirsCount: &dirsCount)
    print("\(dirsCount) directories, \(filesCount) files")
}


func getAllFilesAndDirectories(url: String, targetName: String, sign: String, filesCount: inout Int, dirsCount: inout Int) {
    let f = FileManager()
    guard let files = try? f.contentsOfDirectory(atPath: url) else {
        return
    }
    let lastIndex: Int = files.endIndex - 1
    for (idx, file) in files.enumerated() {
        var isDir : ObjCBool = false
        let filePath = url + "/" + file
        f.fileExists(atPath: filePath, isDirectory: &isDir)

        var addSign: String = ""
        var passSign: String = ""
        if idx == lastIndex {
            addSign = "└─ "
            passSign = sign + "  "
        } else {
            addSign = "├─ "
            passSign = sign + "│ "
        }

        if isDir.boolValue {
            print(sign + addSign + file)
            dirsCount += 1
            getAllFilesAndDirectories(url: filePath, targetName: file, sign: passSign, filesCount: &filesCount, dirsCount: &dirsCount)
        } else {
            filesCount += 1
            print(sign + addSign + file)
        }
    }
}
