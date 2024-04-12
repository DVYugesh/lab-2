string=input()
order=input()
a=list(map(int,order.split()))
b=sorted(a)
for i in range(len(string)):
    if b[i]!=i:
        print("Invalid Input")
        exit()
for x in a:
    print(string[x],end='')
print('')