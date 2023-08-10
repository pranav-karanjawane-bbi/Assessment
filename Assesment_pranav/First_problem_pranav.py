class Solution:
def restoreMatrix(self, rowSum: List[int], colSum: List[int]) -> List[List[int]]:
    m=len(rowSum)
    n=len(colSum)
    arr=[[0]*n for _ in range(m)]
    i,j=0,0
    while(i<m and j<n):
        arr[i][j]=min(rowSum[i],colSum[j])
        rowSum[i]-=arr[i][j]
        colSum[j]-=arr[i][j]
        j+=1
        if rowSum[i]==0:
            i+=1
            j=0
        if colSum==n:
            j=0
    return arr