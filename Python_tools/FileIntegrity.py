#Librareis that is used in this project 

import hashlib 
import json 
import os 
from pathlib import Path



#Helping Function 

def help():
   print("""
    willcom to File Integrity Checker Helping page: 

    

    This is one tool that can chack your files and stor all hashes in one file 
    if you want to check that file for any deletion or other changes you use it ...
    
    This tool can chack one spacific file or one directory just if you want to chack 
    one directory you must give the exact path from the current path that FileIntegrity 
    chacker exist 

    This tool do not need to make the database for this, itself make one database file 
    by the name of "report.json" and store your file name and it is hashes in it 
    and save it in the directory or path that you fileIntegrity chacker is running 



    :)
  
    """)


# Show Function that show the UI of this tool 

def show():
    print("""
     willcom to File Integrity Checker :)



        h    shows the helping menue for you 
        p    you can spacify your files path if you have more that one file or file in other directories  
    """)


#Hashing Function that make the file and generate it is hashes.

def hash(filepath,chunk_size=8192):
    h = hashlib.sha256()
    with open (filepath, 'rb') as r :
        filename = filepath
        for chunk in iter(lambda: r.read(chunk_size),b""):
            h.update(chunk)
    return h.hexdigest()


#Compare Function: this function take the path first compare the hashes if exist chacke the integrity 
#if not exist in the file it will take the name of file with it is hashes and then stor that in the file  
def compare(dic):
   
    if os.path.exists('report.json'):
        with open('report.json','r') as file:
            try:
                exist_file = json.load(file)
            except json.JSONDecodeError:
                exist_file= {}
    else:
        exist_file={}

    my_dic= ", ".join(dic.keys()) 
    allkey = list(exist_file.keys())
    
    if my_dic in allkey:
        print("Your file hash was stored in my data base ")
        if dic.get(my_dic) ==  exist_file.get(my_dic):
            print(f"every thing is good for this file {my_dic}")
        else:
            print(f"something went wrong with this file {my_dic}")
            exit
    else:
        exist_file.update(dic)

        with open ('report.json','w') as file:
            json.dump(exist_file,file,indent=2)
            print("data saved successfully!! ")






# The main part of my project is started from here 



show()
user_p = input("Please Enter: ")
if user_p == 'h':
    help()
    user_path = input("Please Enter Your path: ")
elif user_p =='o' :
    user_path = input("Please Enter your path: ")
else:
    print("you type invaled Charecter Please Enter small 'p' for path  or small 'h' for help ")
    user_path = input ("Enter you input: ")
    
path = Path(user_path)
my_dic = {}

if path.is_file():
    my_dic[user_path] = hash(user_path)
    compare(my_dic)
elif path.is_dir():
    if os.path.isdir(user_path):
        for filename in os.listdir(user_path):
            my_diic = {}
            full_path = os.path.join(user_path,filename)

            if os.path.isfile(full_path):
                my_diic[full_path] = hash(full_path)  
                compare(my_diic)   
            else:
                print(f"It is not one file >>>>{full_path}<<<< if you want to check this you can give me the path of that ....")
    else:
        print("that is not a valid directory .")

else:
    print("it is not dir and file ")

