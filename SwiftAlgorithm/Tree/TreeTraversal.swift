//
//  TreeTraversal.swift
//  SwiftAlgorithm
//
//  Created by 美田直毅 on 2020-02-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation
// First Line: N (# of nodes, 1 <= N <= 26)
// N lines: node, left-child, right-child  (no-child: .)
// Output: Pre-order, In-order, Post-order (each line)
//
// Sample Input
// 7
// A B C
// B D .
// C E F
// E . .
// F . G
// D . .
// G . .
//
// Sample Output
// ABDCEFG
// DBAECFG
// DBEGFCA
var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 27)
func preOrder(_ node: Int) {
  guard node != -1 else { return }
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  preOrder(tree[node][0])
  preOrder(tree[node][1])
}
func inOrder(_ node: Int) {
  guard node != -1 else { return }
  inOrder(tree[node][0])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  inOrder(tree[node][1])
}
func postOrder(_ node: Int) {
  guard node != -1 else { return }
  postOrder(tree[node][0])
  postOrder(tree[node][1])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
}
func treeTraversal() {
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    // A, ... Z
    let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
    let l = Int(Character(nodeInfo[1]).asciiValue!)
    let r = Int(Character(nodeInfo[2]).asciiValue!)
    // ascii 46 is '.'
    tree[x][0] = l == 46 ? -1 : l - 65
    tree[x][1] = r == 46 ? -1 : r - 65
  }
  preOrder(0)
  print("")
  inOrder(0)
  print("")
  postOrder(0)
  print("")
}
