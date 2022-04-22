# .win
Windows PowerShell Environment Settings

# PowerShell Profile, Public

Powershell Profile Public

## Description

A powershell profile with alias and useful functions to make terminal life a bit simpler. 
The most useful short handed commands here are the 'b' and 'sb' commands. 
```
#b allows you to open the public profile with 'b' and quicky edit the settings using vim.exe in windows.
#sb will show the command to reload your profile with the updated changes in vim.
#pb will open the public powershell profile settings to modify in vim.
```

## Getting Started

### Dependencies

* Any version of powershell
* Recommend powershell 7.x using latest Stable Build of Windows Terminal
* I use Vim as my terminal text editor. You would need to install VIM and make sure vim.exe is in your Users or System's Path Variable

```
$ENV:Path
WARNING: Please be cautious when editing environment variables in your system, to be safe use User PATH, not System.
#Example:<other path data> C:\Program Files (x86)\Vim\vim82\<other path data>
```


 

### Executing program

* Load powershell, edit your $PROFILE settings to load the script

```
>notepad $PROFILE
ADD:
 #Set variable to path of cloned repo, .win folder.
 $powershell_work_directory = "C:\path\to\.win\"
 #Loads public profile stored in the .win directory
 . $powershell_work_directory
```
* Restart powershell

## Help

Any advise for common problems or issues.
```
Google errors, drop me comment with questions. 
```

## Other Neat commands to include
```
function proxy {
        ssh -D port -q -C -N host@server
}

function weather{
        cls
        (curl http://wttr.in/"Dayton, Ohio" -UserAgent "curl" ).Content  -Replace 'Follow|@igor_chubin|for|wttr.in|in|updates',''
}

function moon{
        (curl wttr.in/moon).content -Replace 'Follow|@igor_chubin|for|wttr.in|in|updates',''
}

function webdev { wt -w 0 nt  --tabColor "#33ffd4" --title "Web-Dev!" ssh user@host}
function webprod { wt -w 0 nt  --tabColor "#fd0905" --title "Web-Prod!" ssh user@host}

function deploywebdev{
        ssh user@host 'cd /var/www/html; git fetch;git pull'
}


```

## Authors

Contributors names and contact info

ex.  
ex.  

## Version History

* 0.2
    * 
* 0.1
    * Initial Release

## License

This project is licensed under the [new_name] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc. 
