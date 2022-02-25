def power(base, exponent, mod):
    # Initiating Data, Variable, and Arrays.
    compare_result = 1
    base2 = base
    binary, results, compare = [], [], []
    amt_of_squares = len(bin(exponent))-2
    # The amount of times that the base will square itself.
    exp_bin_str = str((bin(exponent))[2:])

    # Getting an array "results" of the base doubled length times, mod mod.
    i = 0
    while i < amt_of_squares:
        if i != 0:
            base2 = base2*base2 % mod
        results.append(base2 % mod)
        i = i + 1

    # Getting an array that represents each bit in the exponent in binary, in an array. And then flipping the order of
    # the array.
    i = 0
    while i < amt_of_squares:
        binary.append(exp_bin_str[i])
        i = i + 1
    binary = binary[::-1]

    # Comparing "binary" to "results" and putting all of the corresponding items from "results" into "compare" if the
    # corresponding spot in "binary" has a 1
    i = 0
    while i < amt_of_squares:
        if binary[i] == '1':
            compare.append(results[i])
        i = i + 1

    # Multiply all terms in the "compare" array
    i = 0
    while i < len(compare):
        compare_result = compare_result * compare[i]
        i = i + 1
    print(compare_result % mod)
