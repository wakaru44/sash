# Super Advanced Search - for your command history


A script to search you history back with more than one token to filter, and in
more than one file.

In this example, imagine you have many application,database and web servers in
different environments like "production" and "testing".
You could filter the commands and get just what you need right now
```
$ sas ssh prod app
ssh ec2-user@app01.prod.example.com
ssh ec2-user@app02.prod.example.com
ssh ec2-user@app03.prod.example.com
```

## Usage

Just call sas, and specify all the sub-strings you want to filter out.



"""

def force_write_history():
    """
    There must be a way

    In bash: 
    
        history -a

    But inside a python shell will be hard to get out to the parent

    In zsh:

        
    """

## Development

see  NOTES.md
