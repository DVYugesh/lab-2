def primecheck(n):
    found=True
    k=2
    while k<n:
        if n%k == 0:
            found =False
            break
        k=k+1
    return found
k=[2,3]
def kextend(q):
    while q>len(k):
        if (k[-1]-k[-2]==2):
            k.append(k[-1])
        else:
            found=False
            x=k[-1]
            while found is False:
                x=x+1
                found=primecheck(x)
            k.append(x)

f=open("q1-test_input.txt","r")
num=int(f.readline())
for i in range(num):
    query=int(f.readline())
    kextend(query)
    print(k[query-1])
