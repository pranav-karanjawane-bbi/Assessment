def countsmallnum(nums):
    ans = []
    for i in range(len(nums)):
        val=nums[i]
        count = 0
        for j in range(len(nums)):
            
            if nums[j]<val:
                count += 1 
        ans.append(count)
    return ans
    
nums =[]
input_str = input("enter numbers : ")
input_list = input_str.split()
for num in input_list:
    nums.append(int(num))
    
ans = countsmallnum(nums)
print(ans)
