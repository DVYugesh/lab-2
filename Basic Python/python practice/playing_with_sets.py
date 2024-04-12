set=set()
f=open('q2-input.txt',"r")
text=f.read()
lines=text.splitlines()
for line in lines:
    elements=line.split(',')
    for element in elements:
        set.add(int(element))
print(len(set))
