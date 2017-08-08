function mergeSort(list) {
  if (list.length <= 1) {
    return list;
  } else {
    var mid = Math.floor(list.length / 2);
    var left = mergeSort(list.slice(0, (mid)));
    var right = mergeSort(list.slice((mid), (list.length)));

    return merge(left, right);
  };
}

function merge(left, right) {
  if (left.length < 1) {
    return right;
  } else if (right.length < 1) {
    return left;
  } else if (left[0] < right[0]) {
    return [left[0]].concat(merge(left.slice(1, left.length), right));
  } else {
    return [right[0]].concat(merge(left, right.slice(1, (right.length))));
  };
}

console.log(mergeSort([5,3,2,6,45,12,1]))
