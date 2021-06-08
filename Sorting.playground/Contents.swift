import UIKit

func bubbleSort(_ arr: [Int]) -> [Int] {
    
    var sorted: [Int] = arr
    
    for _ in 0..<arr.count {
        for j in 0..<arr.count - 1 {
            if sorted[j] > sorted[j + 1] {
                let lower = sorted[j]
                let higher = sorted[j + 1]
                sorted[j] = higher
                sorted[j+1] = lower
            }
        }
    }
    
    return sorted
}

bubbleSort([21, 4, 1, 3, 9, 20, 25])

/*
 [21] [4] [1] [3] [9] [20] [25]
 
 [21] [4, 1] [3, 9] [20, 25]
 
 [21,1,4] [3,9,20,25]
 
 [1,4,21] [3,9,20,25]
 
 [1,3,4,9,20,21,25]
 
 
 
 **/

func mergeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }
    
    var result: [Int] = startSort(arr)
    
    return []
}

func startSort(_ arr: [Int]) -> [Int] {
    var subArr: [[Int]] = []
    
    return []
}



mergeSort([21,4 ,1 ,3 ,9 ,20 ,25])



