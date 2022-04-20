import 'list_node.dart';

main() {
  final l1 = toListNode([1,2,3]);
  print(l1);
  final l2 = toListNode([4,5,6]);
  final head = solution(l1, l2);
}

ListNode<int>? toListNode(List<int> list) {
  ListNode<int> head = ListNode(0);
  ListNode? curr = head;
  for(int i = 0; i < list.length; i++) {
    curr?.next = ListNode(list[i]);
    curr = curr?.next;
  }
  return head.next;
}


ListNode<int>? solution(ListNode<int>? l1, ListNode<int>? l2) {
  ListNode<int> headNode = ListNode(0);
  ListNode<int>? tailNode = headNode;

  ListNode<int>? left = l1;
  ListNode<int>? right = l2;

  if(left == null && right == null) {
    return null;
  }
  if(left == null && right != null) {
    headNode.next = right;
    tailNode = headNode.next;
    right = right.next;
  } else if(left != null && right == null) {
    headNode.next = left;
    tailNode = headNode.next;
    left = left.next;
  } else if(left!.value <= right!.value) {
    headNode.next = left;
    tailNode = headNode.next;
    left = left.next;
  } else {
    headNode.next = right;
    tailNode = headNode.next;
    right = right.next;
  }

  while(left != null && right != null) {
    if(left == null) {
      tailNode!.next = right;
      right = right.next;
    }
    if(right == null) {
      tailNode!.next = left;
      left = left.next;
    }
    if(left!.value <= right!.value) {
      tailNode!.next = left;
      left = left.next;
    } else {
      tailNode!.next = right;
      right = right.next;
    }
  }

  return headNode;
}
