//
//  testTreeQuiz.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-21.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func testGetParent() {
    let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    do {
        // Get the directory contents urls (including subfolders urls)
        let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
        print(directoryContents)

        // if you want to filter the directory contents you can do like this:
        let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
        print("mp3 urls:",mp3Files)
        let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
        print("mp3 list:", mp3FileNames)

    } catch {
        print(error)
    }
}
