main() {
  List<int> nums1 = [1, 2, 3, 0, 0, 0];
  List<int> nums2 = [2, 5, 6];
  List<int> answer = mergeArrays_2(nums1, 3, nums2, 3);
  print('Answer: $answer');

  nums1 = <int>[1];
  nums2 = <int>[];
  answer = mergeArrays_2(nums1, 1, nums2, 0);
  print('Answer: $answer');

  nums1 = <int>[0];
  nums2 = <int>[1];
  answer = mergeArrays_2(nums1, 0, nums2, 1);
  print('Answer: $answer');
}

/// Method 2
List<int> mergeArrays_2(List<int> nums1, int m, List<int> nums2, int n) {
  int p = nums1.length - 1;
  int i = m - 1;
  int j = n - 1;

  if(i < 0) return nums2;

  while(i >= 0 && j >= 0) {
    if(nums2[j] > nums1[i]) {
      nums1[p] = nums2[j];
      j--;
      p--;
    } else {
      nums1[p] = nums1[i];
      nums1[i] = 0;
      i--;
      p--;
    }
  }

  return nums1;
}

/// Method 1
List<int> mergeArrays_1(List<int> nums1, int m, List<int> nums2, int n) {
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
