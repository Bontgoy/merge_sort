def merge_sort(list)
  if list.length <= 1
    list
  else
    # [5,3,2,6,45,12,1].length == 7
    mid = (list.length / 2).floor
    # mid = 3
    left = merge_sort(list[0..(mid - 1)])
    right = merge_sort(list[mid..list.length])

    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

p merge_sort([5,3,2,6,45,12,1])










#
# def merge_sort(list)
#   puts "list #{list}"
#   if list.length <= 1
#     list
#   else
#     mid = (list.length / 2).floor
#
#     puts "left = merge_sort(#{list[0..(mid - 1)]})"
#     left = merge_sort(list[0..(mid - 1)])
#
#     puts "right merge_sort(#{list[mid..list.length]})"
#     right = merge_sort(list[mid..list.length])
#     puts "merge(#{left}, #{right})"
#     merge(left, right)
#   end
# end
#
# def merge(left, right)
#   if left.empty?
#     puts "right wins: #{right}"
#     win = right
#   elsif right.empty?
#     puts "left wins: #{left}"
#     win = left
#   elsif left.first < right.first
#     puts "left wins: #{[left.first]} merge(#{left[1..left.length]}, #{right})"
#     win = [left.first] + merge(left[1..left.length], right)
#   else
#     puts "right wins: #{[right.first]} merge(#{left}, #{right[1..right.length]})"
#     win = [right.first] + merge(left, right[1..right.length])
#   end
#   puts
#   win
# end
#
# p merge_sort([5,3,2,6,45,9,12])

# list [5, 3, 2, 6, 45, 9, 12]

# left = merge_sort([5, 3, 2])
  # list [5, 3, 2]
  # left = merge_sort([5])
    # list [5]

    # right merge_sort([3, 2])
      # list [3, 2]
      # left = merge_sort([3])
      # list [3]
      # list [2] return to right

      # merge([3], [2])
      # right wins: [2]
        # merge([3], [])
        # left wins: [3]

      # return to merge [3,2] returns to right

  # merge([5], [2, 3])
  # right wins: [2] merge([5], [3])
    # right wins: [3] merge([5], [])
      # left wins: [5]

# [2,3,5] returns to left

# right merge_sort([6, 45, 9, 12])
  # list [6, 45, 9, 12]
  # left = merge_sort([6, 45])
    # list [6, 45]
    # left = merge_sort([6])
      # list [6]
    # right merge_sort([45])
      # list [45]

    # merge([6], [45])
      # left wins: [6] merge([], [45])
        # right wins: [45]

    # [6,45] returns left

  # right merge_sort([9, 12])
    # list [9, 12]
    # left = merge_sort([9])
      # list [9]

    # right merge_sort([12])
      # list [12]

    # merge([9], [12])
      # left wins: [9] merge([], [12])
        # right wins: [12]

    # [9, 12] returns right

    # merge([6, 45], [9, 12])
      # left wins: [6] merge([45], [9, 12])
        # right wins: [9] merge([45], [12])
          # right wins: [12] merge([45], [])
            # left wins: [45]
              # [12,45]
                # to [9,12,45]
    # to right [6,9,12,45]

# merge([2, 3, 5], [6, 9, 12, 45])
  # left wins: [2] merge([3, 5], [6, 9, 12, 45])
    # left wins: [3] merge([5], [6, 9, 12, 45])
      # left wins: [5] merge([], [6, 9, 12, 45])
        # right wins: [6, 9, 12, 45]

# return [2, 3, 5, 6, 9, 12, 45]
