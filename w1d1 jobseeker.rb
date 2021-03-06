
# In a 2 dimensional array grid, each value grid[i][j] represents the height of a building located there. We are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings). Height 0 is considered to be a building as well.

# At the end, the "skyline" when viewed from all four directions of the grid, i.e. top, bottom, left, and right, must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance. See the following example.

# What is the maximum total sum that the height of the buildings can be increased?

# Example
# Input: grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
# Output: 35



#  [[3,0,8,4]
#  ,[2,4,5,7]
#  ,[9,2,6,3]
#  ,[0,3,1,0]]


#  5 4 0 3   12
#  5 0 2 0   7
#  0 2 2 4   8
#  3 0 2 3   8

def testfun(mat)
  output = 0
  col_max = []
  i = 0
  while i < mat[0].length
    max = 0
    mat.each do |arr|
      if arr[i] > max
        max = arr[i]
      end
    end
    col_max << max
    i+=1
  end

  mat.each_with_index do |arr, row|
    arr.each_with_index do |el, col|
      if el != mat[row].max or el != col_max[col]
        if col_max[col] > mat[row].max
          output += (mat[row].max - el)
        else
          output += (col_max[col] - el)
        end
      end
    end
  end
  output
end
test = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
testfun(test)




# A self-dividing number is a number that is divisible by every digit it contains. For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0,and 128 % 8 == 0.

# Also, a self-dividing number is not allowed to contain the digit zero.

# Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.

# Example
# Input: left = 1, right = 22
# Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]

def is_self_div(input)
  nums = input.to_s.split("")
  output = true
  nums.each do |num|
    return false if num.to_i == 0
    output = false if input % num.to_i != 0 
  end

  output
end


def test(left, right)
  output = []
  i = left
  while i <= right 
    output << i if is_self_div(i)
    i+= 1
  end
  output
end

test(1,22)


# Given an array of length N, with integer values between 0 and N (not including 0 or N), return any integer that appears in the array more than once, i.e.

# [ 1, 2, 3, 3, 4 ] => 3
# [ 3, 1, 2, 2, 5, 5 ] => 2 or 5 (either is fine)
# [ 0, 1, 2 ] => invalid input (can’t have 0)


def find_dups(arr)
  arr = arr.sort
  return "invalid Input" if arr[0] == 0
  arr.each_with_index do |el, idx|
    if idx != arr.length-1
      return el if el == arr[idx+1]
    end

  end

end

find_dups([ 0, 1, 2 ])


# Given a string s, find the longest palindromic substring in s.

# Example:

# Input: "babad" Output: "bab" Note: "aba" is also a valid answer.

# Example: Input: "cbbd" Output: "bb"
# iterate over each index of string
#   if next idx and prev idx are same, 
#     if current len > max
#       change max to cur
    
#     check next and prev,
#   else not pal

def longest_pal(str)
  max = ""
  i = 0
  while i < str.length
    startidx = i - 1
    endidx = i + 1
    while startidx >= 0 and endidx < str.length
      puts "startidx is #{startidx}"
      puts "endidx is #{endidx}"
      if str[i] == str[startidx] and max.length <=2
        max = str[startidx..i]
      end
      if str[startidx] == str[endidx]
        if str[startidx..endidx].length > max.length
          puts "test is #{str[startidx..endidx]}"
          max = str[startidx..endidx]
        end
      end
        startidx -= 1
        endidx += 1
    end

    
    i += 1
  end

  max
end



longest_pal("cbbd")

# Part 1: Say that I gave you an array of length n, containing the numbers 1..n in jumbled order. "Sort" this array in O(n) time. You should be able to do this without looking at the input.

# Part 2: Say that I give you an array of length n with numbers in the range 1..N (N >= n). Sort this array in O(n + N) time. You may use O(N) memory.

# Part 3: Say I give you an array of n strings, each of length k. I claim that, using merge sort, you can sort this in O(knlog(n)), since comparing a pair of strings takes O(k) time.

# I want you to beat that. Sort the strings in O(kn). Hint: do not compare any two strings. You may assume all strings contain only lowercase letters a..z without whitespace or punctuation.
def pt1(arr)
  output = []
  arr.each do |el|
    output[el-1] = el
  end
  output.compact
