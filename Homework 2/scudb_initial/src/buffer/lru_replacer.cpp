/**
 * LRU implementation
 */
#include "buffer/lru_replacer.h"
#include "page/page.h"

namespace scudb {

template <typename T> LRUReplacer<T>::LRUReplacer() {
  head = make_shared<Node>();
  tail = make_shared<Node>();
  head->next = tail;
  tail->prev = head;
}
template <typename T> LRUReplacer<T>::~LRUReplacer() {}

/*
 * Insert value into LRU
 */
template <typename T> void LRUReplacer<T>::Insert(const T &value) {
  lock_guard<mutex> lck(latch);
  shared_ptr<Node> tmp;
  if (map.find(value) != map.end()) {
    tmp = map[value];
    shared_ptr<Node> pre = tmp->prev;
    shared_ptr<Node> nex = tmp->next;
    pre->next = nex;
    nex->prev = pre;
  }
  else {
    tmp = make_shared<Node>(value);
  }
  shared_ptr<Node> last = tail->prev;
  tmp->prev = last;
  tmp->next = tail;
  tail->prev = tmp;
  last->next = tmp;
  map[value] = tmp;
  return;
}

/* If LRU is non-empty, pop the head member from LRU to argument "value", and
 * return true. If LRU is empty, return false
 */
template <typename T> bool LRUReplacer<T>::Victim(T &value) {
  lock_guard<mutex> lck(latch);
  if (!map.empty()) {
      shared_ptr<Node> tmp = head->next;
      head->next = tmp->next;
      tmp->next->prev = head;
      value = tmp->val;
      map.erase(tmp->val);
      return true;
  }
  else
      return false;
}

/*
 * Remove value from LRU. If removal is successful, return true, otherwise
 * return false
 */
template <typename T> bool LRUReplacer<T>::Erase(const T &value) {
  lock_guard<mutex> lck(latch);
  if (map.find(value) != map.end()) {
    shared_ptr<Node> tmp = map[value];
    tmp->prev->next = tmp->next;
    tmp->next->prev = tmp->prev;
  }
  return map.erase(value);
}

template <typename T> size_t LRUReplacer<T>::Size() {
  lock_guard<mutex> lck(latch);
  return map.size();
}
template class LRUReplacer<Page *>;
template class LRUReplacer<int>;


}
