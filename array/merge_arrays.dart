main() {
  List<int> nums1 = [1, 2, 3, 0, 0, 0];
  List<int> nums2 = [2, 5, 6];
  List<int> answer = mergeArrays(nums1, 3, nums2, 3);
  print('Answer: $answer');

  nums1 = <int>[1];
  nums2 = <int>[];
  answer = mergeArrays(nums1, 1, nums2, 0);
  print('Answer: $answer');

  nums1 = <int>[0];
  nums2 = <int>[1];
  answer = mergeArrays(nums1, 0, nums2, 1);
  print('Answer: $answer');
}

List<int> mergeArrays(List<int> nums1, int m, List<int> nums2, int n) {
  List<int> result = [];
  int i = 0;
  int j = 0;

  while(i < m && j < n) {
    if(nums1[i] < nums2[j]) {
      result.add(nums1[i]);
      i++;
    } else {
      result.add(nums2[j]);
      j++;
    }
  }

  while (i < m) {
    result.add(nums1[i]);
    i++;
  }

  while (j < n) {
    result.add(nums2[j]);
    j++;
  }

  return result;
}
