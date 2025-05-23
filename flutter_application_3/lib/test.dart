

void main(){
  List<int> arr = [5, 3, 8, 4, 2];
  bbsort(arr);
  
  print(arr);   
}

void bbsort(List<int> arr){
  for(int i = 0; i < arr.length - 1; i++){
    for(int j = 0; j < arr.length - i - 1; j++){
      if(arr[j] > arr[j + 1]){
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void insertsort(List<int> arr){
  for(int i = 1; i < arr.length; i++){
    int key = arr[i];
    int j = i - 1;
    while(j >= 0 && arr[j] > key){
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}
