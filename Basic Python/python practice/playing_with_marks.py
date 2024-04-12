def sorting_key2(string):
    sub=string.split('_')
    return int(sub[2])
def sorting_key1(string):
    sub=string.split(' ')
    return int(sub[1])
f=open('buggy_marksheet.txt','r')
marks=f.read()
input=marks.splitlines()
output=sorted(input,key=lambda x:sorting_key1(x),reverse=True)
output=sorted(output,key=lambda x:sorting_key2(x))
for x in output:
    print(x)