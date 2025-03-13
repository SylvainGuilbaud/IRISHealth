find . -name .DS_Store 
find . -name iris.lck 

find . -name .DS_Store | xargs rm -f
find . -name iris.lck | xargs rm -f