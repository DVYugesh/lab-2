Objects1 := comp.o find.o ops.o

Objects2 := add.o rem.o

Objects3 := main1 main2 main3 main4 main5 main6 main7 main8 main9

all : $(Objects1) $(Objects2) $(Objects3)

.PHONY: all

$(Objects1): %.o: src/src1/%.cpp
	g++ -c -Wall --std=c++17 $^

$(Objects2): %.o: src/src2/%.cpp
	g++ -c -Wall --std=c++17 $^

$(Objects3): main%: main/main%.cpp $(Objects1) $(Objects2)
	g++ -Wall --std=c++17 $^ -o $@ 	

clean: 
	rm -f $(Objects1) $(Objects2) $(Objects3)
