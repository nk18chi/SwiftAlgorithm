//
//  sushiReview.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-26.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func getNumberOfRealSushiRestaurants() {
    // create connection between restaurants
    let firstLine: [Substring] = readLine()!.split(separator: " ")
    let n: Int = Int(firstLine[0])!
//    let m: Int = Int(firstLine[1])!
    let realList: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    var links = [[Int]](repeating: [], count: n)
    for _ in 0..<n - 1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        links[u].append(v)
        links[v].append(u)
    }
    
    // calculate
    func dfs(num: Int, seen: inout Set<Int>) -> Int {
        seen.insert(num)
        var child: [Int] = []
        for l in links[num] {
            if seen.contains(l) { continue }
            var path = dfs(num: l, seen: &seen)
            if path == 0 && realList.contains(l) {
                path = 1
            }
            if path < 1 { continue }
            child.append(path)
        }
        if child.count < 1 { return 0 }
        var sum = child.reduce(0, +)
        if child.count > 1 {
            let max = child.max()!
            sum -= max
            sum *= 2
            sum += max
        }
        sum += 1
        return sum
    }
    
    var minPath = -1
    for r in realList {
        var seen: Set<Int> = []
        let val: Int = dfs(num: r, seen: &seen) - 1
        minPath = minPath < 0 ? val : min(minPath, val)
    }
    print(minPath)
}


//// below code is for testing()
//
//func matches(for regex: String, in text: String) -> [String] {
//    do {
//        let regex = try NSRegularExpression(pattern: regex)
//        let results = regex.matches(in: text,
//                                    range: NSRange(text.startIndex..., in: text))
//        return results.map {
//            String(text[Range($0.range, in: text)!])
//        }
//    } catch let error {
//        print("invalid regex: \(error.localizedDescription)")
//        return []
//    }
//}
//
//extension String {
//    func groups(for regexPattern: String) -> [[String]] {
//    do {
//        let text = self
//        let regex = try NSRegularExpression(pattern: regexPattern)
//        let matches = regex.matches(in: text,
//                                    range: NSRange(text.startIndex..., in: text))
//        return matches.map { match in
//            return (0..<match.numberOfRanges).map {
//                let rangeBounds = match.range(at: $0)
//                guard let range = Range(rangeBounds, in: text) else {
//                    return ""
//                }
//                return String(text[range])
//            }
//        }
//    } catch let error {
//        print("invalid regex: \(error.localizedDescription)")
//        return []
//    }
//}
//}
//
//func test_getNumberOfRealSushiRestaurants() {
//    let path = "/Users/naoki/development/ciccc/Swift/SwiftAlgorithm/SwiftAlgorithm/Graph/TestCases"
//    let f = FileManager()
//    guard let files = try? f.contentsOfDirectory(atPath: path) else { return }
//    let inputFiles = files.filter{$0.contains(".in")}
//    let outputFiles = files.filter{$0.contains(".out")}
//    let res = inputFiles[0].groups(for:"(.*).in")
//    print(res[0][1])
//
//    let fileURL = "/Users/naoki/development/ciccc/Swift/SwiftAlgorithm/SwiftAlgorithm/Graph/TestCases/sushi.9.in"
//    if let path = Bundle.main.path(forAuxiliaryExecutable: fileURL) {
//        do {
//            let data = try String(contentsOfFile: path, encoding: .utf8)
//            let myStrings = data.components(separatedBy: .newlines)
//            let text = myStrings.joined(separator: "\n")
//            print("\(text)")
//        } catch {
//            print(error)
//        }
//    }
//}
