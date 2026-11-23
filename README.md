# FileIntegriy Checker 

A Python tool that calculate the SHA-256 hash of files and stores them in 
a JSON database to detect if file have been changed 

#### Features 

- Hashes single file or entire directoreis.
- Stores filename --> hash pairs in a 'report.json' file.
- verifies if a file has been changed, added or deleted.


### Prerequisites 

-*** Python 3.6+*** installed on your system.
- No external libraries are required! The project uses only 
standard libraries ('hashlib','json','os','pathlib').


### How to Run 

1. Clone this repository.
2. Run the script:
    '''bash 
    python3 FileIntegrity.py 

###Example Output : 
 
$python3 FileIntegrity.py 
    File saved successfully >> at the first time 
    
    Your file hash was stored in my data base >> if the file is not changed 
    every thing is good for this file {filename}
    
    Your file hash was stored in my data base >> if you file is changed 
    something went wrong with this file {filename }


#### Futur imporovement 

- You can make the UI of this nicer 
- make the file to store report file every where that user want 
- make one GUI for the user interface 

