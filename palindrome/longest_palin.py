def is_palindrome(s):
    return s == s[::-1]

def is_longest_palindrome(s):
    max_len = 0
    n = len(s)
    largest_palindrome = ""
    
    for i in range(n):
        for j in range (i,n):
            substring = s[i:j+1]
            
            if is_palindrome(substring) and len(substring) > max_len:
                max_len = len(substring)
                largest_palindrome = substring
    
    return largest_palindrome
                


input_string = input("Enter a string: ")
ans = is_longest_palindrome(input_string)

if ans:
    print("The largest palindrome found is : ", ans)
else:
    print("No palindrome found!")
