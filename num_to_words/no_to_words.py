def number_to_words(num):

    words_below_twenty = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                            "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    
    tens_words = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    
    
    thousands = ["", "Thousand", "Million", "Billion"]
    
    def convert_chunk(chunk):
        if chunk == 0:
            return ""
        result = ""
        if chunk >= 100:
            result += words_below_twenty[chunk // 100] + " Hundred "
            chunk %= 100
        if chunk >= 20:
            result += tens_words[chunk // 10] + " "
            chunk %= 10
        if chunk > 0:
            result += words_below_twenty[chunk] + " "
        return result
    
    if num == 0:
        return "Zero"
    
    words = ""
    chunk_index = 0
    
    while num > 0:
        chunk = num % 1000 
        if chunk != 0:
            words = convert_chunk(chunk) + thousands[chunk_index] + " " + words
        num //= 1000
        chunk_index += 1
    
    return words.strip()


user_input = int(input("enter a number : "))

converted_ans = number_to_words(user_input)

print(converted_ans)