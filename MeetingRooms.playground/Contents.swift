import UIKit

/// PROBLEM:
/// Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei).
/// Find the minimum number of conference rooms required. Time complexity: O(nlogn), space: O(n)
/// Example 1:
/// Input: [[0, 30],[5, 10],[15, 20]] Output: 2
///
/// Example 2:
/// Input: [[7,10],[2,4]] Output: 1
/// - Parameter: intervals: Array of meetings

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    if intervals.isEmpty {
        return 0
    }
    
    var start: [Int] = [] // [0, 5, 15] after sorting
    var end: [Int] = [] //   [10, 20, 30] after sorting
    
    for i in 0..<intervals.count {
        start.append(intervals[i][0])
        end.append(intervals[i][1])
    }
    
    /// Start meetings sorted
    start.sort { (meeting1, meeting2) -> Bool in
        return meeting1 < meeting2
    }
    /// End meetings sorted
    end.sort { (meeting1, meeting2) -> Bool in
        return meeting1 < meeting2
    }
    
    var startPointer = 0, endPointer = 0
    var usedRooms = 0   // 1, 2
    
    while startPointer < intervals.count {
        // If there is a meeting that ended, decrement usedRooms and endPointer
        if start[startPointer] >= end[endPointer] {
            usedRooms -= 1
            endPointer += 1
        }
        // We do the below irrespective of wether a room frees up or not.
        // If a room got free, then this usedRooms += 1 has no effect.
        // If no room was free, then we're incrementing usedRooms
        usedRooms += 1
        startPointer += 1
    }
    
    return usedRooms
}

let meetings = [[0, 30],[5, 10],[15, 20]]
minMeetingRooms(meetings)
