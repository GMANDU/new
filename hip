#include <stdio.h>

void heapify(int arr[], int n, int i) {
    int largest = i; // 루트
    int left = 2 * i + 1; // 왼쪽 자식
    int right = 2 * i + 2; // 오른쪽 자식

    // 왼쪽 자식이 루트보다 크면
    if (left < n && arr[left] > arr[largest])
        largest = left;

    // 오른쪽 자식이 현재 가장 큰 노드보다 크면
    if (right < n && arr[right] > arr[largest])
        largest = right;

    // 가장 큰 노드가 루트가 아니면 교체
    if (largest != i) {
        int temp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = temp;

        heapify(arr, n, largest);
    }
}

// 힙 정렬 함수
void heapSort(int arr[], int n) {
    // 배열을 힙 구조로 만듭니다
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);

    // 하나씩 요소를 힙에서 꺼내 배열 끝으로 
    for (int i = n - 1; i > 0; i--) {
        // 현재 루트(가장 큰 값)를 배열 끝으로 
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;

        heapify(arr, i, 0);
    }
}

// 배열을 출력하는 함수
void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {12, 11, 13, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("정렬 전 배열: \n");
    printArray(arr, n);

    heapSort(arr, n);

    printf("정렬 후 배열: \n");
    printArray(arr, n);

    return 0;
}
