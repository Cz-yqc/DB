#include <list>

#include "hash/extendible_hash.h"
#include "page/page.h"
#include "math.h"
using namespace std;

namespace scudb {

/*
 * constructor
 * array_size: fixed array size for each bucket
 */
template<typename K, typename V>
ExtendibleHash<K, V>::ExtendibleHash() {
    ExtendibleHash(64);
}
template <typename K, typename V>
ExtendibleHash<K, V>::ExtendibleHash(size_t size) : globalDepth(0),bucketSize(size),bucketNum(1) {
    buckets.push_back(make_shared<Bucket>(0));
}

/*
 * helper function to calculate the hashing address of input key
 */
template <typename K, typename V>
size_t ExtendibleHash<K, V>::HashKey(const K &key) const{
    return hash<K>{}(key);
}

/*
 * lookup function to find value associate with input key
 */
template <typename K, typename V>
bool ExtendibleHash<K, V>::Find(const K &key, V &value) {
  int i = getIdx(key);
  lock_guard<mutex> lck(buckets[i]->latch);
  if (buckets[i]->kmap.find(key) == buckets[i]->kmap.end()) {
  	return false;
  }
  value = buckets[i]->kmap[key];
  return true;
}

/*
 * insert <key,value> entry in hash table
 * Split & Redistribute bucket when there is overflow and if necessary increase
 * global depth
 */
template <typename K, typename V>
void ExtendibleHash<K, V>::Insert(const K &key, const V &value) {
  int i = getIdx(key);
  shared_ptr<Bucket> tmp = buckets[i];
  while (1) {
    lock_guard<mutex> lck(tmp->latch);
    if (tmp->kmap.find(key) != tmp->kmap.end() || tmp->kmap.size() < bucketSize) {
      tmp->kmap[key] = value;
      break;
    }
    int mask = pow(2, tmp->localDepth);
    tmp->localDepth++;
    {
      lock_guard<mutex> lck2(latch);
      if (tmp->localDepth > globalDepth) {
        size_t length = buckets.size();
        for (size_t j = 0; j < length; j++) {
          buckets.push_back(buckets[j]);
        }
        globalDepth++;
      }
      bucketNum++;
      auto newBuc = make_shared<Bucket>(tmp->localDepth);
      typename map<K, V>::iterator iter;
      for (iter = tmp->kmap.begin(); iter != tmp->kmap.end(); ) {
        if (HashKey(iter->first) & mask) {
          newBuc->kmap[iter->first] = iter->second;
          iter = tmp->kmap.erase(iter);
        } 
		else iter++;
      }
      for (size_t j = 0; j < buckets.size(); j++) {
        if (buckets[j] == tmp && (j & mask))
          buckets[j] = newBuc;
      }
    }
    i = getIdx(key);
    tmp = buckets[i];
  }
}


/*
 * delete <key,value> entry in hash table
 * Shrink & Combination is not required for this project
 */
template <typename K, typename V>
bool ExtendibleHash<K, V>::Remove(const K &key) {
  int i = getIdx(key);
  lock_guard<mutex> lck(buckets[i]->latch);
  shared_ptr<Bucket> tmp = buckets[i];
  if (tmp->kmap.find(key) == tmp->kmap.end()) {
    return false;
  }
  tmp->kmap.erase(key);
  return true;
}

/*
 * helper function to return global depth of hash table
 * NOTE: you must implement this function in order to pass test
 */
template <typename K, typename V>
int ExtendibleHash<K, V>::GetGlobalDepth() const{
    lock_guard<mutex> lock(latch);
    return globalDepth;
}

/*
 * helper function to return local depth of one specific bucket
 * NOTE: you must implement this function in order to pass test
 */
template <typename K, typename V>
int ExtendibleHash<K, V>::GetLocalDepth(int bucket_id) const {
  if (buckets[bucket_id]) {
      lock_guard<mutex> lck(buckets[bucket_id]->latch);
      if (buckets[bucket_id]->kmap.size() == 0) return -1;
      return buckets[bucket_id]->localDepth;
  }
  return -1;
}

/*
 * helper function to return current number of bucket in hash table
 */
template <typename K, typename V>
int ExtendibleHash<K, V>::GetNumBuckets() const{
    lock_guard<mutex> lock(latch);
    return bucketNum;
}


template <typename K, typename V>
int ExtendibleHash<K, V>::getIdx(const K &key) const{
    lock_guard<mutex> lck(latch);
     return HashKey(key) & ((1 << globalDepth) - 1);
}


template class ExtendibleHash<page_id_t, Page *>;
template class ExtendibleHash<Page *, std::list<Page *>::iterator>;
template class ExtendibleHash<int, std::string>;
template class ExtendibleHash<int, std::list<int>::iterator>;
template class ExtendibleHash<int, int>;
} 