end


pt1([7,2,1,4,3,9,5,8,6,64])

# Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.

# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

# Example
# Input: [1, 1, 2]

# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

# It doesn't matter what you leave beyond the new length.


def newlen(arr)
  dup_count = 0
  arr.each_with_index do |num, idx|
    if num == arr[idx-1]
      dup_count += 1
    end
  end
  arr.length - dup_count
end

newlen([1, 1, 2,3,4,4,5,6,7,7,7,7,8,9])

# Mergesort 
def mergesort(arr)
  return [] if arr == []
  return arr if arr.length == 1


  left = mergesort(arr[0...1])
  right = mergesort(arr[1..-1])

  # p left
  # puts "==="
  # p right
  new = []
  while left.length > 0 and right.length > 0
    if left[0] < right[0]
     new << left.shift
    else
      new << right.shift
    end
    
  end
  new + left + right

end



test = [1,5,0,6,3,4,78,3,1,4,6,7,5,4,22,45,7,5,3,113,6,3,9]

mergesort(test)

# Write a method that takes an array and returns its duplicate values. Use less than O(n*n) time.

def find_dups(arr)
  track = []
  output = {}
  arr.each do |el|
    if track[el] == nil
      track[el] = el
    else
      output[el] =1
    end
  end
  output.keys
end


find_dups([7,3,5,0,5,5,2,4,4,0,0,0,0,4,2,5])

# (Question and solution taken from Interview Cake) You've created an extremely popular game. You rank players in the game from highest to lowest score. So far you're using an algorithm that sorts in O(nlogn) time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.

# Write a function that takes:

# an array of unsorted_scores
# the highest_possible_score in the game
# and returns a sorted array of scores in less than O(nlogn) time.


scores = [43,6,83,6,21,4,78,64,47,22,96,35,97,67,98,78,86]

def sort_scores(arr, max)
  index = Array.new(max,0)

  arr.each do |score|
    index[score] += 1
  end

  output = []

  index.each_with_index do |el, score|
    el.times do 
      output << score
    end
  end
  output
end


sort_scores(scores,100)

# (Part 1)
# Given an integer between 1-3999, xonvert it to a roman numeral.

# (Part 2)
# Given a roman numeral between 1-3999, convert it to an integer.
# I = 1
# V = 5
# X = 10
# L = 50 
# C = 100
# D = 500
# M = 1000


test = 1423
def to_rome(test)
  output = ''
  
  m = test / 1000
  test = test % 1000

  d = test / 500
  test = test % 500

  c = test / 100
  test = test % 100

  l = test / 50
  test = test % 50

  x = test / 10
  test = test % 10

  v = test / 5
  test = test % 5

  i = test

  m.times do 
    output << "M"
  end
  
  d.times do 
    output << "D"
  end
  
  if c == 4
    output << "CD"
  else
    c.times do 
      output << "C"
    end
  end

  l.times do 
    output << "L"
  end

  if x == 4
    output << "XL"
  else
    x.times do 
      output << "X"
    end
  end  
  v.times do 
    output << "V"
  end

  if i == 4
    output << "IV"
  else
    i.times do 
      output << "I"
    end
  end



  output
end

to_rome(test)

# Jewels and Stones
# You are given two strings, J and S. String J represents the types of stones that are jewels. String S represents all of the stones that you have. Each character in string S is a type of stone you have. You want to know how many of your stones are also jewels.

# Contraints

# The letters in J are guaranteed distinct.
# All characters in J and S are letters.
# Letters are case-sensitive, so "a" is considered a different type of stone from "A".
# Example 1:
# Input: J = "aA", S = "aAAbbbb"
# Output: 3
# Example 2:
# Input: J = "z", S = "ZZ"
# Output: 0


def jcount(j, s)
  jewels = {}
  count = 0
  j.each_char do |char|
    jewels[char] = true
  end

  s.each_char do |char|
    count += 1 if jewels[char]
  end

  count
end
J = "aA"
S = "aAAbbbb"
jcount(J, S)