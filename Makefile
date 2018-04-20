
obsdir=$(shell pwd)

OBJDIR=$(obsdir)/obj/
INCLUDE= -I$(obsdir)  -I/usr/inlcude -I/usr/local/include -I .
CCPFLAG= -DLINUX
MYLIB= 
LINKFLAG_START= -g -L/usr/lib -L/usr/local/lib  -Wl,--start-group -ldl -lgtest -lpthread -lsqlite3 -lstdc++ -std=c++11 -lm  
LINKFLAG_END= -Wl,--end-group -L/usr/src/gtest

LIB_SOURCES = CMyfile.cpp\
CPPMyfile.cpp\
MyHtml.cpp\
MyHttp.cpp\
encode_util.cpp\
MyRegex.cpp\
CPPMyRegex.cpp\
Code_convert.cpp\
MySQLsqlite.cpp\


UNITTES_SOURCES = CMyfile_unittest.cpp\
CPPMyfile_unittest.cpp\
CPPMyRegex_unittest.cpp\
MyHtml_unittest.cpp\
MyRegex_unittest.cpp\
MySQLsqlite_unittest.cpp\
unittest_main.cpp

UNITTES_OBJSS=$(patsubst %.cpp,%.cpp.o,$(UNITTES_SOURCES))



UNITTESOBJS=$(addprefix $(OBJDIR),$(UNITTES_OBJSS))  

LIBOBJSS=$(patsubst %.cpp,%.cpp.o,$(LIB_SOURCES))

LIBOBS=$(addprefix $(OBJDIR),$(LIBOBJSS))
MYLIB=my
ifeq ($(my) , lib)
$(obsdir)/obj/libmy.a:$(LIBOBS)
	ar -rvs $(obsdir)/obj/libmy.a $(LIBOBS)
 
else ifeq ($(my),exe)
$(obsdir)/obj/unittest:$(UNITTESOBJS)
	g++  $(UNITTESOBJS) $(CCPFLAG) $(INCLUDE)  $(LINKFLAG_START)  -l$(MYLIB) $(LINKFLAG_END) -L$(obsdir)/obj/  -o $(obsdir)/obj/unittest
endif
$(obsdir)/obj/%.cpp.o : %.cpp
	g++  $(INCLUDE) $(CCPFLAG) $(LINKFLAG_START) $(LINKFLAG_END) $^ -c -o $@
clean:
	rm -rf $(obsdir)/obj/%.*


